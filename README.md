# Utils
Useful Utilities for Lua!

This file was made firstly for myself, but then I wanted to share it with ppls, so here it is!

# Utilities avaible:
## String
 * ```string.random(count,min,max) ``` 
"count, min, max" are not required, this function returns a random string
* ```string.split(str,split)```
this function splits a string to a table
* ```string.mix(str)```
see ```mix```
* ```string.startswith(str,pattern)```
verify if a string starts with the pattern
* ```string.endswith(str,pattern)```
same as above but for the end of the string
* ```string.encode```
table for encoding
* ```string.decode```
table for decoding
* ```string.encode.hex(str)```
encode a string into hex
* ```string.decode.hex(str)```
decode a string into hex
* ```string.encode.b64(str)```
encode a string into base64
* ```string.decode.b64(str)```
decode a string into base64

## I/O
* ```io.readfile(path/to/file.txt)```
reads a file
* ```io.store(file,content,true)```
stores data into a file, the "true" mean we do a new line at the end of the file for future storing

## Math
* ```math.mix```
see  ```mix```

## OS
* ```os.find("file","dir")```
search for a file in a directory
* ```os.clear()```
clear the terminal, works with all OS
* ```os.getOS()```
returns the current OS
* ```os.getArch()```
get if the arch is 64 bits or 32 bits

## Table
* ```table.merge(t1,t2)```
merges two tables
* ```table.to2D(str)```
returns a 2D table version of the string you sent
* ```table.tostring(tbl)```
returns a string of the table you sent
* ```table.list(tbl)```
return in a string a list of elements of a table, also returns count
* ```table.head(tbl)```
returns first value
* ```table.tail(tbl)```
returns the tail of the table
* ```table.find(tbl)```
find a value in a table

## Console
* ```console.log(str)```
logs something with time and date
* ```console.slowPrint(str)```
prints something slowly
* ```console.slowWrite(str)```
writes something slowly (using io.write)
* ```console.error(error type, error message, additional infos)```
advanced erroring

## Others
* ```sleep(t)```
will wait the amount of time given
* ```operator```
Operators, can always be useful
* ```morse```
A table with char to morsein it
* ```chars```
a string with all chars, used for  ```string.encode.b64(str)```
* ```mix```
mix a string or ints
* ```dostring```
a remake of the old loadstring for Lua 5.3 - execute a string as a piece of code