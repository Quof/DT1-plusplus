#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("_speed") {_speed=speed; _direction=direction; speed=0} //60fps change (added): _speed/_direction stand in for the built-in speed/direction (taken over from those if something set them)
if x<view_xview[0]-xSize
  instance_destroy()
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
colorInverter(0,xSize,ySize)
