-- @module buffer
-- Provides a ready-to use function for logging output into buffers.
-- Uses the channel history plugin as a direct dependency.

-- Author: Erick Rosso
-- Last updated on 2020.07.10

---------------------------------------------

function Buffer(line, wc)
  -- Check if plugin is installed.
  assert (IsPluginInstalled ("6000a4c6f0e71d31fecf523d"), "channel_history could not be found")

  -- add record table of channel arguments
   for k,v in ipairs(wc) do
    Execute("history_add "..v.."="..line)
  end -- for loop
end -- Buffer
