#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_alpha=0.5
image_speed=0
bossFrame=0
circleAngle=45

//Enemy base statistics
eName="Fourth Wall Crusher"
maxLife=26500
life=maxLife
expWorth=125000
physicalPower=380
physicalDefense=190
spiritPower=470
spiritDefense=240
bIsBoss=true
FIREresist=5
WATERresist=-5
WINDresist=-5
EARTHresist=5
barAmount=3
questType=1
bCanDealDamage=false
activateBoss=0
specialAttack=0
if global.difficulty=1
{
  spiralHellWait=310
  spiralHellAmt=24
  screenAtkWait=410
  bigSpikeWait=160
  bigSpikeAmt=3
}
else if global.difficulty=2
{
  spiralHellWait=290
  spiralHellAmt=28
  screenAtkWait=380
  bigSpikeWait=150
  bigSpikeAmt=4
}
else if global.difficulty=3
{
  spiralHellWait=270
  spiralHellAmt=32
  screenAtkWait=360
  bigSpikeWait=140
  bigSpikeAmt=5
}
else if global.difficulty=4
{
  spiralHellWait=250
  spiralHellAmt=36
  screenAtkWait=340
  bigSpikeWait=130
  bigSpikeAmt=6
}
bossProgress=0
spiralHellTime=0
doubleHell=0
screenAtkTime=screenAtkWait-30
bigSpikeTime=bigSpikeWait=45
bigSpikeCur=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Full Swing#>Upward Strike#>Full Swing#>Any Physical"
setPDefense=physicalDefense
setSDefense=spiritDefense

xCenter=512
yGround=320
roomSpan=192
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
    combatText="This is just weird, one of its attacks are oddly stretched screenshots. By themselves, they aren't a threat, but mixed in with its awkward bullet storm and it can get rough. Fortunately, those are its only main attacks. It will, however, enter a super mode and use those death rings. They will scale down and then scale back up. Once you see it, you'll know what I mean. You need to follow along it counter-clockwise."
    sideText="This is honestly a filler boss. It won't take too long to beat it as long as you fight smart. Don't attempt to get an extra hit in if it means you may get hit. It will hit hard, especially those rings, so you should make defense your priority. Oh yeah, bonus points if you can recognize the silhouette."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //bossFrame+=1
    //if bossFrame>=1 and bossFrame<=8
    //  image_index=0
    //else if bossFrame>=9 and bossFrame<=16
    //  image_index=1
    //else if bossFrame>=17 and bossFrame<=24
    //  image_index=2
    //else if bossFrame>=25
    //60fps change: counts 30fps ticks (the same ticks: >a-1 is >=a in whole ticks)
    bossFrame+=gDeltaTime
    if bossFrame>0 and bossFrame<=8
      image_index=0
    else if bossFrame>8 and bossFrame<=16
      image_index=1
    else if bossFrame>16 and bossFrame<=24
      image_index=2
    else if bossFrame>24
    {
      image_index=1
      if bossFrame>=32
        bossFrame=0
    }
    //---------- Normal Attack: Spiral Hell ----------
    if specialAttack!=2 and specialAttack!=5
      //spiralHellTime+=1
      spiralHellTime+=gDeltaTime //60fps change: counts 30fps ticks

    //if spiralHellTime=spiralHellWait
    if scrCountPass(spiralHellTime,spiralHellWait) and ((specialAttack!=2 and specialAttack!=5) or gDeltaDoTicks) //60fps change: once, when the count reaches it (in the spike wheel it's held there, and this made one every 30fps tick)
    {
      afterImage=instance_create(x,y,oEnemyAfterImage)
      afterImage.image_alpha=0.4
      afterImage.sprite_index=sprite_index
      afterImage.image_index=image_index
      afterImage.imageFade=0.05
      afterImage.xScalingSet=0.075
      afterImage.yScalingSet=0.075
    }
    if spiralHellTime>=spiralHellWait+20
    {
      dir=random(360)
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,dir)
        newBullet.y=y+lengthdir_y(8,dir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=15+(i*2)
        newBullet.bulletArc=5

        if doubleHell=3
        {
          newBullet=instance_create(x,y,oMMeShotArc)
          newBullet.x=x+lengthdir_x(8,dir)
          newBullet.y=y+lengthdir_y(8,dir)
          newBullet.damageType="SPIRIT"
          newBullet.spiritPower=spiritPower
          newBullet.bDestroyOnOutside=0
          newBullet.bulletSpeed=5
          //newBullet.direction=dir+180
          newBullet._direction=dir+180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newBullet.arcTime=15+(i*2)
          newBullet.bulletArc=-5
        }
        dir+=360/spiralHellAmt
      }
      if doubleHell>=1
      {
        doubleHell+=1
        if doubleHell=4
          doubleHell=1
      }
      spiralHellTime=0
    }
    //---------- Normal Attack: Screen Attack ----------
    if specialAttack!=2 and specialAttack!=5
      //screenAtkTime+=1
      screenAtkTime+=gDeltaTime //60fps change: counts 30fps ticks
    if screenAtkTime>=screenAtkWait
    {
      var pDir1,pDir2,ySpawn;
      ySpawn=random_range(16,80)
      pDir1=point_direction(xCenter+512,ySpawn,oPlayer1.x,oPlayer1.y-26)
      pDir2=point_direction(xCenter-512,ySpawn,oPlayer1.x,oPlayer1.y-26)

      scrAtkR=instance_create(xCenter+512,ySpawn,oScreenAttack)
      scrAtkR.damageType="SPIRIT"
      scrAtkR.spiritPower=spiritPower
      //scrAtkR.direction=pDir1
      scrAtkR._direction=pDir1 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      scrAtkR.image_angle=pDir1
      scrAtkL=instance_create(xCenter-512,ySpawn,oScreenAttack)
      scrAtkL.damageType="SPIRIT"
      scrAtkL.spiritPower=spiritPower
      //scrAtkL.direction=pDir2
      scrAtkL._direction=pDir2 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      scrAtkL.image_angle=pDir2
      screenAtkTime=0
    }
    //---------- Special Attack: Spike Wheel ----------
    if specialAttack=2 or specialAttack=5
    {
      spiralHellTime=spiralHellWait
      //bigSpikeTime+=1
      bigSpikeTime+=gDeltaTime //60fps change: counts 30fps ticks
      if bigSpikeTime>=bigSpikeWait
      {
        bigSpikeAtk=instance_create(x,y,oFWSpikeCircle)
        bigSpikeAtk.image_xscale=6
        bigSpikeAtk.image_yscale=6
        bigSpikeAtk.image_angle=circleAngle
        bigSpikeAtk.spinSpd=3
        bigSpikeAtk.bDestroyOnSmallScale=0

        circleAngle+=90
        bigSpikeTime=0

        if bigSpikeCur>=bigSpikeAmt
        {
          physicalDefense=setPDefense
          spiritDefense=setSDefense
          circleAngle=0
          bigSpikeTime=0
          spiralHellTime=spiralHellWait-90
          screenAtkTime-=30
          if screenAtkTime<0
            screenAtkTime=0
          bigSpikeCur=0
          specialAttack+=1
        }
        else
          bigSpikeCur+=1
      }
    }

    //check special attack timing
    if specialAttack=1 or specialAttack=4
    {
      physicalDefense=setPDefense*2
      spiritDefense=setSDefense*2
      specialAttack+=1
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      spiralHellWait-=global.difficulty
      screenAtkWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      spiralHellWait-=global.difficulty*2
      screenAtkWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      spiralHellWait-=global.difficulty*2
      spiralHellAmt+=1
      screenAtkWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      spiralHellWait-=global.difficulty*2
      spiralHellAmt+=1
      screenAtkWait-=global.difficulty*2
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      spiralHellWait-=global.difficulty*2
      screenAtkWait-=global.difficulty*2
      doubleHell=1
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      spiralHellWait-=global.difficulty*3
      spiralHellAmt+=global.difficulty
      screenAtkWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      spiralHellWait-=global.difficulty*2
      screenAtkWait-=global.difficulty*2
      bigSpikeWait-=5
      bigSpikeAmt+=1
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      spiralHellWait-=global.difficulty*3
      screenAtkWait-=global.difficulty*4
      spiralHellAmt+=1
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      spiralHellWait-=global.difficulty*3
      screenAtkWait-=global.difficulty*3
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.attackType=other.HURRICANE_DASH {other.physicalPower=oPlayer1.physicalPower*1.1}

event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=3
  }
}
else if cripplePointProgress=3
{
  if damageTime=flashTime and dieFade=0
    inflictStatus(0)
}
