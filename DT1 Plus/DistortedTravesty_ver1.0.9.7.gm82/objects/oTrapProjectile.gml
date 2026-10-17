#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-2,-2,2,2)

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
  //image_angle=direction
  image_angle=_direction //60fps change: _direction stands in for direction (see correctSpeedDirection)
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  dist=point_distance(x,y,xstart,ystart)
  if dist>32
  {
    if isCollisionTop(1)
      bBlownUp=true
    if isCollisionBottom(1)
      bBlownUp=true
    if isCollisionLeft(1)
      bBlownUp=true
    if isCollisionRight(1)
      bBlownUp=true
    if bBlownUp=true
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
