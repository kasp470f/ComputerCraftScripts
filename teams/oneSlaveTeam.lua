os.setComputerLabel("Slave Digger")
turtle.refuel()

length = 0

function mine()
    if turtle.detect() then
        turtle.dig()
    end

    if turtle.forward() then
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
        length = length + 1
    end
end

function screen()
    term.clear()
    term.setCursorPos(1,1)
    print("Fuel Level: " .. turtle.getFuelLevel() .. " meters")
    print("Tunnel Length: " .. length+1)
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
end