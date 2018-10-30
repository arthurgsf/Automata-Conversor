require "automata"
require "func"

print("Insira os arquivos separados por espaços")
local inputs = io.read()

for filename in inputs:gmatch("[^%s]*") do

    --[[
        Lê e armazena o autômato
    ]]
    local afe = readfile(filename)

    --[[
        Converte o autômato
    ]]
    local afn = afe:toAfn()

    --[[ 
        Abre o arquivo de saída
    ]]
    local f = io.open(filename.."-converted", "w")

    --[[
        Escreve o automato convertido no arquivo de saída
    ]]
    local temp = ""

    for k,v in pairs(afn.E) do
        temp = temp..v
    end
    temp = temp.."\n"

    for k,v in pairs(afn.Q) do
        temp = temp..v.id
    end
    temp = temp.."\n"

    for k,v in pairs(afn.F) do
        temp = temp..v.id
    end
    temp = temp.."\n"

    for k, state in pairs(afn.Q) do
        temp = temp..state.id.." - "
    
        for i, symbol in pairs(afn.E)do

            local table = afn.D[state.id][symbol]
            if(table)then
                temp = temp..symbol.." "
                for _, c in pairs(table)do
                    temp = temp..c.id
                end
                temp = temp.." ,"
            end
        end
        temp = temp.."\n"
    end

    f:write(temp)
    f:close()
end
