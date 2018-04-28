--[[
    chekcs if str is an element of the table "arr"
]]
function find(arr,str)
    for k,v in pairs(arr)do
        if(v == str)then 
            return true
        end
    end
    return false
end