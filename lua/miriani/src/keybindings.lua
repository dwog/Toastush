--- Defines global accelerators.
local script = 12
AcceleratorTo ("F10", 'CycleAudioGroups()', script) -- cycle sounds
AcceleratorTo("ALT + F10", 'ToggleMute()', script)
AcceleratorTo("F11", 'DecreaseAttribute("vol")', script)
AcceleratorTo("F12", 'IncreaseAttribute("vol")', script)
