local tplater  = require("tampl")

local template     = tplater.from_file("tampl/example_template.lua")
local end_template = tplater.from_file("tampl/internal_template.lua")

local trigger_code = [[
    print("triggered")
]]

local init_code = [[
    print("hello world")
]]

local loop_iterations = 5

local output_modify = "10"

-- adding internal_template into our main template
template.inject(template._INTERNAL_TEMPLATE,tplater.At("TAIL"),end_template)

-- adds something to happen on all trigger hooks
template.inject(template._TRIGGER,tplater.At("TAIL"),tplater.parse(trigger_code))

-- fills in the values in the main template
template.inject(template._INIT_MESSAGE,tplater.At("TAIL"),tplater.parse(init_code))
template.inject(template._MAX_COUNT   ,tplater.At("HEAD"),tplater.parse(loop_iterations))
template.inject(template._I_MODIFY    ,tplater.At("HEAD"),tplater.parse(output_modify))


-- generates code from our template and saves it into a file
local generated = template.construct()

local f = fs.open("out.lua","w")
f.write(generated)
f.close()