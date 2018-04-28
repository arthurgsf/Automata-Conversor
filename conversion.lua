

function isFinal(self, q)
    for i, v in pairs(self.F) do
        if (q == v) then
            return true;
        end
    end
end

function emptyfecho(q,D)
    local fecho = {};
    local count = 1;

    fecho[1] = 1;
    for i, u in pairs(D[q]) do
        if(u == '&') then
            fecho[n] = delta(q, n); --use a function that will be implemented in future 
        
        end
    end
      
end