-- @module hooks
-- Handles out-of-band soundpack negotiations.
-- Protocol: https://miriani.toastsoft.net/help2/Soundpack%20Hooks

-- Author: Erick Rosso
-- Last updated 2021.01.22

---------------------------------------------

ImportXML([=[
<triggers>
  <trigger
   enabled="y"
   group="hooks"
   script="SoundpackHook"
   match="^#\$#soundpack (\w+) \|?(.+)$"
   regexp="y"
   send_to="14"
   omit_from_output="y"
   omit_from_log="y"
  >
  </trigger>


</triggers>
]=])
