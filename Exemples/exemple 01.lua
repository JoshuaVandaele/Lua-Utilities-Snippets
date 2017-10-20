dofile("../luaUtils.lua")
print("Press enter to start the timer.")
io.read()
for i = 1,math.huge do
  sleep(1)
  os.clear()
  print("You just waited " .. i .. " seconds.")
end