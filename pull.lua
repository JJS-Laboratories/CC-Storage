local chests = {} --# Our wrapped objects table
local count1 = { peripheral.find("ironchest:gold_chest") }
for count=0, #count1 do --# Assuming that we have 6 glowstone illuminators, because we start counting at 0 rather than 1
  chests[count] = peripheral.wrap("ironchest:gold_chest_"..count) --# The .. operator will concatenate (join) the "glowstone_illuminator_" string with the count
end
chestOut = peripheral.find("ironchest:iron_chest")
local args = {...}

found1 = 0
found3 = 0

print("Beginning process! (Slow)")
for i=0,#chests do --# This loop will go from the first element of the table to the last element of the table. In this case, just 2 elements
    list1 = chests[i].list()
    i1 = 1
    print("Searching "..i.."/"..#count1)
    repeat
        if list1[1] ~= nil then
            if list1[i1] ~= nil then
                if list1[i1]["name"] == args[1] then
                    if found3 >= tonumber(args[2]) then
                        done1 = true
                        break
                    end
                    if args[2] ~= nil then
                        found3 = found3 + chestOut.pullItems(peripheral.getName(chests[i]), i1, tonumber(args[2])-found3)
                    else
                        found3 = found3 + chestOut.pullItems(peripheral.getName(chests[i]), i1)
                    end
                    found1 = found1+1
                    if args[2] ~= nil then
                        if found3 < tonumber(args[2]) then
                            done1 = false
                        else
                            if found3 >= tonumber(args[2]) then
                                done1 = true
                                break
                            end
                        end
                    end    
                end
            end
            i1 = i1+1
        else
            break
        end
    until i1 == chests[1].size() + 1 or done1 == true
end

print("Found "..found1.." Slot with "..args[1])