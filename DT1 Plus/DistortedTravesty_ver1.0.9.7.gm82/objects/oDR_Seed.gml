#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-6,-6,6,6)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
weight=200
bGroundHit=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //yVel+=0.2
  yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  //image_angle+=20
  image_angle+=20*gDeltaTime //60fps change: per 30fps tick

  if isCollisionTop(1)
    bGroundHit=true
  if isCollisionBottom(1)
    bGroundHit=true
  if isCollisionLeft(1)
    bGroundHit=true
  if isCollisionRight(1)
    bGroundHit=true
  if bGroundHit=true
  {
    lineRootStrike=instance_create(x,oDragonroot.yGround,oDR_RootSpike)
    lineRootStrike.spiritPower=spiritPower
    lineRootStrike.damageType="SPIRIT"
    lineRootStrike.elementType=4
    instance_destroy()
  }
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
