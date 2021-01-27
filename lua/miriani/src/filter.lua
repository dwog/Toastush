-- @module filter
-- Provides a text filter for a streamline minimalist gameplay.

-- Author: Erick Rosso
-- Last updated 2021.01.24

---------------------------------------------

function Filter(name, line, wc)
  if config:GetOption("spam_filter").value == "no" or wc[1] then
    return Note(wc[1] and string.upper(wc[1]) or line)
  end -- if
end -- Filter
