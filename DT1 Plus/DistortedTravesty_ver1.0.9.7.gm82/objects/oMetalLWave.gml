#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)
image_speed=0.33

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
fireSpeed=8
decayTime=150
if global.difficulty=1
  lightningCreateDelay=11
else if global.difficulty=2
  lightningCreateDelay=10
else if global.difficulty=3
  lightningCreateDelay=9
else if global.difficulty=4
  lightningCreateDelay=8
lightningCreateTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=fireSpeed

  lightningCreateTime+=1
  if lightningCreateTime>=lightningCreateDelay
  {
    mLightning=instance_create(x,y,oDustRScythe)
    mLightning.sprite_index=sMetallicLightning
    mLightning.type=2
    mLightning.spiritPower=spiritPower-10
    mLightning.bulletSpeed=10
    mLightning.direction=90
    mLightning=instance_create(x,y,oDustRScythe)
    mLightning.sprite_index=sMetallicLightning
    mLightning.type=2
    mLightning.spiritPower=spiritPower-10
    mLightning.bulletSpeed=10
    mLightning.direction=270

    lightningCreateTime=0
  }

  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
else
  speed=0
