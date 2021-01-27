-- @module menu
-- Provides a menu-driven for manipulating Toastush constants.

-- Author: Erick Rosso
-- Last updated on 2020.06.26

---------------------------------------------


function TMenu(option)
  local main_menu = config:RenderMenuList(option)
  local title, choice = string.format("%s Manager - version %s", GetPluginName(), config:GetVersion())

  local function SoundEffect(name)
    Play(
      string.format("audio/%s", name))
  end -- SoundEffect

  if type(main_menu) ~= 'table' then
  Announce("info", string.format("Unable to locate menu group '%s`.", option))
  return 0
  else
    table.sort(main_menu)
    -- Display main list.
    SoundEffect("prompt")
    choice = utils.listbox("Select Setting", title, main_menu, 1)
  end -- if

  -- provide interface for secondary menu.
  if choice then
    local secondary_menu, group = {}
    repeat -- Display menu until escaped.
      if (not option) then
        secondary_menu = config:RenderMenuList(group or main_menu[choice])
        -- Display nested options.
        SoundEffect("prompt")
        choice = utils.listbox("Select Setting", title, secondary_menu)
      end -- if

      -- Step our user through a sequence to determine the value type.
      if config:IsOption(choice) then
        -- Interface for boolean value.
        local yes_no = utils.msgbox("Select an option.", title, "yesnocancel", "?")
        config:SetOption(choice, yes_no ~= nil and yes_no ~= "cancel" and yes_no or config:GetOption(choice))
        option, group = nil, config:GetOption(choice).group
      end -- if
    until not choice
    assert(config:Save() == config.ERROR.ok)
  end -- if
  SoundEffect("close")
end -- TMenu
