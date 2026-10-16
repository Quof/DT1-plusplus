//60fps change (added): from DT3 60FPS. _hspeed/_vspeed stand in for GameMaker's built-in hspeed/vspeed, which GM
//applies in full every frame. Call once per Step (near the end) on an object that uses them: correctHSpeedVSpeed(id)
//An instance that never set them counts as 0, as the built-ins did
if !instance_exists(argument0) {exit} //(destroyed earlier this step: GM8 keeps running the rest of the event)
with argument0
{
  if !variable_local_exists("_hspeed") {_hspeed=0}
  if !variable_local_exists("_vspeed") {_vspeed=0}
}
argument0.x += argument0._hspeed * gDeltaTime;
argument0.y += argument0._vspeed * gDeltaTime;
