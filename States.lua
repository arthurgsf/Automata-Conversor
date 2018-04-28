State = {}

State.id = nil;
State.isFinal = false;

function State.newState(self, id)
    self.id = id;
end

function State.isFinal(self, F)
    for i, v in pairs(F) do
        if (v == self.id) then
            return true;
        end
    end
end

function State.next(self, e, D)
    return D[self.id][e];
end

function State.fecho(self, D)
    local fecho = {};
    local i = 1;
    fecho.insert(self.id);

    while (fecho[i]:next('&', D)~=nil) do
        i = i+1;
        fecho[i] = fecho[i]:next('&', D);
    end
end