#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-2,-2,2,2)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bBlownUp=false

weight=50
grav=0.2
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
  //yVel+=grav
  yVel=scrGravAcc(yVel,grav,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  dist=point_distance(x,y,xstart,ystart)
  if dist>32
  {
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
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  if y>room_height+32
    instance_destroy()
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
