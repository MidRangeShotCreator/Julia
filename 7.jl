using HorizonSideRobots
r = Robot("untitled.sit",animate=true)

function num_steps_along!(r, direct)
    num_steps=0
    while isborder(r,Nord)
        move!(r, direct)
        num_steps+=1
    end
    return num_steps
end

num_steps_along!(r, Ost)