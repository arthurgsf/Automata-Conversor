--[[
    checks if str is a state of table Q, or is contained in table Q
]]
function find(q,str)
    for k,v in pairs(q)do
        if(type(v)=="table")then
            if(v.id == str)then 
                return v
            end
        elseif(type(v)=="string")then
            if(v == str)then 
                return true
            end
        end
    end
    return false
end

--[[
    returns Union between a and b
]]

function union(a , b)
    local c = {}
    for k,v in pairs(a)do
        table.insert(c,v)
    end
    for k,v in pairs(b)do
        if(not find(a,v))then
            table.insert(c,v)
        end
    end
    return c
end