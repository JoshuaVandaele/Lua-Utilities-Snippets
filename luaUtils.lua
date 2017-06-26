--[[					Made By TheJoshua974
USAGES:
	console.log("TYPE","Message") -- Log something

	os.clear() -- Clear the console 
	
	table.to2D("String or Numbers") -- Returns a table in a 2D Array
	
	console.error("Type","Message","Other Infos") --Advanced erroring
	
	sleep(2) -- Time to wait 

	console.slowprint("str") -- Prints a string slowly (Uses sleep function)
	
	io.readfile("path/to/file") -- Returns the content of a file

	table.toString({"table"}) -- Returns a table as a string

	io.store("filename","data",false) -- io.store data in a file and the "false" means no new line at end of the file

	string.random(2) -- How many random characters you want.
	
	string.split("str","split") -- split a string into a table.

	os.find("file","directory") -- Find a folder or a file in the directory
	
	table.merge({"table1"},{"table2}) -- combine 2 tables

	string.mix("str") -- randomly mix a string
]]
console = {}

function console.log(type,...)
	if not type then
		error("No type provided !")
	end
	print(os.date("[%x|%X] [" .. type:upper() .. "]"),...)
end

function sleep (a) 
    local sec = tonumber(os.clock() + a); 
    while (os.clock() < sec) do 
    end 
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

	error(os.date("\n[%x|%X]") .. " An error occured !\nType : " .. type .. msg .. other)
end

function console.slowprint(str)
	str = tostring(str)
	
	if not type(str) == 'string' then 
		return nil
	end

	n = 0
	for i = 1,#str do
		n = n + 1
		sleep(0.05)
		io.write(str:sub(n,n))
	end
	print()
end

function io.readfile(path)
    local file = open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

function io.store(file,data,nl)
	if not file or not data then 
		return false
	end

	if tostring(nl) == "false" then
		nl = ""
	else
		nl = "\n"
	end

	file = io.open(file,"a+")
	file:write(data,nl)
	file:close()
	return true
end

function string.random(count)
	count = tonumber(count)
	if not type(count) == "number" then 
		error("string.random requires a number.")
	end
	local rds = ""
	for i = 1,count do
		rds = rds .. string.char(math.random(1,255))
	end
	return rds
end

function string.split(str,split)
	if not str then
		err("Can't split with nil","Hey have you tried splitting air? Spoiler: it dont work")
	end
	local array = {}
	for w in (str .. split):gmatch("([^" .. split .. "]*)" .. split) do 
	   table.insert(array, w) 
	end 
	return array
end

function os.find(file,path)
	local os = os.getOS()
	if os:lower() == "windows" then 
		cmd = "dir" 
	elseif os:lower() == "linux" or os:lower() == "mac" or os:lower() == "macos" then
		cmd = "ls"
	else
		error("Invalid OS!")
	end

	if not file then
		err("Can't find \"nil\"","Seriously, I found it, it's in your head...","What did you expect me to say? like searching NOTHING, NIL, VOID, EMPTY...\nJust kidding of course.")
	end
	
	local f = io.popen(cmd .." ".. path)
	if string.find(f:read("*a"),file) then
		return true
	else
		return false
	end
end

function os.getOS()
	if package.config:sub(1,1) == '\\' then 
		return 'windows'
	elseif  package.config:sub(1,1) == '/' then
		return 'unix'
	else
		return 'unknown'
	end
end

function table.merge(t1,t2)
	if not t1 then
		return false
	end
	if not t2 then
		return t1
	end
	local t = {}
	for _,a,b,c in pairs(t1) do
		if a and b and c then
			table.insert(t,a)
			table.insert(t,b)
			table.insert(t,c)
		elseif a and b then
			table.insert(t,a)
			table.insert(t,b)			
		else
			table.insert(t,a)
		end
	end

	for _,a,b,c in pairs(t2) do
		if a and b and c then
			table.insert(t,a)
			table.insert(t,b)
			table.insert(t,c)
		elseif a and b then
			table.insert(t,a)
			table.insert(t,b)			
		else
			table.insert(t,a)
		end
	end
	return t
end

function string.mix(str)
	local out = {}
	for i = 1,#str do
		table.insert(out,str:sub(i,i))
	end
	for i = 1,#str do
		local a = math.random(1,#str)
		local b = math.random(1,#str)
		local atemp = out[a]
		out[a] = out[b]
		out[b] = atemp
	end
	return table.concat(out)
end

return {
	---------------console
	console,
	console.log,
	console.slowprint,
	console.error,
	--io
	io.readfile,
	io.store,
	---------------string
	string.random,
	string.split,
	string.mix,
	---------------os
	os.find,
	os.clear,
	os.getOS,
	---------------table
	table.merge,
	table.to2D,
	table.toString,
	---------------math
	--math.bullshit
	---------------Others
	sleep
}