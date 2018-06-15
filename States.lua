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
        if (v.id == self.id) then
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
    if (D[self.id][symbol] ~=nil) then
        return copy(D[self.id][symbol]);
    else
        return {}
    end
end

--[[
    function State.closure(self, D)
    returns all states reachable by performing only e-moves
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

--[[
    function State.extClosure(stateArray , D)
    return extended closure for a finite set of satates
]]

function State.extClosure(stateArray , D)
    local extClosure = {}

    for k, state in pairs(stateArray) do
        local temp_closure = state:closure(D)
        extClosure = union(extClosure, temp_closure)
    end

    return extClosure
end
