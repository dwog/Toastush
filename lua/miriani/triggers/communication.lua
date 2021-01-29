-- @module communications

-- Author: Erick Rosso
-- Last updated 2021.01.27

---------------------------------------------

ImportXML([=[
  <triggers>
  <trigger
   enabled="y"
   match="^\[Frequency ([0-9]{1,3}\.[0-9]{1,2}) ?\|? ?(\w+)?\] (.+?)$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>
  local text = string.format(
    "[%s] %s", "%2" ~= "" and "%2"
    or "%1", "%3")
  print(text)
  Channel(name, text, {"metaf", "communication"})
  </send>
  </trigger>

</triggers>

]=])