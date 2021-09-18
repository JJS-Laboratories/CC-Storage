local chests = {} --# Our wrapped objects table
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
for count=0, tablelength(peripheral.find("ironchest:gold_chest")) do --# Assuming that we have 6 glowstone illuminators, because we start counting at 0 rather than 1
  chests[count] = peripheral.wrap("ironchest:gold_chest_"..count) --# The .. operator will concatenate (join) the "glowstone_illuminator_" string with the count
end
chestOut = peripheral.find("ironchest:iron_chest")

i1 = chestOut.size()
i2 = 1
repeat
    i3 = 0
    repeat
        chests[i3].pullItems(peripheral.getName(chestOut),i2)
        i3 = i3+1
    until chestOut.getItemDetail(i2) == nil
    i2 = i2+1
until i2 == i1+1
print("Done")