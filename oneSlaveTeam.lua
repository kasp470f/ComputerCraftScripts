os.setComputerLabel("Slave Digger #1")
turtle.refuel()

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
    print("Tunnel Length: " .. length+1)
end



while true do
    if turtle.getFuelLevel() < 2 then
        print("Missing Fuel?!")
        while turtle.getFuelLevel() < 2 do 
            turtle.refuel()
        end
    end
    screen()
    turtle.refuel()
    mine()
    length = length + 1 
end