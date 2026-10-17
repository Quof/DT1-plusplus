#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  //direction+=curveAmount
  _direction+=curveAmount*gDeltaTime //60fps change: per 30fps tick; _direction stands in for direction (see correctSpeedDirection)
  if curveAmount>1
    //curveAmount-=0.04
    curveAmount-=0.04*gDeltaTime //60fps change: per 30fps tick
  else
    //curveAmount+=0.04
    curveAmount+=0.04*gDeltaTime //60fps change: per 30fps tick
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
