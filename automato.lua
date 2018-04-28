automata = {};

function automata.new()
	local a = {};
	-- attributes --
	a.Q = automata.getQ();
	a.E = automata.getE();
	a.F = automata.getF();
	a.D = automata.getD();

	-- methods --
	a.getQ = automata.getQ;
	a.getE = automata.getE;
	a.getF = automata.getF;
	a.getD = automata.getD;
end


--[[
	function automata.getE()
	Used to get the char of Σ, returns a table of char Ex: {"a","b","c"}
]]
function automata.getE()
	local e = {};
	local str;
	local i = 1;

	print("Insira as letras do alfabeto, separadas por espaços. Ex.: a b c");
	str = io.read();
	for q in string.gmatch(str, "[^%s]+") do
		e[i] = q;
		i = i+1;
	end

	return e;
end


--[[
	function automata.getE()
	Used to get all final states of the automaton. Returns a table of char. Ex.: {"q0","q1"}
]]

function automata.getQ()
    local f={}
    local str
    local i = 1
  
    print("Insira os estados do autômato, separado por espaços. Ex.: q0 q1 q2")
    str = io.read()
  
    for q in string.gmatch(str, "[^%s]+") do
        f[i] = q;
        i = i+1;
    end
end

function automata.getF(Q)
	local f ={}
	local str
	local i = 1

	print("Insira os estados finais do autômato, separados por espaços. Ex.: q0 q1 q2")
	str = io.read()
	for q in string.gmatch(str,"[^%s]+") do
		for j = 1 ,#Q do -- Check if the state q is part of the Q table
			if(q == Q[j])then
				f[i] = q
				i = i+1
				break
			end
		end
	end

	return f
end


function automata.getD(Q, E)

	local D = {}

	for i,q in pairs(Q)do
		D[q] = {}
		for j,l in pairs(E)do
			print("Delta de "..q.." lendo "..l)
			D[q][l] = io.read()
		end
	end

	return D
	
end