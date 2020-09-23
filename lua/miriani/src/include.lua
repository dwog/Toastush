-- @module include
-- Instantiates the Toastush soundpack namespace.
-- Imports all dependencies.

-- Author: Erick Rosso
-- Last updated 2020.06.25

---------------------------------------------

local path = require("pl.path")

-- Utilities.
config = require("miriani.util.config")
audio = require("miriani.util.audio")
AnsiMsg = require("miriani.util.ansimsg")
mcp = require("miriani.util.mcp")

-- Table of dependencies.
local namespace = {
  "TMenu", -- Menu-driven interface for config.
  "sounds", -- miriani specific audio functions.
  "buffer", -- Output logging.
  "channel", -- Channel sounds.
  "keybindings" -- Global macros.

} -- namespace


local src = "miriani/src"
table.foreach(namespace,
function (i, mod)
  if path.isfile(string.format("lua/%s/%s.lua", src, mod)) then
    require(string.format("%s.%s", src, mod))
  else
    AnsiMsg("critical", string.format("Failed to locate Miriani module %s/%s.lua.", src, mod))
  end -- if
end ) 
