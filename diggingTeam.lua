os.setComputerLabel("Digging Team Coordinator")

for i=1,16 do
    turtle.select(i)
    itemName = turtle.getItemDetail(i)
    if item then 
        print(itemName)
        if itemName.name == "computercraft:turtle" then
            print("Found turtles")
            break
        end
    end
end

