#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-6,18,6)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
effectDelay=0
weight=90
bBlownUp=false
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
  //if effectDelay=0
  if effectDelay<=0 //60fps change: see below
  {
    sporeSmoke=instance_create(x,y,oGASGExplosion)
    sporeSmoke.spiritPower=spiritPower-50
    sporeSmoke.damageType="SPIRIT"
    sporeSmoke.sprite_index=sDR_SporeSmoke
    sporeSmoke.bInflictPoison=true
    sporeSmoke.image_speed=0.4
    //effectDelay=7
    effectDelay=8-gDeltaTime //60fps change: counts down 30fps ticks; the frame that makes the smoke counts as a whole tick, as at 30fps (it doesn't count down), so the count starts that much lower (7 at 30fps)
  }
  else
    //effectDelay-=1
    effectDelay-=gDeltaTime //60fps change: counts 30fps ticks

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
    sporeSmoke=instance_create(x,y,oGASGExplosion)
    sporeSmoke.spiritPower=spiritPower-50
    sporeSmoke.damageType="SPIRIT"
    sporeSmoke.sprite_index=sDR_SporeSmoke
    sporeSmoke.bInflictPoison=true
    sporeSmoke.image_speed=0.4
    instance_destroy()
  }
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  if y>room_height+32
    instance_destroy()
}
