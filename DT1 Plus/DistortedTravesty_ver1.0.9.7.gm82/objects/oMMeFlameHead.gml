#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.2+random(0.05)
//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
damageType="SPIRIT"
elementType=1
changeTime=30
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
  //changeTime-=1
  changeTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if changeTime>0
  if changeTime>=1 //60fps change: the same 30fps ticks (the same as >0 in whole ticks)
  {
    if type=0 //right
    {
      //direction+=3
      _direction+=3*gDeltaTime //60fps change: per 30fps tick; _direction stands in for direction (see correctSpeedDirection)
    }
    else if type=1 //left
    {
      //direction-=3
      _direction-=3*gDeltaTime //60fps change: see above
    }
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
