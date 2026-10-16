#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-3,-4,3,4)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
effectDelay=0
weight=50
bBlownUp=false
grav=1.25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=bulletSpeed
  if effectDelay=0
  {
    effect_create_above(ef_smoke,x,y,0,c_gray)
    effectDelay=2
  }
  else
    effectDelay-=1

  if direction>270
  {
    if direction>290
      direction-=2
  }
  else
  {
    if direction<250
      direction+=2
  }
  y+=grav
  image_angle=direction
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
    explosion=instance_create(x,y+6,oGASGExplosion)
    if damageType="PHYSICAL"
      explosion.physicalPower=physicalPower
    else if damageType="SPIRIT"
    {
      explosion.spiritPower=spiritPower
      explosion.damageType="SPIRIT"
    }
    explosion.sprite_index=sALfirePillar
    explosion.image_speed=0.75
    playSound(global.snd_CASdie,0,1)
    instance_destroy()
  }
  moveTo(xVel,yVel)

  if y>room_height+32
    instance_destroy()
}
else
  speed=0
