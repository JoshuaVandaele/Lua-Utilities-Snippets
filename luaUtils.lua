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

	io.store("filename","data",false) -- io.store store data in a file and the 
	"false" means no new line at end of the file

	string.random(2) -- How many random characters you want.
	
	string.split("str","split") -- split a string into a table.

	os.find("file","directory") -- Find a folder or a file in the directory
	
	table.merge({"table1"},{"table2"}) -- combine 2 tables

	mix("str or int") -- Can also be used with the synthax string.mix or 
	math.mix : Mix the given string/number 

	table.list({"table"}) -- List a table (Also return count)

	os.getOS -- Get your OS

	table.head -- return first value of a table

	table.tail -- return the tail of a table

	morse -- table

	string.startswith("str","s") -- check if "str" starts with "s"

	string.endswith("str","tr") -- check if "str" ends with "tr"

	os.getArch() -- get Lua architecture -32/64 bits

	table.find({"a","b","c","d"},"c") -- Search for a value in a table, 
	also returns where is the value (in this case, 3)
	if nothing is found it will return nil, -1
]]

chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

string.encode = {}
string.decode = {}
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

local function console.error(type,msg,other)
	
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

local function os.getOS()
	if package.config:sub(1, 1) == '\\' then 
		return 'windows'
	elseif  package.config:sub(1, 1) == '/' then
		return 'unix'
	else
		return 'unknown'
	end
end

local function os.getArch()
 return (#tostring({})-7)*4
end

local function console.log(type,...)
	if not type then
		console.error("No type provided !")
	end
	print(os.date("[%x|%X] [" .. type:upper() .. "]"),...)
end

local function sleep(s)
  local t = os.clock() + s
  repeat until os.clock() > t
end

local function os.clear()
	if not os.execute("clear") then
		os.execute("cls")
	elseif not os.execute("cls") then
		for i = 1,25 do
			print("\n\n")
		end
	end
end

local function table.to2D(arg)
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


local function table.toString(t)
	local a = table.concat(t,", ")
	return "{" .. a .. "}"
end

local function console.slowPrint(str)
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

local function console.slowWrite(str)
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

local function io.readfile(path)
    local file = open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

local function io.store(file, data, nl)
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

local function string.random(count,min,max)
	
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

local function string.decode.hex(str)
    return (str:gsub('..', local function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

local function string.encode.hex(str)
    return (str:gsub('.', local function (c)
        return string.format('%02X', string.byte(c))
    end))
end

local function string.split(str,split)
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

local function os.find(file,path)
	local os = os.getOS:lower()
	if os == "windows" then 
		cmd = "dir" 
	elseif os == "linux" or os == "mac" or os == "macos"
	then
		cmd = "ls"
	else
		console.error("Invalid OS!")
	end

	if not file then
		console.error("Can't find \"nil\"","git gud"
			,"What did you expect me to say? like searching NOT" ..
			"HING, NIL, NULL, EMPTY, etc.. :<")
	end
	
	local f = io.popen(cmd .. " " .. path)
	if string.find(f:read("*a"), file) then
		return true
	else
		return false
	end
end


local function table.merge(t1, t2)
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

local function mix(unknown)
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

local function table.list(t)
	local tstr = ""
	local c = 0
	for k,v in pairs(t) do
		c = c+1
		tstr = tstr .. k .. " = " .. v .. ",\n"
	end
	return tstr:sub(0,#tstr-2), c
end

local function table.find(t, value)
	local c = 0
	for k, v in pairs(t) do
		c = c+1
		if value == v then
			return v, c
		end
	end
	return nil, -1
end

 local function table.head(t)
     return t[1]
 end

local function table.tail(t)
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

local function string.startswith(str, ptrn)
	return string.find(str, ptrn, 1) == 1
end

local function string.endswith(str, ptrn)
	local s = #str + 1 - #ptrn
	return string.find(str, ptrn, s) == s
end
------B64 from http://lua-users.org/wiki/BaseSixtyFour--------------
--I just edited the local function names.
-- Lua 5.1+ base64 v3.0 (c) 2009 by Alex Kloss <alexthkloss@web.de>
-- licensed under the terms of the LGPL2
local function string.encode.b64(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return chars:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

local function string.decode.b64(data)
    data = string.gsub(data, '[^'..chars..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(char:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
--------------------------------------------------------------------
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
	string.encode,
	string.decode,
	string.encode.hex,
	string.decode.hex,
	string.encode.b64,
	string.decode.b64
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
	table.find;
	---------------math
	math.mix,
	---------------Others
	sleep,
	operator,
	mix,
	morse,
	chars
}