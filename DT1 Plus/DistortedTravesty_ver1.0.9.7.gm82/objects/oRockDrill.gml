#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-5,-3,5,3)
currentSpell=oPlayer1.spellCasting
damageType="SPIRIT"
currentSpell="ROCK DRILL"
spiritPower=oPlayer1.spiritPower*0.7
elementType=global.p1CurrentElement

if oPlayer1.image_xscale=-1
  image_xscale=-1

if image_xscale=1
{
  xVel=2
  x+=8
}
else
{
  xVel=-2
  x-=8
}
skillPower=50
image_speed=0.33
lifeTime=75
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if currentSpell="FIREBALL"
  {
    if isCollisionLeft(1)
      instance_destroy()
    if isCollisionRight(1)
      instance_destroy()
  }
  if image_xscale=1 and xVel<10
    //xVel+=0.25
    xVel=scrGravAccX(xVel,0.25,1) //60fps change: speeds up per 30fps tick, following the 30fps path
  else if image_xscale=-1 and xVel>-10
    //xVel-=0.25
    xVel=scrGravAccX(xVel,-0.25,1) //60fps change: see above

  if lifeTime<=0
    instance_destroy()
  else
    //lifeTime-=1
    lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
#define Collision_oBreakableBlock1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other
  instance_destroy()
effect=instance_create(x,y,oEffect)
effect.sprite_index=sGrenadeExplosion
effect.image_xscale=0.65
effect.image_yscale=0.65
instance_destroy()
