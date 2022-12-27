using HorizonSideRobots

function dvoynaya!(robot, side)
  if !isborder(robot,side)
    move!(robot,side)
    dvoynaya!(robot, side)
  else
    move!(robot,inverse(side))
    move!(robot,inverse(side))
   end
end