#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)
image_speed=0.5
image_yscale=1.7

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
fireSpeed=10
changeTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //speed=fireSpeed
  _speed=fireSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  //changeTime+=1
  changeTime+=gDeltaTime //60fps change: counts 30fps ticks
  if changeTime>=45
  {
    //if direction=0
    //  direction=180
    //else
    //  direction=0
    //60fps change: _direction stands in for direction (see correctSpeedDirection)
    if _direction=0
      _direction=180
    else
      _direction=0
    changeTime=0
    twisterPasses-=1
    if twisterPasses<=0
      instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
