term.clear()
term.setCursorPos(1,1)
os.setComputerLabel("Digging Team Coordinator")

-- The mining turtle table
local miningTurtle = {
  ["computercraft:turtle_expanded"] = true,
}

local equipment = {
  ["computercraft:peripheral"] = true,
  [1] = true,
}

local diskDrive = {
  ["computercraft:peripheral"] = true,
}


-- Find the item in inventory
print("Iterate through inventory:")
for i=1,16 do
  turtle.select(i)
  local item = turtle.getItemDetail(i)
  if item then
    if miningTurtle[ item.name ] then
      print("Mining Turtle at inventory slot " .. i .. " (" .. item.count .. ")")
      turtle.transferTo(1) -- Move the turtle to slot 1
      elseif equipment[ item.name ] and equipment[ item.damage ] then
        turtle.equipLeft()
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
  if diskDrive[ data.name ] then
    for i,v in pairs(fs.list("/disk")) do
      print("Deleting Disk Contents")
      fs.delete(fs.combine("/disk/", v))
    end
    if amountOfTurtles < 3 then
      print("Using One Man Digging Team")
      fs.copy("teams/oneTeam.lua", "/disk/startup.lua")
      print("Installation of program complete.")
    elseif amountOfTurtles >= 3 and amountOfTurtles < 9 then
      print("Using Three Man Digging Team")
      fs.copy("teams/threeTeam.lua", "/disk/startup.lua")
      print("Installation of program complete.")
    elseif amountOfTurtles >= 9 then
      print("Using Nine Man Digging Team")
      fs.copy("teams/nineTeam.lua", "/disk/startup.lua")
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
if amountOfTurtles < 3 then
  print("Turtle has been placed")
  turtle.place()
  print("Starting Turtle...")
  peripheral.call("front", "turnOn")
elseif amountOfTurtles >= 3 and amountOfTurtles < 9 then
  for i=1,3 do
    print("Turtle has been placed")
    while turtle.place() == false do end
    print("Starting Turtle...")
    peripheral.call("front", "turnOn")
  end
elseif amountOfTurtles >= 9 then
  for i=1,9 do
    print("Turtle has been placed")
    while turtle.place() == false do end
    print("Starting Turtle...")
    peripheral.call("front", "turnOn")
  end
end

-- Rednet 
while turtle.detect() == true do end
os.sleep(3)
rednet.open("left")
rednet.broadcast("Start Mining")
print("Sending Signal...")
rednet.close("left")
