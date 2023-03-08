--[[#INIT_MESSAGE]]
--[[#INTERNAL_TEMPLATE]]
print("hello")
--[[#TRIGGER]]
for i=1,1--[[$MAX_COUNT]] do
    print(("Count: %d"):format(i--[[=I_MODIFY]]))
end