local length = 0

function mine()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()
    length = length + 1 
end

function screen() -- Screen reset
    term.clear()
    term.setCursorPos(1,1)
    print("Tunnel Length: " .. length+1)
end

-- Lineup
while turtle.forward() == false do end
turtle.turnLeft()
if turtle.forward() then
    turtle.turnRight()
else 
    turtle.turnRight()
    turtle.turnRight()
    if turtle.forward() then
        turtle.turnLeft()
    else 
        turtle.turnLeft()
    end
end
term.clear()
term.setCursorPos(1,1)
turtle.up()
turtle.up()
print("Waiting for signal...")
rednet.open("right")
rednet.receive()


while true do
    screen()
    screen()
    mine()
end
