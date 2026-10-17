#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-3,-3,3,3)

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
//direction=90
_direction=90 //60fps change: _direction stands in for direction (see correctSpeedDirection)
arcStop=0
decayTime=150
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //image_angle+=8
  image_angle+=8*gDeltaTime //60fps change: per 30fps tick
  //60fps change: arcStop counts 30fps ticks, the turn is per 30fps tick (the same ticks: <=31 is <32 in whole
  //ticks) and _direction stands in for direction (see correctSpeedDirection)
  if dir=0
  {
    //arcStop+=1
    //if arcStop<32
    //  direction-=5
    //else
    //  direction-=1
    arcStop+=gDeltaTime
    if arcStop<=31
      _direction-=5*gDeltaTime
    else
      _direction-=1*gDeltaTime
  }
  else
  {
    //arcStop+=1
    //if arcStop<32
    //  direction+=5
    //else
    //  direction+=1
    arcStop+=gDeltaTime
    if arcStop<=31
      _direction+=5*gDeltaTime
    else
      _direction+=1*gDeltaTime
  }
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  if y>=room_height+24
    instance_destroy()
  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
