using HorizonSideRobots
robot = Robot("untitled.sit", animate=true)

function along_down!(robot)
    putmarker!(robot)
    num_steps_Sud = 0
    k = false
    while !isborder(robot, Sud)
        move!(robot, Sud)
        num_steps_Sud += 1
        if k == true
            putmarker!(robot)
            k = false
        else
            k = true
        end
    end
    
    f = true
    num_steps_West = 0
    while !isborder(robot, West)
        if ismarker(robot)
            f = false
        end
        move!(robot, West)
        num_steps_West += 1
        if f == true
            putmarker!(robot)
            f = false
        else 
            f = true
        end
    end
    return num_steps_Sud, num_steps_West
end

function chess!(robot, side)
    if ismarker(robot)
        k = false
    else
        k = true
    end
    while !isborder(robot, side)
        move!(robot, side)
        if k == true
            putmarker!(robot)
            k = false
        else
            k = true
        end
    end
    if isborder(robot, Nord) && isborder(robot, side)
        along_down_1!(robot)
    else
        if !ismarker(robot)
            move!(robot, Nord)
            putmarker!(robot)
        else
            move!(robot, Nord)
        end
        chess!(robot, inverse(side))
    end
end

function along_down_1!(robot)
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

function cross!(robot)
    steps_Nord, steps_Ost = along_down!(robot)
    chess!(robot, Ost)
    along!(robot, Nord, steps_Nord)
    along!(robot, Ost, steps_Ost)
end

along!(robot, side, num_steps) = for _ in 1:num_steps move!(robot, side) end

inverse(side) = HorizonSide((Int(side) + 2) % 4)


cross!(robot)