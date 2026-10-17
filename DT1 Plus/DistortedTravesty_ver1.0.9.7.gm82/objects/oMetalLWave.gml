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
  //speed=fireSpeed
  _speed=fireSpeed //60fps change: moved by correctSpeedDirection (end of the step)

  //lightningCreateTime+=1
  lightningCreateTime+=gDeltaTime //60fps change: counts 30fps ticks
  if lightningCreateTime>=lightningCreateDelay
  {
    mLightning=instance_create(x,y,oDustRScythe)
    mLightning.sprite_index=sMetallicLightning
    mLightning.type=2
    mLightning.spiritPower=spiritPower-10
    mLightning.bulletSpeed=10
    //mLightning.direction=90
    mLightning._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
    mLightning=instance_create(x,y,oDustRScythe)
    mLightning.sprite_index=sMetallicLightning
    mLightning.type=2
    mLightning.spiritPower=spiritPower-10
    mLightning.bulletSpeed=10
    //mLightning.direction=270
    mLightning._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

    lightningCreateTime=0
  }

  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
