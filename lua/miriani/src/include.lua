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
Announce = require("miriani.util.announce")
mcp = require("miriani.util.mcp")

-- Table of dependencies.
local namespace = {
  "TMenu", -- Menu-driven interface for config.
  "sounds", -- miriani specific audio functions.
  "buffer", -- Output logging.
  "channel", -- Channel sounds.
  "keybindings", -- Global macros.
  "soundpack", -- Soundpack methods for negotiations.
  "filter" -- Spam throttle.
} -- namespace


local src = "miriani/src"
table.foreach(namespace,
function (i, mod)
  if path.isfile(string.format("lua/%s/%s.lua", src, mod)) then
    require(string.format("%s.%s", src, mod))
  else
    Announce("critical", string.format("Failed to locate Miriani module %s/%s.lua.", src, mod))
  end -- if
end ) 
