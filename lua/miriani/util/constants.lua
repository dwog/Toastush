-- Toastush Constants

local GLOBAL_CONFIG = {
  ERROR = {
    ok = 0, -- Executed with no errors.
    not_init = 1, -- Failed to initialize.
    invalid_argument = 2, -- Bad arguments provided.
    invalid_type = 3, -- Expected different typed arguments.
    not_saved = 4, -- Failed to save to mush variable.
    already = 5, -- Already initialized.
    invalid_file = 6,
    unknown = -1, -- Undetermined error.
  }, -- ERROR

  SETTINGS = {
    show_helpful_tips = {descr="Provide periodic helpful soundpack usability tips?", value="yes", group="notifications"},
    spam_filter = {descr="Enable advance text filters?", value="no", group="display"},
    update_notifications = {descr="Warn of pending updates?", value="yes", group="notifications"}
  }, -- SETTINGS

  AUDIO = {
    ambience = {vol=0.2, pan=0.0, freq=44100},
    combat = {vol=0.3, pan=0.0, freq=44100},
    communication = {vol=0.3, pan=0.0, freq=44100},
    master = {vol=0.3, pan=0.0, freq=44100},
    other = {vol=0.25, pan=0.0, freq=44100},
    socials = {vol=0.3, pan=0.0, freq=44100}
  }, -- AUDIO

  CONST = {
    sdir = "sounds/miriani/",
    ext = ".ogg",
    mush_var = "toastush_settings",
    master_mute = false,
    default_audio = "master",
    version = "1.0.1",
  } -- CONST

} -- GLOBAL_CONFIG

return GLOBAL_CONFIG