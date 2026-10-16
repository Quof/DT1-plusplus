//60fps change (added): from DT3 60FPS. _speed/_direction stand in for GameMaker's built-in speed/direction, which GM
//applies in full every frame. Call once per Step (near the end) on an object that uses them: correctSpeedDirection(id)
//An instance that never set them counts as 0, as the built-ins did
if !instance_exists(argument0) {exit} //(destroyed earlier this step: GM8 keeps running the rest of the event)
with argument0
{
  if !variable_local_exists("_speed") {_speed=0}
  if !variable_local_exists("_direction") {_direction=0}
}
argument0.x += cos(degtorad(argument0._direction)) * argument0._speed * gDeltaTime;
argument0.y -= sin(degtorad(argument0._direction)) * argument0._speed * gDeltaTime;
