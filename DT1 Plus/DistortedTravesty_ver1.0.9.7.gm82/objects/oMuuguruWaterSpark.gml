#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_speed=0 //60fps change (added): _speed/_direction stand in for the built-in speed/direction, which start at 0
_direction=0 //60fps change (added): (they must exist before anything reads them)
event_inherited()
//find the correct sprite for effect and collision
damageType="SKILL"
physicalPower=oPlayer1.physicalPower/1.2
elementType=2

attackType=MUUGURU
skillPower=5
image_speed=0.66
lifeTime=40
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)

  if lifeTime<=0
    instance_destroy()
  else
    //lifeTime-=1
    lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
