-- @function channel
-- Plays a given file name.
-- Defaults to a default file if none is available.
-- Uses buffer.lua to log.

-- author: Erick Rosso
-- Last updated 2020.07.10

---------------------------------------------

local path = require("pl.path")

function Channel(name, line, wc)
  local spath = string.format(
    "%scomm/", config:GetConst("sdir"))
  -- First index to wc is buffer name.
  if path.isfile(
    path.join(spath, wc[1])..config:GetConst("ext")) then
    Buffer(line, wc)
    Play("comm/"..wc[1], "communication")
  else
    Play("comm/default", "communication")
end -- if
end -- Channel
