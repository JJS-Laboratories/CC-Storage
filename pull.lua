local args = {...}
if args[1] == nil then
    print("Usage: pull <id> <count(1-64>")
    return
end


local chests = {} --# Our wrapped objects table
local pretty = require "cc.pretty"
local count1 = { peripheral.find("ironchest:gold_chest") }
for count=0, #count1 do --# Assuming that we have 6 glowstone illuminators, because we start counting at 0 rather than 1
  chests[count] = peripheral.wrap("ironchest:gold_chest_"..count) --# The .. operator will concatenate (join) the "glowstone_illuminator_" string with the count
end
chestOut = peripheral.find("ironchest:iron_chest")

done1 = false
found1 = 0
found3 = 0



print("Beginning process! (Slow)")
local functionTable = {}
for i=0,#chests do --# This loop will go from the first element of the table to the last element of the table. In this case, just 2 elements
    table.insert(functionTable, function()
        i1 = 1
        if found3 < (tonumber(args[2]*1)) and done1 == false then
            print("Searching slots "..i1.." to "..chests[i].size().." in chest "..i)
            for i1=1,chests[i].size() do
                list1 = chests[i].list()
                if list1[i1] ~= nil then
                    if list1[i1]["name"] == args[1] and done1 == false then
                        found3 = found3+chestOut.pullItems(peripheral.getName(chests[i]),i1,(tonumber(args[2])*1))
                        done1 = true
                        break
                    end
                end
            end
        end
    end)
end
parallel.waitForAll(table.unpack(functionTable))
print("Pulled "..found3.."/"..args[2])
if found3 < tonumber(args[2]) then
    shell.execute("pull",args[1],tostring(tonumber(args[2])-found3))
end