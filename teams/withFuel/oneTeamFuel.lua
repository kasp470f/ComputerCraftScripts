os.setComputerLabel("Digger ")
turtle.refuel()

local length = 0

function mine()
    if turtle.detect() then
        turtle.dig()
    end

    if turtle.forward() then
        -- Digging Pattern (left-up/right-down)
        --- Dig left side
        turtle.turnLeft()
        turtle.dig()
        turtle.digUp()
        turtle.up()
        turtle.dig()
        turtle.digUp()
        turtle.up()
        turtle.dig()
        --- Dig right side
        turtle.turnRight()
        turtle.turnRight()
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.turnLeft()
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
    if turtle.getFuelLevel() < 4 then
        print("Missing Fuel!")
        while turtle.getFuelLevel() < 4 do 
            turtle.suckDown(32)
            turtle.refuel()
        end
    end
    turtle.refuel()
    screen()
    mine()
end