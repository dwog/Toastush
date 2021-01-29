-- @module config
-- Defines methods for manipulating global constants.
-- Uses mush variables to serialize across sessions.

-- Author: Erick Rosso
-- Last updated on 2020.06.26

---------------------------------------------

local class = require("pl.class")
local const = require("miriani.util.constants")

class.Config()

function Config:_init()

  local serial_config = GetVariable(const.CONST.mush_var)

  local function Initialize(var)
    self.SETTINGS = var.SETTINGS
    self.AUDIO = var.AUDIO
    self.CONST = var.CONST
    self.ERROR = var.ERROR

    if self.SETTINGS and self.AUDIO and self.ERROR and self.CONST then
      return self.ERROR.ok
    else
      return const.ERROR.not_init
    end -- if
  end -- Initialize

  local error = const.ERROR.unknown
  if serial_config then
    do -- Incapcilate namespace.
      loadstring(serial_config)()
        error = Initialize(GLOBAL_CONFIG)
    end -- do

    local current_settings = const.SETTINGS
    local current_audio = const.AUDIO
    -- Update keys.
    table.foreach(current_settings,
      function(k, v)
        if (not self.SETTINGS[k]) or (self.SETTINGS[k].descr ~= current_settings[k].descr) or (self.SETTINGS[k].group ~= current_settings[k].group) or (type(self.SETTINGS[k].value) ~= type(current_settings[k].value)) then
          self.SETTINGS[k] = v
        end -- if
      end ) -- anon 

    table.foreach(self.SETTINGS,
      function(k)
        -- Remove missing keys.
        if (not current_settings[k]) then
          self.SETTINGS[k] = nil
      end -- if
    end ) -- anon

    table.foreach(current_audio,
      function(k, v)
        if (not self.AUDIO[k]) then
          self.AUDIO[k] = v
        end -- if
      end ) -- anon 

    table.foreach(self.AUDIO,
      function(k)
        if (not current_audio[k]) then
          self.AUDIO[k] = nil
      end -- if
    end ) -- anon

  else
    error= Initialize(const)
  end -- if

  return error
end -- _init

function Config:GetOption(key)
  return self.SETTINGS[key] or self.ERROR.invalid_argument
end -- GetOption

function Config:GetAttribute(group, attr)
  if self.AUDIO[group] and self.AUDIO[group][attr] then
    return self.AUDIO[group][attr]
  end -- if

  return self.ERROR.invalid_argument
end -- GetAttribute

function Config:SetOption(key, val)
  if not self.SETTINGS[key] then
    return self.ERROR.invalid_argument
  end -- if

  self.SETTINGS[key].value = val
  return self.ERROR.ok
end -- SetOption

function Config:SetAttribute(group, attr, val)
  if not self.AUDIO[group] or not self.AUDIO[group][attr] then
    return self.ERROR.invalid_argument
  end -- if

  if type(val) ~= type(self.AUDIO[group][attr]) then
    return self.ERROR.invalid_type
  end -- if

  self.AUDIO[group][attr] = val
  return self.ERROR.ok
end -- SetAttribute

function Config:Save()

  GLOBAL_CONFIG = {
    SETTINGS = self.SETTINGS,
    AUDIO = self.AUDIO,
    CONST = self.CONST,
    ERROR = self.ERROR
  }

  local serialize = require("serialize")
  local serial_config, error = serialize.save("GLOBAL_CONFIG")

  if type(serial_config) ~= 'string' then
    return error or self.ERROR.unknown
  end -- if

  local code = SetVariable(self.CONST.mush_var, serial_config)

  if code ~= 0 then
    return self.ERROR.not_saved
  end -- if

  return self.ERROR.ok
end -- Save

function Config:GetConst(var)

  if self.CONST[var] == nil then
    return self.ERROR.invalid_argument
  end -- if

  return self.CONST[var]
end -- GetConst

function Config:RenderMenuList(option)
  local menu, seen_previously = {}, {}

  for k,v in pairs(self.SETTINGS) do
    if option and string.find(v.group, option) then
      menu[k] = v.descr.." Currently: "..tostring(v.value)
    elseif (not option) and (not seen_previously[v.group]) then
      menu[#menu + 1] = tostring(v.group)
      seen_previously[v.group] = true
    end -- if
  end -- for

  if not next(menu) then
    return self.ERROR.invalid_argument
  end -- if

  return menu
end -- RenderMenuList

function Config:IsOption(key)

  if not self.SETTINGS[key] then
    return false
  end -- if

  return true
end -- IsOption

function Config:OptionType(key)

  if not self.SETTINGS[key] then
    return self.ERROR.invalid_argument
  end -- if

  return type(self.SETTINGS[key].value) or self.ERROR.unknown
end -- OptionType

function Config:IsMute()

  if type(self.CONST.master_mute) ~= 'boolean' then
    return self.ERROR.unknown
  end -- if

  return self.CONST.master_mute
end -- IsMute

function Config:ToggleMute()
  self.CONST.master_mute = not self.CONST.master_mute and true or false

  return self.CONST.master_mute
end -- Mute

function Config:GetVersion()
  return self.CONST.version or self.ERROR.unknown
end -- GetVersion

function Config:GetAudioGroups()

  local groups = {}
  for k in pairs(self.AUDIO) do

    groups[#(groups)+1] = k
  end -- for

  return not next(groups)
  and const.ERROR.unknown
  or groups
end -- GetGroups

return Config