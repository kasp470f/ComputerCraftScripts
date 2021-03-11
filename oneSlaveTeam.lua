os.setComputerLabel("Slave Digger #1")
turtle.refuel()

print("Please enter the length of the tunnel?")
lengthto = tonumber(io.read())
length = 0

function mine()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()

    for i=1,3 do
        turtle.turnLeft()
        turtle.dig()
        turtle.turnRight()
        turtle.turnRight()
        turtle.dig()
        turtle.turnLeft()
        if i < 3 then
            turtle.digUp()
            turtle.up()
        else
            turtle.down()
            turtle.down()
        end
    end
end

function screen()
    term.clear()
    term.setCursorPos(1,1)
    print("Fuel Level: " .. turtle.getFuelLevel() .. " meters")
    print("Tunnel Length: " .. length+1 .. " / " .. lengthto)
end

while lengthto > length do
    screen()
    turtle.refuel()
    mine()
    length = length + 1 
end
print("Finshed Tunnel!")