-- @module audio
-- Provides a class for creating and manipulating audio streams.
-- Initiates a timer to clean audio stack.

-- Author: Erick Rosso
-- Last updated 2020.06.20

---------------------------------------------

local class = require("pl.class")
local path = require("pl.path")
local bass = require("audio.bass")
local wait = require("wait")

class.Audio(bass)

Audio.const = {
  stack = {},
  stopped = 0,
  playing = 1,
  paused = 3,
  granularity = 0.05
}

Audio.ERROR = {
  ok = 0,
  invalid_file = 1,
  unknown = -1
}

function Audio:_init()
  
self.Init()
  wait.make(function() -- Start quarantine.
    while true do
      wait.time(self.const.granularity)
      table.foreach(self.const.stack,
      function(k, v)
        if v:IsActive() == self.const.stopped then
          table.remove(self.const.stack, k)
        end -- if
      end ) -- anon
    end -- while
  end ) -- quarantine

  return self.ERROR.ok
end -- _init

function Audio:Play(mem, file, vol, pan, fq)

  if not path.isfile(file) then
    return self.ERROR.invalid_file
  end -- if

  local stream = bass:StreamCreateFile(mem, file)

  if type(stream) ~= 'table' then
    return self.ERROR.unknown
  end -- if

  bass:SetAttribute(stream, "volume", tonumber(vol))
  bass:SetAttribute(stream, "pan", tonumber(pan))
  bass:SetAttribute(stream, "frequency", tonumber(fq))

  -- Push onto the stack.
  self.const.stack[#(self.const.stack)+1] = stream

  local handle = stream:Play()

  return handle == 0
  and self.ERROR.ok
  or self.ERROR.unknown
end -- Play

function Audio:Stop(file)

  --  Iterates  through the stack.
  -- Pulls an active file with matching title.
  -- Uses a fuzzy matching algorithm.

  local handle = 0  
  for k,v in pairs(self.const.stack) do
    if string.find(v:get_filename(), file) then

      handle = k
      v:Stop()
      break
    end -- if
end -- for

  return handle == 0 
  and self.ERROR.invalid_file
  or self.ERROR.ok
end -- Stop

function Audio:Pause(file)

  -- Iterates through the stack.
  -- Pulls file and pauses it.
  -- Uses a fuzzy matching algorithm.

  local handle = 0
  for k,v in pairs(self.const.stack) do

    if string.find(v:get_filename(), file)
    and v:IsActive() == self.const.playing then

      handle = k
      v:Pause()
      break
    end -- if
    end -- for

  return handle == 0
  and self.ERROR.invalid_file
  or self.ERROR.ok
end -- Pause

function Audio:Resume(file)

  -- Iterates through the stack.
  -- Pulls file and resumes it.
  -- Uses a fuzzy matching algorithm.

  local handle = 0
  for k,v in pairs(self.const.stack) do

    if string.find(v:get_filename(), file)
    and v:IsActive() == self.const.paused then

      handle = k
      v:Play()
      break
    end -- if
    end -- for

  return handle == 0
  and self.ERROR.invalid_file
  or self.ERROR.ok
end -- Resume

return Audio