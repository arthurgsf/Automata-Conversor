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