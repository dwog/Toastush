-- @module filters
-- Holds lines from the mud that should be parsed.
-- Author: Erick Rosso
-- Last updated 2021.01.24

---------------------------------------------

ImportXML([=[
<triggers>
  <trigger
   enabled="y"
   script="Filter"
   match="^-+$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You can go (.+\.)$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The door opens and allows .+ to pass\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
   send_to="14"
  >
  <send>Play("misc/bio_door", "other")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The bright light vanishes as the starship emerges at the other side of the wormhole\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You feel the sudden pull of acceleration as the starship's relativity drive kicks in, hurling you through the gate's event horizon\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The windows automatically dim as gate after gate becomes visible, each causing a brilliant flash of light as it redirects the wormhole\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   match="^You are suddenly jarred as the ship begins rapid deceleration\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The mild vibration of acceleration eases off (?:and|as) (?:is|the) (?:replaced|ship) (?:by|sets) (?:the|down) (?:firm|on) (?:pull|the) .+?\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The starship (?:begins)?\s?(?:vibrating|shudders) (?:violently|beneath) (?:as|your) (?:the|feet).? (?:hum|It|as) (?:picks|feels|it) (?:up|like|continues) (?:in|the|propelling) (?:intensity|hull is breaking apart around you|itself forward)\.$"
   regexp="y"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>


</triggers>
]=])
