require "automata"
local a = automata.new()
a:getE()
a:getQ()
a:getF()
a:getD()

local newF = a:getNewF()

for k, v in pairs(newF)do
    print(v.id)
end
