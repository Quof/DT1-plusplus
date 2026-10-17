#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-3,-2,3,2)

//Enemy base statistics
damageType="SPIRIT"
elementType=1
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
  //if direction=180
  if _direction=180 //60fps change: _direction stands in for direction (see correctSpeedDirection)
    image_xscale=-1
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  if isCollisionTop(1)
    instance_destroy()
  if isCollisionBottom(1)
    instance_destroy()
  if isCollisionLeft(1)
    instance_destroy()
  if isCollisionRight(1)
    instance_destroy()
  if isCollisionSolid()
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
instance_destroy()
