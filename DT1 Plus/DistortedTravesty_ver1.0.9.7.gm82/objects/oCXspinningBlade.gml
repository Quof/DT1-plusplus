#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
returnProg=0
returnTime=50
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //image_angle-=12
  image_angle-=12*gDeltaTime //60fps change: per 30fps tick
  //speed=throwSpeed
  _speed=throwSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  if returnProg=0
  {
    //returnTime-=1
    returnTime-=gDeltaTime //60fps change: counts 30fps ticks
    if returnTime<=0
      returnProg=1
  }
  else if returnProg=1 //slight wait
  {
    //returnTime+=1
    returnTime+=gDeltaTime //60fps change: counts 30fps ticks
    if returnTime>=10
      returnProg=2
  }
  else if returnProg=2 //return to sender
  {
    //direction=point_direction(x,y,returnID.x+xAdjust,returnID.y+yAdjust)
    _direction=point_direction(x,y,returnID.x+xAdjust,returnID.y+yAdjust) //60fps change: _direction stands in for direction (see correctSpeedDirection)
    if point_distance(x,y,returnID.x+xAdjust,returnID.y+yAdjust)<16
      instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
