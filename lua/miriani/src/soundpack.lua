-- @module soundpack
-- Provides global methods for soundpack negotiations.

-- author: Erick Rosso
-- Last updated on 2021.01.22
---------------------------------------------

function SoundpackHook(name, line, wc)
  local hook = table.remove(wc, 1);
  wc = utils.split(wc[1], "|")

  table.foreach(wc,
    function(k, v)
      wc[k] = Trim(v)
    end -- anon
  ) -- foreach

  if hook == "status" then
    Status(wc)
  elseif hook == "social" then
    Social(wc)
  end -- if

end -- SoundpackHook

function Emote(wc)

end -- Emote

function Environment(wc)

end -- Environment

function Room(wc)

end -- Room

function Status(wc)

end -- Status

function Social(wc)
  local gender = string.lower(wc[2])
  local file = string.format("%ssocial/%s/%s*%s",
    config:GetConst("sdir"), gender, wc[1], config:GetConst("ext"))

  -- Game shortens the social text depending on what user typed.

  local socialTable = utils.readdir(file) 

  if not socialTable then
    if gender ~= "neuter" then
      wc[2] = "neuter"
      Social(wc)
    end -- if
    return 0
  end -- social exists

  local social = string.match(
    string.gsub(
      next(socialTable), "%d+", ""), "("..string.lower(wc[1]).."[%w%W]+)")

  social = string.gsub (social, config:GetConst("ext"), "")

  Play(
    string.format("social/%s/%s", gender, social), "socials")
end -- Social