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
  <send>Play("misc/bioDoor")</send>
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
   match="^The starship (?:begins)?\s?(?:vibrating|shudders) (?:violently|beneath) (?:as|your) (?:the|feet).? (?:hum|It|as) (?:picks|feels|it) (?:up|like|continues) (?:in|the|propelling) (?:intensity|hull is breaking apart around you|itself forward)\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >  
  <send>Play ("ship/misc/creak")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^With a sharp lurch, the starship completes its intrasector (?:slip|wavewarp)\.?\s?(?:The pulsing sound stops as the wavewarp drive powers down)?\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The vibration diminishes as the starship completes its subwarp\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The sounds of the relativity drive slowly cease as the starship comes to a halt\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play ("ship/move/relStop")</send>
</trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The experience abruptly ends as the starship exits from the companion jumpgate and the relativity drive takes over to slow the ship to a stop\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/relStop")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You feel a mild vibration as the ship nears the active jumpgate\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/jump")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear a thunk as a salvaging line is deployed into space\. You watch as the line slowly winds its way to a piece of debris, projects an energy net around it and begins to slowly make its way back to the ship\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/salvageLine")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You feel mild acceleration as the ship (?:descends|moves) toward .+\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/land")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The sounds of the relativity drive calm as the starship completes its final maneuver into (space)\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The sound of the relativity drive echoes through the room as it propels the ship towards space\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/launch")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The deck beneath you vibrates slightly as the relativity drive begins accelerating the starship through space\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/relStart")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^A (chime) (?:sounds|is piped through a nearby speaker), indicating that somebody has entered the airlock\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/chime")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The hatch acknowledges your key and unlocks, allowing you to .+ through\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/enter")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^.+ through the (broken|unlocked) hatch of .+\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/enter")</send>
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
  <trigger
   enabled="y"
   script="Filter"
   match="^You notice a faint hum begin to emanate from nowhere in particular as the starship's systems begin to power up\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/enablePower", "other", true)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You suddenly become aware of a decrease in noise as the ship's systems shut down, leaving you in complete silence\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   sequence="100"
   omit_from_log="y"
  >
  <send>Play("ship/move/disablePower", "other", true)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear (?:several clinking|a deafening booming|a buzzing|a shrill screeching|an electrical zapping) sound.+?\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/repair")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear several loud thuds as cargo is transferred from the ship\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/startTransfer")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The noises coming from the storage room gradually cease until they can be heard no more\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/endTransfer")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^(?:You hear the bustle of activity from the ship's cargo hold|A haunting screech drifts in from the storage room as something heavy is dragged across the floor|A loud whirring sound comes from the ship's storage room as motorized lifts haul cargo away|A loud bang emanates from the storage room as workers haul cargo out|A series of drones lift canisters of atmospheric debris and cart them off|You hear scrapes and scratching coming from the storage compartment as debris is transferred)\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/transfer", 0, 1)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear a loud clang as robotic arms seize the ship and transport it to the .+\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/clang")</send>
  </trigger>
  <trigger
   enabled="y"
script="Filter"
   match="^A destination appears on the ship's navigation controls: (.+?)\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/move/course")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You instruct the computer to calculate the distance between your current galactic coordinates and the last known location of the standard navigational beacons\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/beacon")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^A small light on the airlock control panel turns from red to yellow\. The faint hiss of air can be heard (exiting|entering) the airlock\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/airlock/airStart")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The hiss of air slowly fades away into nothingness, and the yellow light becomes green\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/airlock/airStop")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear \w+ thunks? as salvage lines? are simultaneously deployed into space\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/bulkSalvage")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You feel a mighty shaking as something seemingly large impacts the hull\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/misc/debrisHit")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^Objects\s+Direction\s+Lightyears\s+Coordinates\s+$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play ("ship/computer/lrscan")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear a mechanical whine as the laser reflectors reorient themselves\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/combat/reflector", "combat")</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The ship jerks slightly as its turrets are fired\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>
   Play("ship/combat/laser", "combat", false, true)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear a thunk as a chunk of charged weapons-grade bardenium is fired from the ship's cannons\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/combat/cannon", "combat", false, true)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^The room is filled with a .+? light as the laser turrets? (?:are|is) fired\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/combat/laser", "combat", false, true)</send>
  </trigger>
  <trigger
   enabled="y"
   script="Filter"
   match="^You hear several scraping sounds as bardenium is transferred from the ship's storage to the cannons\.$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  <send>Play("ship/combat/reload", "combat")</send>
  </trigger>
</triggers>
]=])
