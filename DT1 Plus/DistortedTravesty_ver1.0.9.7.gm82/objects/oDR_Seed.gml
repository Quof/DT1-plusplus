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
  yVel+=0.2
  image_angle+=20

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
  moveTo(xVel,yVel)
}
