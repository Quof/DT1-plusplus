#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-3,-3,3,3)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bBlownUp=false
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
  if isCollisionTop(1)
    bBlownUp=true
  if isCollisionBottom(1)
    bBlownUp=true
  if isCollisionLeft(1)
    bBlownUp=true
  if isCollisionRight(1)
    bBlownUp=true
  if bBlownUp=true
  {
    explosion=instance_create(x,y,oDataBomb)
    if damageType="PHYSICAL"
      explosion.physicalPower=physicalPower
    else if damageType="SPIRIT"
    {
      explosion.spiritPower=spiritPower
      explosion.damageType="SPIRIT"
    }
    explosion.elementType=elementType
    instance_destroy()
  }
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
