-- @module ansi_message
-- Defines soundpack message formatting.
-- If editing the color's table,
-- Preserve syntax:
-- <level> = <foreground>, <background>

-- author: Erick Rosso
-- Last updated 2020.06.26

---------------------------------------------

local colortable = {
  info = {"blue","black"},
  important = {"green","black"},
  critical = {"red","black"}
}

function AnsiMsg(level, msg)

  local color = colortable[level]
  ColourNote(color[1], color[2], msg
)
end -- AnsiMsg

return AnsiMsg