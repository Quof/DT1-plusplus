#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0

//Enemy base statistics
eName="Ultimate Phalanx Body"
physicalPower=450
bIsBoss=true
bCanTakeDamage=false
activateBoss=0
if global.difficulty=1
{
  platformCreateWait=62
}
else if global.difficulty=2
{
  platformCreateWait=64
}
else if global.difficulty=3
{
  platformCreateWait=66
}
else if global.difficulty=4
{
  platformCreateWait=68
}
platformCreateTime=32
platformProg=0
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1 //create start platforms
  {
    effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+144,oPhalanx.yGround-112,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_speed=0.75
    effect.image_xscale=0.6
    effect.image_yscale=0.3
    effect.newBlend=1
    effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+144,oPhalanx.yGround-16,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_speed=0.75
    effect.image_xscale=0.6
    effect.image_yscale=0.3
    effect.newBlend=1

    effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+288,oPhalanx.yGround-64,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_speed=0.75
    effect.image_xscale=0.6
    effect.image_yscale=0.3
    effect.newBlend=1

    newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+128,oPhalanx.yGround-120,oPhalPlatform)
    newPlat.moveSpeedX=2
    newPlat.moveSpeedY=0
    newPlat.bStart=1
    newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+128,oPhalanx.yGround-24,oPhalPlatform)
    newPlat.moveSpeedX=2
    newPlat.moveSpeedY=0
    newPlat.bStart=1

    newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+256,oPhalanx.yGround-72,oPhalPlatform)
    newPlat.moveSpeedX=2
    newPlat.moveSpeedY=0
    newPlat.bStart=1

    combatText="Scan it's head, the body seems to be protected, so I can't get any info from it."
    sideText="Odd, I've never run into a problem where a specific part of the enemy must be scanned."
    activateBoss=2
  }
  else if activateBoss=2 //normal action
  {
    platformCreateTime+=1
    if platformCreateTime>=platformCreateWait
    {
      platformProg+=1
      if platformProg=1
      {
        effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+16,oPhalanx.yGround-112,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.6
        effect.image_yscale=0.3
        effect.newBlend=1
        effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+16,oPhalanx.yGround-16,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.6
        effect.image_yscale=0.3
        effect.newBlend=1

        newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan,oPhalanx.yGround-120,oPhalPlatform)
        newPlat.moveSpeedX=2
        newPlat.moveSpeedY=0
        newPlat.bStart=1
        newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan,oPhalanx.yGround-24,oPhalPlatform)
        newPlat.moveSpeedX=2
        newPlat.moveSpeedY=0
        newPlat.bStart=1
      }
      else if platformProg=2
      {
        effect=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan+16,oPhalanx.yGround-64,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.6
        effect.image_yscale=0.3
        effect.newBlend=1

        newPlat=instance_create(oPhalanx.xCenter-oPhalanx.roomSpan,oPhalanx.yGround-72,oPhalPlatform)
        newPlat.moveSpeedX=2
        newPlat.moveSpeedY=0
        newPlat.bStart=1
        platformProg=0
      }
      platformCreateTime=0
    }
  }
  enemyStepEvent()
}
