#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Mecha Guardian"
maxLife=60000
life=maxLife
expWorth=300000
physicalPower=500
physicalDefense=150
spiritPower=300
spiritDefense=300
bIsBoss=true
barAmount=4
questType=1
bCanDealDamage=false
hitSound=global.snd_MMeHit
flashTime=3
activateBoss=0
if global.difficulty=1
{
  crossSpiralWait=330
  crossSpiralAmt=3
  roseSparkWait=400
  roseSparkFreq=8
  roseSparkAmt=3
  roseSparkLength=130
  windBurstWait=950
}
else if global.difficulty=2
{
  crossSpiralWait=310
  crossSpiralAmt=4
  roseSparkWait=380
  roseSparkFreq=7
  roseSparkAmt=4
  roseSparkLength=140
  windBurstWait=900
}
else if global.difficulty=3
{
  crossSpiralWait=290
  crossSpiralAmt=5
  roseSparkWait=360
  roseSparkFreq=7
  roseSparkAmt=5
  roseSparkLength=150
  windBurstWait=880
}
else if global.difficulty=4
{
  crossSpiralWait=270
  crossSpiralAmt=6
  roseSparkWait=330
  roseSparkFreq=6
  roseSparkAmt=5
  roseSparkLength=160
  windBurstWait=850
}

crossSpiralTime=crossSpiralWait-45
crossSpiralCurrent=0
roseSparkDelay=0
roseSparkTime=80
windBurstTime=windBurstWait-50
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">None"

spawnHeadX=x-57
spawnHeadY=y-58
spawnMainX=x-32
spawnMainY=y-48
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="This thing should be easy with your boosted recovery. It has a bullet hell attack that you can easily break through and a bomb that, once it is over you, will explode and a laser will shoot down. Don't question it, I don't get it either. Nothing else to say on it, though there appears to be more to this."
    sideText="This is the last barrier between you and The Artist. He can't fight back, so just beat this thing and lets end this. With my nearly limitless access to the system and The Darkness backing us up, we're unstoppable."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //------------------------- Bullet Attack: Cross Spiral -------------------------
    crossSpiralTime+=1
    if crossSpiralTime>=crossSpiralWait
    {
      //spawn bullets
      if crossSpiralTime mod 15=0
      {
        crossSpiralCurrent+=1
        effect=instance_create(spawnHeadX,spawnHeadY,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_xscale=0.3
        effect.image_yscale=0.3
        effect.newBlend=1

        newLaser=instance_create(spawnHeadX,spawnHeadY,oMechaLaser)
        newLaser.physicalPower=physicalPower
        newLaser.bulletSpeed=7
        newLaser.direction=179
      }
      if crossSpiralCurrent>=crossSpiralAmt
      {
        crossSpiralCurrent=0
        crossSpiralTime=0
      }
    }
    //------------------------- Bullet Attack: Rose Spark -------------------------
    roseSparkTime+=1
    if roseSparkTime>=roseSparkWait
    {
      if roseSparkTime=roseSparkWait
        roseSparkDir=0

      if roseSparkTime mod roseSparkFreq=0
      {
        effect=instance_create(spawnMainX,spawnMainY,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_xscale=0.3
        effect.image_yscale=0.3
        effect.newBlend=1

        var roseTemp;
        roseTemp=0
        for(i=0;i<roseSparkAmt;i+=1)
        {
          newBullet=instance_create(spawnMainX,spawnMainY,oMechaBullet)
          newBullet.physicalPower=physicalPower
          newBullet.bulletSpeed=7
          newBullet.direction=roseSparkDir+roseTemp
          roseTemp+=360/roseSparkAmt
        }
        if bossProgress<=1
          roseSparkDir+=6
        else
          roseSparkDir+=8
      }
      if roseSparkTime=roseSparkWait+roseSparkLength
        roseSparkTime=0
    }
    //------------------------- Special Attack: Wind Burst/Run Disable -------------------------
    if bossProgress>=2
      windBurstTime+=1
    if windBurstTime=windBurstWait //wind burst warn
    {
      afterImage=instance_create(oPlayer1.x,oPlayer1.y,oEnemyAfterImage)
      afterImage.sprite_index=sTheArtistIdle
      afterImage.image_xscale=-1
      afterImage.imageFade=0.025
      afterImage.xScalingSet=-0.075
      afterImage.yScalingSet=0.075
    }
    else if windBurstTime>=windBurstWait+55 and windBurstTime<=windBurstWait+95 //wind burst execute
    {
      oPlayer1.canRun=0
      oPlayer1.xVel=-13
    }
    else if windBurstTime>=windBurstWait+96
      windBurstTime=0

    //scale difficulty
    if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=0
    {
      crossSpiralWait-=global.difficulty*3
      roseSparkWait-=global.difficulty*3
      roseSparkFreq-=1
      roseSparkLength+=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=1
    {
      crossSpiralWait-=global.difficulty*3
      roseSparkWait-=global.difficulty*3
      roseSparkFreq-=1
      roseSparkAmt+=1
      roseSparkLength+=global.difficulty*3
      oEvPrimaryMemoryW1.xShowTime=10
      shroudAssist=instance_create(1568,oPlayer1.y-128,oNpcShroud)
      shroudAssist.bActive=true
      shroudAssist.spawnCount=1
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=2
    {
      crossSpiralWait-=global.difficulty*3
      crossSpiralAmt+=1
      roseSparkWait-=global.difficulty*3
      roseSparkFreq-=1
      roseSparkLength+=global.difficulty*3
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
