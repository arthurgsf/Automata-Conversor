require "func"
require "States"

automata = {};

function automata.new()
	local a = {};
	
	--methods
	a.getQ = automata.getQ;
	a.getE = automata.getE;
	a.getF = automata.getF;
	a.getD = automata.getD;

	return a
end


--[[
	function automata.getE()
	Used to get the char of Σ, returns a table of char Ex: {"a","b","c"}
]]
function automata.getE(self)
	local e = {};
	local str;

	print("Insira as letras do alfabeto, separadas por espaços. Ex.: a b c");
	str = io.read();

	for q in string.gmatch(str, "%a") do
		if(not find(e,q))then
		  table.insert(e,q)
		end
	end
	
	self.e = e
end


--[[
	function automata.getQ()
	Used to get all states of the automaton. Returns a table of char. Ex.: {"q0","q1"}
]]

function automata.getQ(self)
	
	local q = {}
	local str
  
	print("Insira uma sequência de estados separados por espaços. Ex.: q0 q1 q2")
  	str = io.read()

	for state in string.gmatch(str, "%a+%d*") do
		if (state == "nil" or state == "null" or state=="-" or state=="none" or state == "nada" or state == "nd") then
			table.insert(q , nil)
		elseif(string.match(state,"%a+%d+") and not find(q,state))then
			table.insert(q , state)
		end
	end

	self.Q = q
end

--[[
	function automata.getF()
	Used to get all final states of the automaton. Returns a table of char. Ex.: {"q0","q1"}
]]

function automata.getF(self)
	local Q = self.Q
	local f ={}
	local str

	print("Insira os estados finais do autômato, separados por espaços. Ex.: q0 q1 q2")
	str = io.read()

	for state in string.gmatch(str,"[^%s]+") do
		if(find(Q,state) and not find(f, state))then
			table.insert(f , state)
		end
	end

	self.F = f
end


--[[
	function automata.getD()
	Used to get delta of the automaton. It returns a 3-dimensions table
	{
		q1 	= {
			a	=  {"q1","q2"},
			b 	=  {"q0",nil}
		}
		q2	= {
			a	=  {"q2","q0"},
			b 	=  {nil,nil}
		}
	}
	where the key values are part of Q and E, respectively.
	Ex.: a.D.q1.a //prints {"q1","q2"}
]]

function automata.getD(self)

	local d = {}

	for i,state in pairs(self.Q)do
		d[state] = {}
		for j,symbol in pairs(self.E)do
			print("Delta de "..state.." lendo "..symbol)
			d[state][symbol] = getQ()
		end
	end

	self.D = d
end