#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-130,40,-1)
y+=1
image_xscale=-1
image_speed=0
armFrame=0
frameCount=0
frameProg=0
armX=8
armY=109
bWalking=false

//Enemy base statistics
eName="Neo Guardian"
maxLife=18000
life=maxLife
expWorth=58000
physicalPower=320
physicalDefense=130
spiritPower=350
spiritDefense=180
skillResist=5
bIsBoss=true
barAmount=1
questType=1
currentAttack=0
activateBoss=0
if global.difficulty=1
{
  armWaveWait=190
  groundWaveLengthMod=0.8
  spikeRainWait=500
  waveSpamWait=640
  waveSpamFreq=18
}
else if global.difficulty=2
{
  armWaveWait=170
  groundWaveLengthMod=1
  spikeRainWait=450
  waveSpamWait=600
  waveSpamFreq=15
}
else if global.difficulty=3
{
  armWaveWait=150
  groundWaveLengthMod=1.1
  spikeRainWait=420
  waveSpamWait=560
  waveSpamFreq=13
}
else if global.difficulty=4
{
  armWaveWait=130
  groundWaveLengthMod=1.3
  spikeRainWait=390
  waveSpamWait=510
  waveSpamFreq=11
}
timeTillWalk=100
elementChangeWait=600
elementChangeTime=599
currentElement=0
armWaveTime=30
spikeRainTime=20
waveSpamTime=10
bossProgress=0
armAngle=90
armAnglePrev=armAngle
moveTime=0
moveSpeed=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Physical Attack Fused With Current Element#>Mental Insurrection"
setPDefense=physicalDefense
setSDefense=spiritDefense

waveSpamXspawn=608
waveSpamYspawn=16

xCenter=464
yGround=320
roomSpan=128
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
    combatText="This thing will set an elemental field aura, luckily it does not use it properly. However, it does drastically change his elemental weakness. I'm sure you can figure it out just from seeing it. When it raises it's left arm, you have to watch closely what it does. It may either change the field aura or throw a wave attack. If it raises it's arm all the way up, it will use it's wave spam attack. You can dash behind it if needed, just know that it will aim towards you. Also it shoots lightning out of it's feet when it walks. Which is pretty damn cool, I wish I could do that."
    sideText="It is from the SNES game, Xardion and will attack nothing like it did in that game. It definitely has a very menacing look to it. The Darkness likes to use intimidation as one of it's strategies it seems."
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    if oPlayer1.x<x
    {
      physicalDefense=setPDefense
      spiritDefense=setSDefense
    }
    else
    {
      physicalDefense=setPDefense*5
      spiritDefense=setSDefense*5
    }

    //****************************** ELEMENT CHANGE ******************************
    if elementChangeTime<elementChangeWait
      //elementChangeTime+=1
      elementChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if elementChangeTime>=elementChangeWait and currentAttack!=2 and currentAttack!=3
    {
      //elementChangeTime+=1
      elementChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
      currentAttack=1
      if elementChangeTime<=elementChangeWait+27 //rotate arm up
        //armAngle-=5
        armAngle-=5*gDeltaTime //60fps change: per 30fps tick
      //else if elementChangeTime>=elementChangeWait+41 and elementChangeTime<=elementChangeWait+49 //rotate arm back down
      else if elementChangeTime>elementChangeWait+40 and elementChangeTime<=elementChangeWait+49 //rotate arm back down //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        //armAngle+=15
        armAngle+=15*gDeltaTime //60fps change: per 30fps tick
      else if elementChangeTime>=elementChangeWait+50 //end orb throw
      {
        armAngle=90
        elementChangeTime=0
        currentAttack=0
      }

      //if elementChangeTime=elementChangeWait+43 //throw orb
      if scrCountPass(elementChangeTime,elementChangeWait+43) //throw orb //60fps change: once, when the count reaches it
      {
        var prevElem;
        prevElem=currentElement
        while(prevElem=currentElement)
        {
          currentElement=irandom_range(1,4)
        }
        if currentElement=1
        {
          FIREresist=-90
          WATERresist=100
          WINDresist=100
          EARTHresist=100
        }
        else if currentElement=2
        {
          FIREresist=100
          WATERresist=-90
          WINDresist=100
          EARTHresist=100
        }
        else if currentElement=3
        {
          FIREresist=100
          WATERresist=100
          WINDresist=-90
          EARTHresist=100
        }
        else if currentElement=4
        {
          FIREresist=100
          WATERresist=100
          WINDresist=100
          EARTHresist=-90
        }
        eOrb=instance_create(x-armX-16,y-armY,oElementalOrb)
        eOrb.type=currentElement
      }
    }

    //****************************** WALK ******************************
    //timeTillWalk+=1
    timeTillWalk+=gDeltaTime //60fps change: counts 30fps ticks
    if timeTillWalk>=300
    {
      //if timeTillWalk=300
      if scrCountPass(timeTillWalk,300) //60fps change: once, when the count reaches it
      {
        bWalking=true
        armFrame=1
        if x>xCenter+(roomSpan/2) //force left
          moveSpeed=-3
        else if x<xCenter-16 //force right
          moveSpeed=3
        else //choose one
          moveSpeed=choose(-3,3)
      }
      if bWalking=true
      {
        //moveTime+=1
        moveTime+=gDeltaTime //60fps change: counts 30fps ticks
        //if moveTime=1
        if scrCountPass(moveTime,1) //60fps change: once, when the count reaches it
          xVel=moveSpeed
        //if moveTime=8
        if scrCountPass(moveTime,8) //60fps change: once, when the count reaches it
          xVel=0
      }

      //if timeTillWalk=380
      if timeTillWalk>=380 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
      {
        timeTillWalk=0
        armFrame=0
        image_index=armFrame
        xVel=0
        bWalking=false
      }
    }

    //****************************** ARM WAVE ATTACK ******************************
    if armWaveTime<armWaveWait
      //armWaveTime+=1
      armWaveTime+=gDeltaTime //60fps change: counts 30fps ticks
    if armWaveTime>=armWaveWait and currentAttack!=1 and currentAttack!=3
    {
      //armWaveTime+=1
      armWaveTime+=gDeltaTime //60fps change: counts 30fps ticks
      currentAttack=2
      //if armWaveTime=armWaveWait+1
      if scrCountPass(armWaveTime,armWaveWait+1) //60fps change: once, when the count reaches it
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.image_xscale=image_xscale
        afterImage.sprite_index=sprite_index
        afterImage.image_index=image_index
        afterImage.imageFade=0.04
        afterImage.xScalingSet=-0.004
        afterImage.yScalingSet=0.025
      }

      if armWaveTime<=armWaveWait+27 //rotate arm up
        //armAngle-=5
        armAngle-=5*gDeltaTime //60fps change: per 30fps tick
      //else if armWaveTime>=armWaveWait+41 and armWaveTime<=armWaveWait+49 //rotate arm back down
      else if armWaveTime>armWaveWait+40 and armWaveTime<=armWaveWait+49 //rotate arm back down //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        //armAngle+=15
        armAngle+=15*gDeltaTime //60fps change: per 30fps tick
      else if armWaveTime>=armWaveWait+50 //end attack
      {
        armAngle=90
        armWaveTime=0
        currentAttack=0
      }

      //if armWaveTime=armWaveWait+43 //wave attack
      if scrCountPass(armWaveTime,armWaveWait+43) //wave attack //60fps change: once, when the count reaches it
      {
        waveAttack=instance_create(x-armX-16,y-armY,oMMeShot1)
        waveAttack.damageType="SPIRIT"
        waveAttack.spiritPower=spiritPower
        waveAttack.elementType=2
        waveAttack.sprite_index=sNeoGuardianWave
        waveAttack.image_xscale=-1
        waveAttack.bulletSpeed=10
        //waveAttack.direction=180
        waveAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
    }

    //****************************** SPIKE RAIN ATTACK ******************************
    if currentAttack!=3
      //spikeRainTime+=1
      spikeRainTime+=gDeltaTime //60fps change: counts 30fps ticks
    if spikeRainTime>=spikeRainWait
    {
      var xSpikeSpawn;
      xSpikeSpawn=288
      for(i=0;i<22;i+=1)
      {
        spikeDrop=instance_create(xSpikeSpawn,96,oMRustySpike)
        effect_create_above(ef_ring,xSpikeSpawn+8,104,0,c_purple)
        xSpikeSpawn+=16
      }
      spikeRainTime=0
    }

    //****************************** WAVE SPAM ATTACK ******************************
    if waveSpamTime<waveSpamWait
      //waveSpamTime+=1
      waveSpamTime+=gDeltaTime //60fps change: counts 30fps ticks
    if waveSpamTime>=waveSpamWait and currentAttack!=1 and currentAttack!=2
    {
      //waveSpamTime+=1
      waveSpamTime+=gDeltaTime //60fps change: counts 30fps ticks
      currentAttack=3
      if waveSpamTime<=waveSpamWait+36 //rotate arm up
        //armAngle-=5
        armAngle-=5*gDeltaTime //60fps change: per 30fps tick
      //else if waveSpamTime>=waveSpamWait+161 and waveSpamTime<=waveSpamWait+172 //rotate arm back down
      else if waveSpamTime>waveSpamWait+160 and waveSpamTime<=waveSpamWait+172 //rotate arm back down //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        //armAngle+=15
        armAngle+=15*gDeltaTime //60fps change: per 30fps tick
      else if waveSpamTime>=waveSpamWait+173 //end attack
      {
        armAngle=90
        waveSpamTime=0
        currentAttack=0
      }

      //if waveSpamTime>=waveSpamWait+50 and waveSpamTime<=waveSpamWait+150 and waveSpamTime mod waveSpamFreq=0 //wave spam attack
      if waveSpamTime>=waveSpamWait+50 and waveSpamTime<=waveSpamWait+150 and scrModPass(waveSpamTime,waveSpamFreq) //wave spam attack //60fps change: once each time the count reaches a multiple of it
      {
        var xSpamWave,ySpamWave,spamAngle;
        xSpamWave=waveSpamXspawn+random(24)
        ySpamWave=waveSpamYspawn+random(64)
        if oPlayer1.x>xCenter
          spamAngle=240+random(30)
        else
          spamAngle=215+random(20)
        waveAttack=instance_create(xSpamWave,ySpamWave,oMMeShot1)
        waveAttack.damageType="SPIRIT"
        waveAttack.spiritPower=spiritPower
        waveAttack.size=2
        waveAttack.elementType=2
        waveAttack.sprite_index=sNeoGuardianWave
        waveAttack.bulletSpeed=10
        //waveAttack.direction=spamAngle
        waveAttack._direction=spamAngle //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        waveAttack.image_angle=spamAngle
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      armWaveWait-=4
      groundWaveLengthMod+=0.1
      spikeRainWait-=5
      waveSpamWait-=10
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      armWaveWait-=4
      groundWaveLengthMod+=0.1*global.difficulty
      spikeRainWait-=5
      waveSpamWait-=10
      waveSpamFreq-=1
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      armWaveWait-=global.difficulty*2
      groundWaveLengthMod+=0.1
      spikeRainWait-=5
      waveSpamWait-=10
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      armWaveWait-=global.difficulty
      groundWaveLengthMod+=0.1
      spikeRainWait-=global.difficulty*2
      waveSpamWait-=5
      waveSpamFreq-=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      ePlatFollow=instance_create(352,96,oPlatformFollower)
      ePlatFollow.bClock=1
      if global.difficulty>=2
      {
        ePlatFollow=instance_create(560,304,oPlatformFollower)
        ePlatFollow.bClock=1
      }
      if global.difficulty>=3
      {
        ePlatFollow=instance_create(624,96,oPlatformFollower)
        ePlatFollow.bClock=1
      }
      if global.difficulty>=4
      {
        ePlatFollow=instance_create(288,304,oPlatformFollower)
        ePlatFollow.bClock=1
      }
      armWaveWait-=global.difficulty*2
      groundWaveLengthMod+=0.1
      spikeRainWait-=global.difficulty*2
      waveSpamWait-=5
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      armWaveWait-=global.difficulty
      groundWaveLengthMod+=0.1
      spikeRainWait-=global.difficulty*2
      waveSpamWait-=global.difficulty*3
      waveSpamFreq-=1
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      if global.difficulty>2
        waveSpamFreq-=1
      armWaveWait-=global.difficulty*2
      groundWaveLengthMod+=0.1*global.difficulty
      spikeRainWait-=4
      waveSpamWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      armWaveWait-=global.difficulty*2
      groundWaveLengthMod+=0.1
      spikeRainWait-=global.difficulty*2
      waveSpamWait-=10
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      armWaveWait-=global.difficulty
      groundWaveLengthMod+=0.1
      spikeRainWait-=global.difficulty*2
      waveSpamWait-=global.difficulty*3
      bossProgress+=1
    }
  }
  //yVel+=0.3
  yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionBottom(1)
    yVel=0
  //if isCollisionLeft(1)
  //  xVel*=-1
  //if isCollisionRight(1)
  //  xVel*=-1
  //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
  if isCollisionLeftEdit(1)
    xVel*=-1
  if isCollisionRightEdit(1)
    xVel*=-1
  if isCollisionSolid()
    y-=2

  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.elementType=1 and currentElement=1
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.elementType=2 and currentElement=2
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.elementType=3 and currentElement=3
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.elementType=4 and currentElement=4
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
#define Collision_oTechClose
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.TECH_MENTAL_INSURRECTION
  {
    inflictStatus(0)
  }
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if armWaveTime<armWaveWait
    armWaveTime-=round((stunnedTime/2))
  if waveSpamTime<waveSpamWait
    waveSpamTime-=round((stunnedTime/3))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bWalking=true
  {
    //frameCount+=1
    frameCount+=gDeltaTime //60fps change: counts 30fps ticks
    //if frameCount=20
    if frameCount>=20 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
    {
      frameProg+=1
      if frameProg=1
        armFrame=1
      else if frameProg=2
        armFrame=2
      else if frameProg=3
        armFrame=1
      else if frameProg=4
      {
        armFrame=0
        frameProg=0
      }
      frameCount=0
    }
  }

  if armFrame=0
  {
    armX=8
    armY=111
  }
  if armFrame=1
  {
    armX=10
    armY=114
  }
  if armFrame=2
  {
    armX=10
    armY=111
  }

  //arm angle after image
  //if armAnglePrev!=armAngle
  if armAnglePrev!=armAngle and gDeltaDoTicks //60fps change: the arm afterimage once per 30fps tick (the arm moves every frame)
  {
    armMoveEffect=instance_create(x-armX,y-armY,oEnemyAfterImage)
    armMoveEffect.image_alpha=0.8
    armMoveEffect.image_xscale=image_xscale
    armMoveEffect.imageFade=0.15
    armMoveEffect.image_angle=armAngle
    armAnglePrev=armAngle
  }

  //ground lightning
  if image_index!=armFrame
  {
    playSound(global.snd_Clang,0,0.95)
    image_index=armFrame
    moveTime=0
    if armFrame=0 or armFrame=2
    {
      var dir;
      dir=0
      for(i=0;i<2;i+=1)
      {
        groundAttack=instance_create(x-16,y-16,oMMeShot1)
        groundAttack.damageType="SPIRIT"
        groundAttack.spiritPower=spiritPower
        groundAttack.elementType=3
        groundAttack.sprite_index=sZapTrap
        groundAttack.image_xscale=groundWaveLengthMod
        groundAttack.bulletSpeed=7
        //groundAttack.direction=dir
        groundAttack._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        dir=180
      }
    }
  }
}
event_inherited()
draw_sprite_ext(sNeoGuardianArm,armFrame,x-armX,y-armY,image_xscale,1,armAngle,image_blend,image_alpha)
