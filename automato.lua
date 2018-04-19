automata = {};

function automata.new()
	local a = {};
	-- attribute --
	a.Q = automata.getQ();
	a.E = automata.getE();
	a.F = automata.getF();
	a.D = automata.getD();

	-- method --
	a.getQ = automata.getQ;
	a.getE = automata.getE;
	a.getF = automata.getF;
	a.getD = automata.getD;
end

function automata.getE(self)
	local e = {};
	local str;
	local i = 1;

	print("Input the alphabet: ");
	str = io.read();

	for q in string.gmatch(str, "[^%s]+") do
		e[i] = q;
		i = i+1;
	end

	return e;
end

function automato.getF(self)
	local f ={}
	local str = io.read()
	local i = 1

	for q in string.gmatch(str,"[^%s]+") do
		for j = 1 ,#self.Q do
			if(q == self.Q[j])then
				
			end
		end
		f[i] = q
		i = i+1
	end

	return f
end
