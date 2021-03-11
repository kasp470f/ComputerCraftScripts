if turtle.getFuelLevel() == 0 then turtle.refuel(5) end
term.clear()
term.setCursorPos(1,1)
os.setComputerLabel("Digging Team Coordinator")

-- The mining turtle table
local miningTurtle = {
  ["computercraft:turtle"] = true,
  [1] = true,
}

local fuel = {
  ["minecraft:coal"] = true,
  ["minecraft:stick"] = true,
}

local diskDrive = {
  ["computercraft:peripheral"] = true,
  [5] = true,
}


-- Find the item in inventory
print("Iterate through inventory:")
for i=1,16 do
  turtle.select(i)
  local item = turtle.getItemDetail(i)
  if item then
    if miningTurtle[ item.name ] and miningTurtle[ item.damage ] then
      print("Mining Turtle at inventory slot " .. i .. " (" .. item.count .. ")")
      turtle.transferTo(1) -- Move the turtle to slot 1
    end
  end
end

-- Total of materials
turtle.select(1)
local amountOfTurtles = turtle.getItemCount()

term.clear()
term.setCursorPos(1,1)
print("Turtles found: " .. amountOfTurtles)
if amountOfTurtles == 0 then
  print("There are no turtles.")
  error()
end

-- Disk drive installation
--- Installation of program
turtle.forward()
turtle.turnLeft()
local success, data = turtle.inspect()
if success then
  if diskDrive[ data.name ] and diskDrive[ data.metadata ] then
    for i,v in pairs(fs.list("/disk")) do
      fs.delete(fs.combine("/disk/", v))
    end
    if amountOfTurtles <= 3 then
      print("Using One Man Digging Team")
      fs.copy("teams/oneSlaveTeam.lua", "/disk/startup.lua")
      print("Installation of program complete.")
    end
  end
else
  print("No Disk Drive found!")
end

turtle.turnRight()
turtle.back()
term.clear()
term.setCursorPos(1,1)


-- Turtles start
turtle.place()
print("Turtle has been placed")
print("Starting Turtle...")
peripheral.call("front", "turnOn")
