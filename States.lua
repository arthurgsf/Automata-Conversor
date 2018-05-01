State = {}

function State.new(id)
    local s = {}
    
    --Attributes
    s.id = id;

    --Methods
    s.isFinal = State.isFinal
    s.next = State.next
    s.fecho = State.fecho
    return s
end

function State.isFinal(self, F)
    for i, v in pairs(F) do
        if (v == self.id) then
            return true;
        end
    end
    return false
end

function State.next(self, E, D)
    return D[self.id][E];
end

function State.closure(self, D)
    local fecho = {};
    local i = 1;
    
    fecho.insert(self);

    while (fecho[i]:next('&', D)~=nil) do
        i = i+1;
        fecho[i] = fecho[i]:next('&', D);
    end
end