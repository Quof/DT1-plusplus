#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-48,-88,48,-1)
image_xscale=-1.5
image_yscale=1.5
image_speed=0.15

//Enemy base statistics
eName="Dragonroot"
maxLife=13500
life=maxLife
expWorth=22000
physicalPower=230
physicalDefense=110
spiritPower=260
spiritDefense=140
FIREresist=-50
WATERresist=75
EARTHresist=25
bIsBoss=true
barAmount=1
questType=1
activateBoss=0
currentAttack=0
if global.difficulty=1
{
  sporeDelay=360
  sporeFrequency=9
  windRoarDelay=390
  roarDuration=105
  roarStrength=4.3
  strikeRootDelay=490
  seedDelay=550
  seedFrequency=7
}
else if global.difficulty=2
{
  sporeDelay=300
  sporeFrequency=8
  windRoarDelay=350
  roarDuration=120
  roarStrength=4.4
  strikeRootDelay=420
  seedDelay=500
  seedFrequency=6
}
else if global.difficulty=3
{
  sporeDelay=260
  sporeFrequency=8
  windRoarDelay=310
  roarDuration=135
  roarStrength=4.5
  strikeRootDelay=370
  seedDelay=450
  seedFrequency=6
}
else if global.difficulty=4
{
  sporeDelay=230
  sporeFrequency=7
  windRoarDelay=280
  roarDuration=150
  roarStrength=4.7
  strikeRootDelay=340
  seedDelay=420
  seedFrequency=5
}
sporeTime=sporeDelay-120
windRoarTime=0
strikeRootStrike=50
seedToss=30
bossProgress=0
difficultyAdjustments(global.difficulty)
originalPDef=physicalDefense
originalSDef=spiritDefense
cripplePointText=">Fireball while roaring"

xCenter=304
yGround=272
roomSpan=240
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
    combatText="Oh boy, this is a tough one. Let me list the attacks. A spore needle attack, it leaves behind spore dust which is hurtful, it will even poison you. A seed toss, which when they land, they will spawn a root spike from the ground. It can also fire off the root spike in a line. The last is it's roar, it will try to blow you into the wall of spikes behind you. One difference between your ground and air dash is the air dash keeps your momentum. Use it to gain some ground when he roars."
    sideText="This is a massive overgrowth gone wrong. I do sense The Darkness was involved with it's creation though. I kinda want to know what The Darkness used to grow this thing cause I want some for my yard. Those damn kids always running up and down the street early in the morning when I'm trying to sleep... Yep, this would take care of that problem."
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    if sprite_index=sDragonrootIdle
    {
      physicalDefense=originalPDef
      spiritDefense=originalPDef
    }
    else
    {
      physicalDefense=originalPDef*5
      spiritDefense=originalPDef*5
    }
    //60fps change: these count 30fps ticks (each +=1 is +=gDeltaTime)
    if currentAttack=0
    {
      sporeTime+=gDeltaTime
      windRoarTime+=gDeltaTime
      seedToss+=gDeltaTime
    }
    if currentAttack!=3
      strikeRootStrike+=gDeltaTime
    if sporeTime>=sporeDelay and currentAttack!=2 and currentAttack!=3 //spore attack
    {
      if currentAttack=0
      {
        sporeTime=1000
        currentAttack=1
      }
      //sporeTime+=1
      sporeTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if sporeTime mod 8=0
      if scrModPass(sporeTime,8) //60fps change: once each time the count reaches a multiple of it
      {
        sporeAttack=instance_create(x-18,y-48,oDR_SporeNeedle)
        sporeAttack.spiritPower=spiritPower
        sporeAttack.damageType="SPIRIT"
        sporeAttack.elementType=4
        sporeAttack.xVel=-2-random(6)
        sporeAttack.yVel=-4-random(5)
      }
      if sporeTime>=1080
      {
        sporeTime=0
        currentAttack=0
      }
    }
    if seedToss>=seedDelay and windRoarTime<1000 and currentAttack!=1 and currentAttack!=3 //seed toss
    {
      if currentAttack=0
      {
        seedToss=1000
        currentAttack=2
      }
      //seedToss+=1
      seedToss+=gDeltaTime //60fps change: counts 30fps ticks
      //if seedToss=1005
      if scrCountPass(seedToss,1005) //60fps change: once, when the count reaches it
        sprite_index=sDragonrootHeadUp
      //else if seedToss>=1055 and seedToss mod seedFrequency=0
      else if seedToss>=1055 and scrModPass(seedToss,seedFrequency) //60fps change: once each time the count reaches a multiple of it
      {
        seedAttack=instance_create(x,y-80,oDR_Seed)
        seedAttack.spiritPower=spiritPower
        seedAttack.damageType="SPIRIT"
        seedAttack.elementType=4
        seedAttack.xVel=-2-random(4)
        seedAttack.yVel=-4-random(6)
      }
      if seedToss>=1080
      {
        sprite_index=sDragonrootIdle
        seedToss=0
        currentAttack=0
      }
    }

    if strikeRootStrike>=strikeRootDelay and currentAttack!=3 //root strike (line)
    {
      if strikeRootStrike<900
      {
        strikeRootStrike=1000
        xLine=x+64
      }
      //if strikeRootStrike mod 15=0
      if scrModPass(strikeRootStrike,15) //60fps change: once each time the count reaches a multiple of it
      {
        lineRootStrike=instance_create(xLine,yGround,oDR_RootSpike)
        lineRootStrike.spiritPower=spiritPower
        lineRootStrike.damageType="SPIRIT"
        lineRootStrike.elementType=4
        xLine-=64
        if xLine<=128
          strikeRootStrike=0
      }
    }

    if windRoarTime>=windRoarDelay and currentAttack!=2 and currentAttack!=3 //wind roar
    {
      if windRoarTime<900
        windRoarTime=1000
      //if windRoarTime=1001
      if scrCountPass(windRoarTime,1001) //60fps change: once, when the count reaches it
        sprite_index=sDragonrootHeadUp
      //if windRoarTime>=1026
      if windRoarTime>1025 //60fps change: the same 30fps ticks, counted in gDeltaTime steps (it pushes the player)
      {
        //if windRoarTime=1026
        if scrCountPass(windRoarTime,1026) //60fps change: once, when the count reaches it
        {
          sprite_index=sDragonrootRoar
          playSound(global.snd_EnemyRoar1,0,0.9)
          roarAttack=instance_create(0,0,oDR_Roar)
          roarAttack.windDir="LEFT"
        }
        oPlayer1.xVel=-roarStrength
        oPlayer1.xVelSetExt=1 //60fps change (added): the player's speed is set every frame: the 30fps formula for it (see pMoveToWrapNew)
      }
      if windRoarTime>=1027+roarDuration
      {
        sprite_index=sDragonrootIdle
        with roarAttack
          instance_destroy()
        windRoarTime=0
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.71 and bossProgress=0
    {
      sporeDelay-=10
      windRoarDelay-=10
      roarDuration+=5
      roarStrength+=0.1
      strikeRootDelay-=15
      seedDelay-=20
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.51 and bossProgress=1
    {
      sporeDelay-=10
      windRoarDelay-=15
      roarDuration+=5
      strikeRootDelay-=15
      seedDelay-=20
      seedFrequency-=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.31 and bossProgress=2
    {
      if global.difficulty>=3
      {
        sporeDelay-=15
        roarDuration+=10
        roarStrength+=0.1
        strikeRootDelay-=25
        seedDelay-=30
      }
      else
      {
        sporeDelay-=10
        roarDuration+=5
        strikeRootDelay-=15
        seedDelay-=20
      }
      windRoarDelay-=20
      sporeFrequency-=1
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.11 and bossProgress=3
    {
      sporeDelay-=15
      windRoarDelay-=10
      roarDuration+=5
      roarStrength+=0.1
      strikeRootDelay-=25
      seedDelay-=30
      seedFrequency-=1
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=4
    {
      if global.difficulty>=3
      {
        sporeDelay-=15
        sporeFrequency-=1
        windRoarDelay-=20
        roarDuration+=10
        strikeRootDelay-=30
        seedDelay-=30
        seedFrequency-=1
      }
      else
      {
        windRoarDelay-=10
        sporeDelay-=10
        roarDuration+=5
        strikeRootDelay-=20
        seedDelay-=15
      }
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
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if sporeTime<sporeDelay
    sporeTime-=round((stunnedTime/2))
  if strikeRootStrike<strikeRootDelay
    strikeRootStrike-=round((stunnedTime/2))
  if seedToss<seedDelay
    seedToss-=round((stunnedTime/2))
}

if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL" and windRoarTime>1000
{
  inflictStatus(0)
}
