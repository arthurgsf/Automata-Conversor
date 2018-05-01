State = {}

--[[
    function State.new(id)
    Instantiates a new State object, with the id passed as argument.
]]
function State.new(id)
    local s = {}
    
    --Attributes
    s.id = id;

    --Methods
    s.isFinal = State.isFinal
    s.next = State.next
    s.closure = State.closure
    return s
end

--[[
    function State.isFinal(self, F)
    Returns wether a state is final or not
]]
function State.isFinal(self, F)
    for i, v in pairs(F) do
        if (v == self.id) then
            return true;
        end
    end
    return false
end

--[[
    function State.next(self, symbol, D)
    Returns the next states reachable reading the symbol
]]
function State.next(self, symbol, D)
    return D[self.id][symbol];
end

--[[
    function State.closure(self, D)
    Returns the next set of states reachable reading the symbol
]]
function State.closure(self, D)

    local closure = {self}
    local states = closure[#closure]:next('&',D)
    closure = union(closure, states)

    while(#states>0)do

        local temp = states[#states]:next('&',D)
        table.remove(states)
        closure = union(closure, temp)
        states = union(states, temp)

    end

    return closure

end