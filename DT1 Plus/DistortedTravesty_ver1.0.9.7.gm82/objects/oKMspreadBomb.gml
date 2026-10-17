#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-5,-7,5,7)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
weight=50
explodeTime=40
grav=0.2
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //yVel+=grav
  yVel=scrGravAcc(yVel,grav,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  //image_angle+=1
  image_angle+=1*gDeltaTime //60fps change: per 30fps tick
  //explodeTime-=1
  explodeTime-=gDeltaTime //60fps change: counts 30fps ticks
  if explodeTime<=0
  {
    for(i=0;i<5;i+=1)
    {
      spreadBomb=instance_create(x,y,oGASGrenade)
      spreadBomb.damageType="PHYSICAL"
      spreadBomb.physicalPower=physicalPower
      spreadBomb.sprite_index=sKMbombShell
      spreadBomb.xVel=random_range(-2.5,2.5)
      spreadBomb.yVel=-random(2)-1.25
    }
    playSound(global.snd_CASdie,0,1)
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sGrenadeExplosion
    instance_destroy()
  }
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
