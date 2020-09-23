-- @module include
-- Instantiates the Toastush trigger's namespace.

-- Author: Erick Rosso
-- Last updated 2020.09.23

---------------------------------------------

local path = require("pl.path")

-- Table of triggers.
local namespace = {


} -- namespace

local src = "miriani/triggers"
table.foreach(namespace,
function (i, mod)
  if path.isfile(string.format("lua/%s/%s.lua", src, mod)) then
    require(string.format("%s.%s", src, mod))
  else
    AnsiMsg("critical", string.format("Failed to locate Miriani triggers %s/%s.lua.", src, mod))
  end -- if
end ) 
