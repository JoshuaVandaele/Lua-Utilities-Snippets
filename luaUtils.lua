--[[					Made By TheJoshua974
USAGES:
	console.log("TYPE","Message") -- Log something

	os.clear() -- Clear the console 
	
	table.to2D("String or Numbers") -- Returns a table in a 2D Array
	
	console.error("Type","Message","Other Infos") --Advanced erroring
	
	sleep(2) -- Time to wait 

	console.slowPrint("str") -- Prints a string slowly (Uses sleep function)
	
	console.slowWrite("str") -- Writes a string slowly (Uses sleep function)

	io.readfile("path/to/file") -- Returns the content of a file

	table.toString({"table"}) -- Returns a table as a string

	io.store("filename","data",false) -- io.store store data in a file and the "false" 
	means no new line at end of the file

	string.random(2) -- How many random characters you want.
	
	string.split("str","split") -- split a string into a table.

	os.find("file","directory") -- Find a folder or a file in the directory
	
	table.merge({"table1"},{"table2"}) -- combine 2 tables

	mix("str or int") -- Can also be used with the synthax string.mix or math.mix : Mix the given
	string/number 

	table.list({"table"}) -- List a table (Also return count)

	os.getOS -- Get your OS

	table.head -- return first value of a table

	table.tail -- return the tail of a table

	morse -- table

	string.startswith("str","s") -- check if "str" starts with "s"

	string.endswith("str","tr") -- check if "str" ends with "tr"

	os.getArch() -- get Lua architecture -32/64 bits
]]



--[[Notes for me:
Make an object:

obj = setmetatable({},
 {
 __func = function () 
--Code
end})

How I do it:
t = {}
funtion crap()
 return "crap"
end
t.obj = crap()

not even sure it's an object lol
]]

console = {}

--took that from http://lua-users.org/wiki/FunctionalLibrary !
 operator = {
     mod = math.mod;
     pow = math.pow;
     add = function(n, m) return n + m end;
     sub = function(n, m) return n - m end;
     mul = function(n, m) return n * m end;
     div = function(n, m) return n / m end;
     gt  = function(n, m) return n > m end;
     lt  = function(n, m) return n < m end;
     eq  = function(n, m) return n == m end;
     le  = function(n, m) return n <= m end;
     ge  = function(n, m) return n >= m end;
     ne  = function(n, m) return n ~= m end;
 }
--
morse = {
  ["a"] = ".-",
  ["b"] = "-...",
  ["c"] = "-.-.",
  ["d"] = "-..",
  ["e"] = ".",
  ["f"] = "..-.",
  ["g"] = "--.",
  ["h"] = "....",
  ["i"] = "..",
  ["j"] = ".---",
  ["k"] = "-.-",
  ["l"] = ".-..",
  ["m"] = "--",
  ["n"] = "-.",
  ["o"] = "---",
  ["p"] = ".--.",
  ["q"] = "--.-",
  ["r"] = ".-.",
  ["s"] = "...",
  ["t"] = "-",
  ["u"] = "..-",
  ["v"] = "...-",
  ["w"] = ".--",
  ["x"] = "-..-",
  ["y"] = "-.--",
  ["z"] = "--..",
  ["0"] = "-----",
  ["1"] = ".----",
  ["2"] = "..---",
  ["3"] = "...--",
  ["4"] = "....-",
  ["5"] = ".....",
  ["6"] = "-....",
  ["7"] = "--...",
  ["8"] = "---..",
  ["9"] = "----.",
  ['"'] = "--..--",
  ["?"] = "..--..",
  ["'"] = ".----.",
  ["!"] = "-.-.--",
  ["/"] = "-..-.",
  ["("] = "-.--.",
  [")"] = "-.--.-",
  ["&"] = ".-...",
  [":"] = "---...",
  [";"] = "-.-.-.",
  ["="] = "-...-",
  ["+"] = ".-.-.",
  ["_"] = "..--.-",
  ['"'] = ".-..-.",
  ["&"] = "...-..-",
  ["@"] = ".--.-."
}

function console.error(type,msg,other)
	
	if other ~= nil then
		other = "Other informations: " .. other .. "\n"
	else
		other = ""
	end
	if msg ~= nil then
		msg = "\nDetailed message: " .. msg .. "\n"
	else
		msg = ""
	end

	if not type then
		type = "Unknown"
	end

	error(os.date("\n[%x|%X]") .. " An error occured !\nType : " .. type .. msg 
		.. other)
end

function os.getOS()
	if package.config:sub(1, 1) == '\\' then 
		return 'windows'
	elseif  package.config:sub(1, 1) == '/' then
		return 'unix'
	else
		return 'unknown'
	end
end

function os.getArch()
 return (#tostring({})-7)*4
end

function console.log(type,...)
	if not type then
		console.error("No type provided !")
	end
	print(os.date("[%x|%X] [" .. type:upper() .. "]"),...)
end

function sleep(s)
  local t = os.clock() + s
  repeat until os.clock() > t
end

function os.clear()
	if not os.execute("clear") then
		os.execute("cls")
	elseif not os.execute("cls") then
		for i = 1,25 do
			print("\n\n")
		end
	end
end

function table.to2D(arg)
	arg = tostring(arg)
	t = {}
	line = {}

	for i = 1, #arg do
	   local c = arg:sub(i,i)
	   if c == "\n" then
	       line = {}
	       table.insert(t, line)
	   else
	       table.insert(line, c)
	   end
	end
	return t
end


function table.toString(t)
	local a = table.concat(t,", ")
	return "{" .. a .. "}"
end

function console.slowPrint(str)
	str = tostring(str)
	
	if not type(str) == 'string' then 
		return nil
	end

	n = 0
	for i = 1,#str do
		n = n + 1
		sleep(0.05)
		io.write(str:sub(n, n))
	end
	print()
end

function console.slowWrite(str)
	str = tostring(str)
	
	if not type(str) == 'string' then 
		return nil
	end

	n = 0
	for i = 1,#str do
		n = n + 1
		sleep(0.05)
		io.write(str:sub(n, n))
	end
end

function io.readfile(path)
    local file = open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

function io.store(file, data, nl)
	if not file or not data then 
		return false
	end

	if tostring(nl) == "false" then
		nl = ""
	else
		nl = "\n"
	end

	file = io.open(file, "a+")
	file:write(data, nl)
	file:close()
	return true
end

function string.random(count,min,max)
	
	if not count then
		count = 1
	end
	if not max then
		max = 255
	end

	if not min then 
		min = 1
	end

	if max > 255 or min < 1 or max < 1 or min > 255 then
		console.error("Synthax error: Select a number between 1-255.")
	elseif max < min then
		local tmin = min
		max = min
		max = tmin
	end

	local rds = ""
	for i = 1,count do
		rds = rds .. string.char(math.random(min,max))
	end
	return rds
end

function string.fromhex(str)
    return (str:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

function string.tohex(str)
    return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c))
    end))
end

function string.split(str,split)
	if not str then
		console.error("Can't split with nil","Hey have you tried splitting " .. 
			"air? Spoiler: it dont work")
	end
	local array = {}
	for w in (str .. split):gmatch("([^" .. split .. "]*)" .. split) do 
	   table.insert(array, w) 
	end 
	return array
end

function os.find(file,path)
	local os = os.getOS
	if os:lower() == "windows" then 
		cmd = "dir" 
	elseif os:lower() == "linux" or os:lower() == "mac" or os:lower() == "macos"
		  then
		cmd = "ls"
	else
		console.error("Invalid OS!")
	end

	if not file then
		console.error("Can't find \"nil\"","Seriously, I found it, it's in y" ..
			"our head...","What did you expect me to say? like searching NOT" ..
			"HING, NIL, VOID, EMPTY...\nJust kidding of course.")
	end
	
	local f = io.popen(cmd .. " " .. path)
	if string.find(f:read("*a"), file) then
		return true
	else
		return false
	end
end


function table.merge(t1, t2)
	if not t1 then
		return false
	end
	if not t2 then
		return t1
	end
	local t = {}
	for _,a,b,c in pairs(t1) do
		if a and b and c then
			table.insert(t, a)
			table.insert(t, b)
			table.insert(t, c)
		elseif a and b then
			table.insert(t, a)
			table.insert(t, b)			
		else
			table.insert(t, a)
		end
	end

	for _, a, b, c in pairs(t2) do
		if a and b and c then
			table.insert(t, a)
			table.insert(t, b)
			table.insert(t, c)
		elseif a and b then
			table.insert(t, a)
			table.insert(t, b)			
		else
			table.insert(t, a)
		end
	end
	return t
end

function mix(unknown)
	local n = false
	if type(unknown) == "number" then
		unknown = tostring(unknown)
		n = true
	end
	local out = {}
	for i = 1, #unknown do
		table.insert(out,unknown:sub(i, i))
	end
	for i = 1, #unknown do
		local a = math.random(1, #unknown)
		local b = math.random(1, #unknown)
		local atemp = out[a]
		out[a] = out[b]
		out[b] = atemp
	end
	local out = table.concat(out)
	if n then
		out = tonumber(out)
	end
	return out
end

string.mix = mix
math.mix = mix

function table.list(t)
	local tstr = ""
	local c = 0
	for k,v in pairs(t) do
		c = c+1
		if v then
			tstr = tstr .. k .. " === " .. v
		else
			tstr = tstr .. k
		end
		tstr = tstr .. "\n"
	end
	return tstr, c
end

 function table.head(t)
     return t[1]
 end

function table.tail(t)
	local nt = {}
	local _,ts = table.list(t)
	if ts < 1 then
		return {}
	end
	i = 2
	while (i <= ts) do
		table.insert(nt, (i - 1), t[i])
		i = i + 1
	end
	return nt
end

function string.startswith(str, ptrn)
	return string.find(str, ptrn, 1) == 1
end

function string.endswith(str, ptrn)
	local s = #str + 1 - #ptrn
	return string.find(str, ptrn, s) == s
end


return {
	---------------console
	console,
	console.log,
	console.slowPrint,
	console.slowWrite,
	console.error,
	---------------io
	io.readfile,
	io.store,
	---------------string
	string.random,
	string.split,
	string.mix,
	string.startswith,
	string.endswith,
	string.tohex,
	string.fromhex,
	---------------os
	os.find,
	os.clear,
	os.getOS,
	os.getArch,
	---------------table
	table.merge,
	table.to2D,
	table.toString,
	table.list,
	table.head,
	table.tail,
	---------------math
	math.mix,
	---------------Others
	sleep,
	operator,
	mix,
	morse
}