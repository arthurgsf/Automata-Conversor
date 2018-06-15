require "States"

function copy(stateArray)
    local arr = {}
    for k,v in pairs(stateArray) do
        newS = State.new(v.id)
        table.insert(arr,newS)
    end
    return arr
end

function readfile(name)
    local a = automata.new()
    local f = assert(io.open(name , "r"),"file does not exists")
    local i = 1
    a.D = {}
    for line in f:lines() do
        if (i == 1) then
            a:getE(line)
        elseif (i == 2)then
            a:getQ(line)
        elseif (i == 3)then
            a:getF(line)
        else
            a:getD(line)
        end
        i = i + 1
    end
    f:close()
    return a
end
--[[
    convert a string to an array where every index matches onde character
]]
function strtoarray(str)
    local arr = {}
    for i = 1 , #str do
    	local a = str:sub(i):match("%a")
    	table.insert(arr , a)
    end
    return arr
end

function readStates(str , Q)
    local states = {}
    for id in string.gmatch(str, "%a+%d+")do
        local state = find(Q, id)
        if(state and not find(states, state))then
            table.insert(states, state)
        end
    end
    return states
end

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
        if(not find(a,v.id))then
            table.insert(c,v)
        end
    end

    return c
end
