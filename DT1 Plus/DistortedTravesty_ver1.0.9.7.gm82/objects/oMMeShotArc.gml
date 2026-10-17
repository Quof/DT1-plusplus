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
timeToDestroy=150
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("newTime")
  timeToDestroy=newTime
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if arcTime>0
  {
    //direction+=bulletArc
    _direction+=bulletArc*gDeltaTime //60fps change: per 30fps tick; _direction stands in for direction (see correctSpeedDirection)
    //image_angle=direction
    image_angle=_direction //60fps change: see above
    //arcTime-=1
    arcTime-=gDeltaTime //60fps change: counts 30fps ticks
  }
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)

  //timeToDestroy-=1
  timeToDestroy-=gDeltaTime //60fps change: counts 30fps ticks
  if timeToDestroy<=1
    instance_destroy()
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
if bDestroyOnOutside=1
  instance_destroy()
