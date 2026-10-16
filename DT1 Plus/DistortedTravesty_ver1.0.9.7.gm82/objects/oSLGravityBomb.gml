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
  yVel+=grav
  if xVel>0
    image_angle+=15
  else if xVel<0
    image_angle-=15
  explodeTime-=1
  if explodeTime<=0
  {
    for(i=0;i<3;i+=1)
    {
      spreadBomb=instance_create(x,y,oGASGrenade)
      spreadBomb.damageType="PHYSICAL"
      spreadBomb.physicalPower=physicalPower
      spreadBomb.sprite_index=sShroudDiamond
      spreadBomb.image_xscale=0.65
      spreadBomb.image_yscale=0.65
      spreadBomb.xVel=random_range(-3,3)
      spreadBomb.yVel=-random(3)-1.5
    }
    playSound(global.snd_CASdie,0,1)
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sGrenadeExplosion
    instance_destroy()
  }
  moveTo(xVel,yVel)
}
