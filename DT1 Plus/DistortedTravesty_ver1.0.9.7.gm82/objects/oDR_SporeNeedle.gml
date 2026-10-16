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
  yVel+=0.2
  image_angle+=20
  if effectDelay=0
  {
    sporeSmoke=instance_create(x,y,oGASGExplosion)
    sporeSmoke.spiritPower=spiritPower-50
    sporeSmoke.damageType="SPIRIT"
    sporeSmoke.sprite_index=sDR_SporeSmoke
    sporeSmoke.bInflictPoison=true
    sporeSmoke.image_speed=0.4
    effectDelay=7
  }
  else
    effectDelay-=1

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
  moveTo(xVel,yVel)

  if y>room_height+32
    instance_destroy()
}
