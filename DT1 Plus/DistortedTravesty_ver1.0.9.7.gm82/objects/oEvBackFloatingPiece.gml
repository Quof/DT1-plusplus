#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("_speed") {_speed=speed; _direction=direction; speed=0} //60fps change (added): _speed/_direction stand in for the built-in speed/direction (taken over from those if something set them)
if actorType=0
{
  //image_angle+=rotateSpeed
  image_angle+=rotateSpeed*gDeltaTime //60fps change: per 30fps tick
  //direction+=dirChange
  _direction+=dirChange*gDeltaTime //60fps change: turns per 30fps tick; _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
}
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if drawType=0
{
  draw_background_ext(backSet,vx,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
else if drawType=1
  draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
