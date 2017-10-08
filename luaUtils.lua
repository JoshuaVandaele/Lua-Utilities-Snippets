--[[          Made By TheJoshua974
  Wiki: https://github.com/TheJoshua974/Utils/wiki (If the Wiki is not updated use the README.MD)
  Source: https://github.com/TheJoshua974/Utils
  Github page: https://github.com/TheJoshua974/Utils
]]

local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

string.encode = {}
string.decode = {}
console = {}

--took that from http://lua-users.org/wiki/FunctionalLibrary !
operator = {
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
local morse = {
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
  
  if other ~= nil then --Check if other an argument
    other = "Other informations: " .. other .. "\n" -- if so, add it
  else
    other = ""
  end
  if msg ~= nil then -- check if there's an error message
    msg = "\nDetailed message: " .. msg .. "\n" -- if so, add it
  else
    msg = ""
  end

  if not type then --check if the type is a give argument
    type = "Unknown" --if not, make it unknown
  end

  error(os.date("\n[%x|%X]") .. " An error occured !\nType : " .. type .. msg 
    .. other) -- error it !
end

function os.getOS() -- the good ol' trick
  if package.config:sub(1, 1) == '\\' then 
    return 'windows'
  elseif  package.config:sub(1, 1) == '/' then
    return 'unix'
  else
    return 'unknown'
  end
end

function os.getArch()
 return (#tostring({})-7)*4 -- Another good ol' trick
end

function console.log(type,...)
  if not type then
    type = "INFO" -- probably what ppls do when they set it to false
  end
  print(os.date("[%x|%X] [" .. type:upper() .. "]"),...) -- prints it to the console/terminal
end

function sleep(s)
  local t = os.clock() + s
  repeat until os.clock() > t -- hand made, but works very well!
end

function os.clear()
  if not os.execute("clear") then -- if not linux
    os.execute("cls") -- do windows
  elseif not os.execute("cls") then --else if not linux/windows
    for i = 1,25 do -- print many \n's
      print("\n\n")
    end
  end
end

function table.to2D(arg)
  local arg = tostring(arg)
  local t = {}
  local line = {}

  for i = 1, #arg do
     local c = arg:sub(i,i) -- take one char
     if c == "\n" then -- make a new table if the char is a new space
         line = {}
         table.insert(t, line)
     else -- else insert the char to the current table
         table.insert(line, c)
     end
  end
  return t
end


function table.toString(t)
  local a = table.concat(t,", ") -- do i even need to comment that?
  return "{" .. a .. "}"
end

function console.slowPrint(str)
  local str = tostring(str)
  
  if not type(str) == 'string' then 
    return nil
  end

  local n = 0
  for i = 1,#str do
    n = n + 1
    sleep(0.05) -- uses the sleep function to wait before io.write-ting
    io.write(str:sub(n, n))
  end
  print() -- new space
end

function console.slowWrite(str) -- same as above without the newspace
  local str = tostring(str)
  
  if not type(str) == 'string' then 
    return nil
  end

  local n = 0
  for i = 1,#str do
    n = n + 1
    sleep(0.05)
    io.write(str:sub(n, n))
  end
end

function io.readfile(path)
    local file = open(path, "rb") --open the file
    if not file then return nil end
    local content = file:read "*a" -- read the file and store the content
    file:close() -- close the file
    return content -- return the content
end

function io.store(file, data, nl)
  if not file or not data then 
    return false
  end

  if not nl then
    nl = ""
  else
    nl = "\n"
  end

  local file = io.open(file, "a+") -- oppens the file in append mode +
  file:write(data, nl) -- write stuff
  file:close() -- close stuff
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
    rds = rds .. string.char(math.random(min,max)) -- string.char for count time and with the limit of min and max
  end
  return rds
end

function string.decode.hex(str)
    return (str:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

function string.encode.hex(str)
    return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c))
    end))
end

function string.split(str,split)
  if not str then
    console.error("Can't split with nil","Hey have you tried splitting " .. 
      "air? Spoiler: it dont work") --What did you expected me to say? :p
  end
  local array = {}
  for w in (str .. split):gmatch("([^" .. split .. "]*)" .. split) do  -- matchin' stuff
     table.insert(array, w) -- insert the matchin' stuff in a table
  end 
  return array
end

function os.find(file,path)
  local os = os.getOS:lower()
  local cmd
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
  if string.find(f:read("*a"), file) then -- if the file / folder is find with the cmd above
    return true
  else
    return false
  end
end


function table.merge(t1, t2)
  if not t1 then -- this piece of code is horrible, but it works
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
  end -- set the int as a string
  local out = {}
  for i = 1, #unknown do
    table.insert(out,unknown:sub(i, i)) -- making each char as a string
  end
  for i = 1, #unknown do
    local a = math.random(1, #unknown)
    local b = math.random(1, #unknown) -- makin random numbers
    local atemp = out[a]
    out[a] = out[b] -- mixing tables
    out[b] = atemp -- mixing tables
  end
  local out = table.concat(out) -- making tables ints
  if n then
    out = tonumber(out) -- if it was a int make the int gr8 again
  end
  return out
end

string.mix = mix -- I was way too lazy
math.mix = mix -- sowwy

function table.list(t) -- no need to explain
  local tstr = ""
  local c = 0
  for k,v in pairs(t) do
    c = c+1
    tstr = tstr .. k .. " = " .. v .. ",\n"
  end
  return tstr:sub(0,#tstr-2), c
end

function table.find(t, value)
  local c = 0
  for k, v in pairs(t) do
    c = c+1
    if value == v then -- omygud it match
      return v, c
    end
  end
  return nil, -1
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
    table.insert(nt, (i - 1), t[i]) -- make a new table with the head remov'd
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
------B64 from http://lua-users.org/wiki/BaseSixtyFour--------------
--I just edited the function names.
-- Lua 5.1+ base64 v3.0 (c) 2009 by Alex Kloss <alexthkloss@web.de>
-- licensed under the terms of the LGPL2
function string.encode.b64(data)
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

function string.decode.b64(data)
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

function string.totable(str)
  return string.split(str," ")
end

function math.calc(arg)
    if not arg then return end
    input = arg
    arg = "return (" .. arg .. ")"

    local sandbox = setmetatable({}, {__index = math})

    local fn, syntaxError = load(arg, 'Calc', 't', sandbox)
    if not fn then return syntaxError end

    local success, result = pcall(fn)
    if not success then return result end
    return result
end

function table.reverse(t)
  local nt = {}
  for i = 1,#t do
    nt[i] = t[#t+1-i]
  end
  return nt
end

function isType(obj,typecheck)
  return type(obj) == typecheck
end

--[[return {
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
  string.decode.b64,
  string.totable,
  ---------------os
  os.find,
  os.clear,
  os.getOS,
  os.getArchos,
  ---------------table
  table.merge,
  table.to2D,
  table.toString,
  table.list,
  table.head,
  table.tail,
  table.find,
  table.reverse,
  ---------------math
  math.mix,
  ---------------Others
  sleep,
  operator,
  mix,
  morse,
  chars,
  dostring,
  isType
}]]