require "func"
require "States"

automata = {};

function automata.new()
	local a = {};

	--methods
	a.getE = automata.getE;
	a.getNewE = automata.getNewE

	a.getQ = automata.getQ;
	a.getNewQ = automata.getNewQ

	a.getF = automata.getF;
	a.getNewF = automata.getNewF

	a.getD = automata.getD;
	a.getNewD = automata.getNewD

	a.extDelta = automata.extDelta
	a.toAfn = automata.toAfn

	return a
end


--[[
	function automata.getE()
	Used to get the char of Σ, returns a table of char Ex: {"a","b","c"}
]]
function automata.getE(self, str)
	local e = {};

	for q in string.gmatch(str, "%a") do
		if(not find(e,q))then
		  table.insert(e,q)
		end
	end

	table.insert(e,"&")

	self.E = e
end

function automata.getQ(self , str)

	local q = {}

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

function automata.getF(self, string)
	self.F = readStates(string,self.Q)
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

-- function automata.getD(self)
--
-- 	local d = {}
--
-- 	for i,state in pairs(self.Q)do
--
-- 		d[state.id] = {}
--
-- 		for j,symbol in pairs(self.E)do
--
-- 			print("Delta de "..state.id.." lendo "..symbol)
--
-- 			local str = io.read()
-- 			d[state.id][symbol] = {}
--
-- 			for id in string.gmatch(str,"%a+%d+")do
-- 			end
-- 		end
-- 	end
-- 	self.D = d
-- end


function automata.getD(self, line)
	if(line~="")then
		local stateId = line:sub(1,line:find("-") - 1):gsub("%s*", "")
		self.D[stateId] = {}
		local line = line:gsub(stateId,"",1)
		for word in line:gmatch("[%a&][^,]*") do
			local symbol = word:sub(1,1)
			self.D[stateId][symbol] = readStates(word , self.Q)
		end
	end
end

--[[
	function automata.getF()
	Returns the new final set of states, which is an table of states
]]

function automata.getNewF(self)
	local newF = {}
	for k, v in pairs(self.Q)do
		local temp_closure = v:closure(self.D)
		for a,b in pairs(temp_closure)do
			if(b:isFinal(self.F))then
				local s = State.new(v.id)
				newF = union(newF,{s})
				break
			end
		end
	end
	return newF
end


--[[
	function Automata.extDelta(self, array)
	receives a table of char, and returns extended Delta for an automaton
]]
function automata.extDelta(self,state, array)

	local closure = state:closure(self.D)

	for i, symbol in pairs(array)do
		local temp_closure = {}

		for j ,state in pairs(closure) do
			local table = self.D[state.id][symbol]
			if(table)then
				temp_closure = union(temp_closure, table)
			end
		end

		closure = State.extClosure(temp_closure, self.D)

	end

	return closure
end

function automata.getNewQ(self)
	local newQ = {}
	for k,v in pairs(self.Q)do
		table.insert(newQ,State.new(v.id))
	end
	return newQ
end

function automata.getNewE(self)
	local newE = {}
	for k, v in pairs(self.E) do
		if (v~="&")then
			table.insert(newE , v)
		end
	end
	return newE
end

function automata.toAfn(self)
	newAutomata = automata.new()
	newAutomata.E = self:getNewE()
	newAutomata.Q = self:getNewQ()
	newAutomata.F = self:getNewF()
	newAutomata.D = self:getNewD()
	return newAutomata
end

function automata.getNewD(self)
	local newD = {}
	for i,state in pairs(self.Q) do
		newD[state.id] = {}
		for j , symbol in pairs(self.E) do
			if(symbol ~= "&")then
				newD[state.id][symbol] = self:extDelta(state , strtoarray(symbol))
			end
		end
	end
	return newD
end
