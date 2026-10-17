#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-30,7,-1)
image_speed=0.2

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
fireSpeed=6
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
  //spiritPower-=1
  spiritPower-=gDeltaTime //60fps change: per 30fps tick

  if isCollisionLeft(1)
    instance_destroy()
  if isCollisionRight(1)
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
