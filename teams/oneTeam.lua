term.clear()
term.setCursorPos(1,1)
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
        while turtle.up() == false do end
        turtle.dig()
        turtle.digUp()
        while turtle.up() == false do end
        turtle.dig()
        --- Dig right side
        turtle.turnRight()
        turtle.turnRight()
        turtle.dig()
        while turtle.down() == false do end
        turtle.dig()
        while turtle.down() == false do end
        turtle.dig()
        turtle.turnLeft()
        length = length + 1
    end
end

function screen()
    term.clear()
    term.setCursorPos(1,1)
    print("Turtle ID: " .. os.getComputerID())
    print("Tunnel Length: " .. length)
end

turtle.forward()
print("Waiting for signal...")
rednet.open("right")
local senderId, message, protocol = rednet.receive()
while message ~= "Start Mining" do senderId, message, protocol = rednet.receive() end
print("Signal received.")

while true do
    screen()
    screen()
    mine()
end