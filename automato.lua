require "func"
require "States"

automata = {};

function automata.new()
	local a = {};
	
	--methods
	a.getE = automata.getE;
	a.getQ = automata.getQ;
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

	table.insert(e,"&")

	self.E = e
end


--[[
	function automata.getQ()
	Used to get all states of the automaton. Returns a 2d table.
	Ex.: 
	{{id = "q1"},{id = "q2"}}
]]

function automata.getQ(self)
	
	local q = {}
	local str
  
	print("Insira uma sequência de estados separados por espaços. Ex.: q0 q1 q2")
  	str = io.read()

	for id in string.gmatch(str, "%a+%d+") do
		if (not find(q,id))then
			local state = State.new(id)
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

	local q = self.Q
	local f ={}
	local str

	print("Insira os estados finais do autômato, separados por espaços. Ex.: q0 q1 q2")
	str = io.read()

	for id in string.gmatch(str,"%a+%d+") do
		local state = find(q,id)
		if(state and not find(f,state.id))then
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

		d[state.id] = {}

		for j,symbol in pairs(self.E)do

			print("Delta de "..state.id.." lendo "..symbol)
			
			local str = io.read()
			d[state.id][symbol] = {}

			for id in string.gmatch(str,"%a+%d+")do
				local s = find(self.Q,id)

				if(s and not find(d[state.id][symbol],s.id))then
					table.insert(d[state.id][symbol],s)
				end
			end
		end
	end
	self.D = d
end