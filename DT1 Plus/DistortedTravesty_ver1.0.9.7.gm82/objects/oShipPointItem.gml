#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_yellow
image_alpha=0.75
pointValue=oPlayerShip.grazeCount*20+1000
//direction=90
_direction=90 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
prog=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //prog+=1
  prog+=gDeltaTime //60fps change: counts 30fps ticks
  //if prog>=1 and prog<=8
  if prog>0 and prog<=8 //60fps change: the same 30fps ticks, counted in gDeltaTime steps (it counts up before the check)
    //speed=5
    _speed=5 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
  //else if prog>=9
  else if prog>8 //60fps change: the same 30fps ticks (see above)
  {
    //speed=2
    _speed=2 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
    //direction=270
    _direction=270 //60fps change: see above
  }
  if y>=room_height+8
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Collision_oPlayerShipGrazer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayerShip.shooterCurrentScore+=pointValue
instance_destroy()
