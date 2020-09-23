-- @function channel
-- Plays a given file name.
-- Defaults to a default file if none is available.
-- Uses buffer.lua to log.

-- author: Erick Rosso
-- Last updated 2020.07.10

---------------------------------------------

local path = require("pl.path")

function Channel(name, line, wc)

  -- First index to wc is buffer name.
-- Second index to wc is file name.

  Buffer(line, wc[1])

  if path.isfile(
  path.join(config:GetConst("sdir").."channels/", wc[1])..config:GetConst("ext")) then
    Play("channels/"..wc[1], "communication")
  else
    Play("channels/default", "communication")
end -- if

end -- Channel
