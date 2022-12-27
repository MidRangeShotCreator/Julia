function along!(r, direct, num_steps)::Nothing
    for _ in 1:num_steps
    move!(r, direct)
    end
end


function try_move!(r, side)::Bool
    if isborder(r, side)
        return false
    end
    move!(r, side)
    return true
end


function num_steps_along!(r, side)::Int
    num_steps = 0
    while try_move!(r, side)
        num_steps += 1
    end
    return num_steps
end

HSR.isborder(robot,direct)=isborder(robot.robot,direct(robot.direct))

HSR.putmarker!(robot) = putmarker!(robot.robot)

HSR.ismarker(robot) = ismarker(robot.robot)

inverse!(side)=HorizonSide(mod(Int(side)+2,4))

right(side::HorizonSide)=HorizonSide(mod(Int(side)-1,4))

left(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))