using HorizonSideRobots

r = Robot("untitled.sit", animate=true)

function gl!(r)
    inverse(side) = HorizonSide(mod(Int(side) + 2, 4))
    for side1 in (Ost, West)
        for side2 in (Sud, Nord)
            x = hod!(r, side1, side2)
            obratno!(r, inverse(side1), inverse(side2), x)
        end
    end
    putmarker!(r)

end

function hod!(r, side1, side2)
    steps = 0
    while !isborder(r, side1) && !isborder(r, side2)
        move!(r, side1)
        steps += 1
        move!(r, side2)
        putmarker!(r)
        steps += 1
    end
    return steps
end

function obratno!(r, side1, side2, steps)
    while steps != 0 
        move!(r, side2)
        steps -= 1
        move!(r, side1)
        steps -= 1
    end
end

gl!(r)