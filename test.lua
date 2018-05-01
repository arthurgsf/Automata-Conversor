require "automato"
local a = automata.new()
a:getE()
a:getQ()
a:getF()
a:getD()

local fecho = a.Q[1]:closure(a.D)

for k, v in pairs(fecho)do
    print(v.id)
end