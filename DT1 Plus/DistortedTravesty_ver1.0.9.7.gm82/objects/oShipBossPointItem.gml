#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_blue
image_alpha=0.75
pointValue=round((oPlayerShip.grazeCount*3.5)+100)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //speed=12
  _speed=12 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
  //direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
  _direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y) //60fps change: see above
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Collision_oPlayerShip
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayerShip.shooterCurrentScore+=pointValue
instance_destroy()
