#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-28,-28,28,28)

//Enemy base statistics
damageType="SPIRIT"
size=2
elementType=4
moveSpeed=2.5
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
playSound(global.snd_RockThrow,0,0.9)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if xVel<0
    //image_angle+=3
    image_angle+=3*gDeltaTime //60fps change: per 30fps tick
  else
    //image_angle-=3
    image_angle-=3*gDeltaTime //60fps change: per 30fps tick

  //yVel+=0.2
  yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionBottom(1)
    yVel=0
  if isCollisionLeft(1) and xVel<0
    instance_destroy()
  if isCollisionRight(1) and xVel>0
    instance_destroy()
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
