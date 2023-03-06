local tplater  = require("tampl")

local f    = fs.open("example_template.lua","r")
local data = f.readAll()
f.close()

local template = tplater.new(data)

template.inject(template._INIT_MESSAGE,tplater.At("HEAD"),tplater.parse("print(\"Hello worldE\")"))
template.inject(template._MAX_COUNT,tplater.At("HEAD"),tplater.parse("5"))
template.inject(template._OOF,tplater.At("HEAD"),tplater.parse("1"))

local generated = template.construct()

local f = fs.open("out.lua","w")
f.write(generated)
f.close()