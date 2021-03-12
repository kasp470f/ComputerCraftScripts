os.setComputerLabel("Digger")
turtle.refuel()

length = 0

function mine()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()

    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
end

function screen()
    term.clear()
    term.setCursorPos(1,1)
    print("Fuel Level: " .. turtle.getFuelLevel() .. " meters")
    print("Tunnel Length: " .. length+1)
end

turtle.forward()
for i=1,3 do
    if not turtle.detect() then 
        turtle.forward() 
        break 
    else
        turtle.up()
    end
end

while true do
    screen()
    if turtle.getFuelLevel() < 2 then
        print("Missing Fuel?!")
        while turtle.getFuelLevel() < 2 do 
            turtle.refuel()
        end
    end
    turtle.refuel()
    screen()
    mine()
    length = length + 1 
end