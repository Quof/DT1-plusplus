#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-8,-8,8,8)

//Enemy base statistics
damageType="SPIRIT"
elementType=1
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
wallHit=false
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    dir=point_direction(x,y,oCharacter.x,oCharacter.y)
    init=1
  }
  if isCollisionBottom(1)
    wallHit=true
  if isCollisionLeft(1)
    wallHit=true
  if isCollisionRight(1)
    wallHit=true
  if isCollisionTop(1)
    wallHit=true

  if wallHit=true
  {
    explosion=instance_create(x,y+8,oGASGExplosion)
    explosion.spiritPower=spiritPower-10
    explosion.sprite_index=sFlameUp
    explosion.image_speed=0.33
    explosion.damageType="SPIRIT"
    explosion.elementType=1
    playSound(global.snd_CASdie,0,1)
    instance_destroy()
  }
  //moveTo(throwSpeed*cos(degtorad(dir)),-throwSpeed*sin(degtorad(dir)))
  moveTo(throwSpeed*cos(degtorad(dir))*gDeltaTime,-throwSpeed*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
