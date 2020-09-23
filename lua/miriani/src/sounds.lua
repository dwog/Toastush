-- @module sounds
-- Provides functions for audio manipulation.
-- Uses the BASS library lua binding at its core.

-- author: Erick Rosso
-- Last updated on 2020.06.26

---------------------------------------------

-- Offers a wrapper for audio:Play
local streamtable = {}
function Play(file, group, interrupt, rp)

  local mem = false -- All audio will be static.

  if config:IsMute() then
    return -- Audio is muted.
  end -- if

  local search = utils.readdir(
config:GetConst("sdir")..file.."*"..config:GetConst("ext")
  ) -- File search.

  if search then

    math.randomseed(os.time())

    local count = 0
    table.foreach(search,
    function()
      count = count + 1
    end ) -- anon

  local sfile = 
    count == 1
    and config:GetConst("sdir")..file..config:GetConst("ext")
    or config:GetConst("sdir")..file..tostring(
    math.random(count)
    )..config:GetConst("ext")

    if interrupt and streamtable[group] then
      audio:Stop(streamtable[group])
    end -- if

    rp = 
    rp == true
    and (math.random(-100, 100) / 100.0) -- Stereo panning.
    or config:GetAttribute(group, "pan")

      streamtable[group] = sfile

    local code = audio:Play(
    mem, sfile,
    config:GetAttribute(group, "vol"),
    rp, -- Possible random pan.
    config:GetAttribute(group, "freq")
    )

    if code ~= audio.ERROR.ok then
      AnsiMsg("important",
      string.format("Unable to play %s.", sfile)
      )

    end -- if

  end -- if
end -- Play

function Stop(group)

  if not group then
 
    table.foreach(streamtable,
    function(k,v)

      audio:Stop(v)
    end ) -- anon

  else

    return streamtable[group] and audio:Stop(streamtable[group])
   end -- if
end -- Stop

function Pause(group)

  if not group then
 
    table.foreach(streamtable,
    function(k,v)

      audio:Pause(v)
    end ) -- anon

  else

    return streamtable[group] and audio:Pause(streamtable[group])
   end -- if
end -- Pause

function Resume(group)

  if not group then
 
    table.foreach(streamtable,
    function(k,v)

      audio:Resume(v)
    end ) -- anon

  else

    return streamtable[group] and audio:Resume(streamtable[group])
   end -- if
end -- Resume

local active_group = 1
function CycleAudioGroups()

  local groups = config:GetAudioGroups()

  if active_group == table.getn(groups) then
    active_group = 0
  end -- if

  for k,v in pairs(groups) do

    if k > active_group then
      active_group = k
      AnsiMsg("info",
      string.format("%s control - volume: %s%%",
      v, (config:GetAttribute(groups[k], "vol") * 100.0))
      )
      break
    end -- if
  end -- for
    end -- CycleAudioGroups

function DecreaseAttribute(attribute)

  local group = config:GetAudioGroups()[active_group]

-- Subtract five percent.
  local function Subtract(val)
    val =
    val <= 0.05
    and 0.0
    or val - 0.05

    return val
  end -- Subtract

    local val = Subtract(config:GetAttribute(group, attribute))

  if group ~= config:GetConst("default_audio") then
  config:SetAttribute(group, attribute, val)
    return AnsiMsg("info", string.format("%s volume: %s%%", group,
    (val * 100.0)
    ))
  end -- if

  for k,v in pairs(config:GetAudioGroups()) do
    
    config:SetAttribute(v, attribute,
    Subtract(
    config:GetAttribute(v, attribute))
    )
  end -- for

  return AnsiMsg("info", string.format("%s volume: %s%%", group,
  (val  * 100.0)
  ))
end -- DecreaseAttribute

function IncreaseAttribute(attribute)

  local group = config:GetAudioGroups()[active_group]

-- Add five percent.
  local function Add(val)
    val =
    val >= 1.0
    and 1.0
    or val + 0.05

    return val
  end -- Add

    local val = Add(config:GetAttribute(group, attribute))

  if group ~= config:GetConst("default_audio") then
  config:SetAttribute(group, attribute, val)
    return AnsiMsg("info", string.format("%s volume: %s%%", group,
    (val * 100.0)
    ))
  end -- if

  for k,v in pairs(config:GetAudioGroups()) do
    
    config:SetAttribute(v, attribute,
    Add(
    config:GetAttribute(v, attribute))
    )
  end -- for

  return AnsiMsg("info", string.format("%s volume: %s%%", group,
  (val  * 100.0)
  ))
end -- IncreaseAttribute

function ToggleMute()

  if not config:ToggleMute() then
    AnsiMsg("info", "Sounds unmuted.")
  else 
    AnsiMsg("info", "Sounds muted.")
  end -- if

  end -- ToggleMute
