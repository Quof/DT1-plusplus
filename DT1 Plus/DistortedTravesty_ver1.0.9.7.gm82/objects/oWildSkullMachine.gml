#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-80,-60,80,60)

//Enemy base statistics
eName="Wild Skull Machine"
maxLife=42000
life=maxLife
expWorth=72000
physicalPower=300
physicalDefense=100
spiritDefense=150
bIsBoss=true
barAmount=3
questType=1
activateBoss=0
attackTime=0
attackType=0
hitSound=global.snd_MMeHit
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  bulletSpreadDelay=320
  bulletCircleDelay=340
  bulletLineDelay=430
  moveDelay=480
  bulletDropDelay=35
}
else if global.difficulty=2
{
  bulletSpreadDelay=280
  bulletCircleDelay=310
  bulletLineDelay=400
  moveDelay=450
  bulletDropDelay=30
}
else if global.difficulty=3
{
  bulletSpreadDelay=250
  bulletCircleDelay=280
  bulletLineDelay=370
  moveDelay=430
  bulletDropDelay=25
}
else if global.difficulty=4
{
  bulletSpreadDelay=210
  bulletCircleDelay=250
  bulletLineDelay=340
  moveDelay=400
  bulletDropDelay=20
}

bulletSpreadTime=bulletSpreadDelay-20
bulletCircleTime=bulletCircleDelay-100
bulletLineTime=bulletLineDelay-180
bulletLineDir=0
moveTime=100
currentSide="RIGHT"
moveProgress=0
bulletDropTime=0

bossProgress=0
difficultyAdjustments(global.difficulty)

xCenter=336
yGround=320
roomSpan=96
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
    combatText="This thing has 4 attacks that you need to be aware of if you're going to properly dodge it. The first is that 3-set of bullets, when they are sent out, they come back in and spread from there. You will have to dodge through 3 streams. The other is a slower circle, just dash through it. The next is a very thick spiral of bullets, you will either have to dash through or use use Blast Shield. The next is when it moves. It will drop bullets down. That's really it. This thing isn't really all that hard from what I'm scanning. It'll put your dodging skills to the test though."
    sideText="Just one of Wily's machines. It seems to have been redone with danmaku like abilities. I don't really have anything to say about it except it's programming is extremely simple."
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    //******************** MOVEMENT ********************
    //moveTime+=1
    moveTime+=gDeltaTime //60fps change: counts 30fps ticks
    if moveTime>=moveDelay
    {
      //bulletDropTime+=1
      bulletDropTime+=gDeltaTime //60fps change: counts 30fps ticks
      if bulletDropTime>=bulletDropDelay
      {
        newBullet=instance_create(x,y,oMMeShot1)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=7
        //newBullet.direction=270
        newBullet._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        bulletDropTime=0
      }

      //moveProgress+=1
      moveProgress+=gDeltaTime //60fps change: counts 30fps ticks
      //if moveProgress>=1 and moveProgress<=48
      if moveProgress>0 and moveProgress<=48 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        //y-=2
        y-=2*gDeltaTime //60fps change: per 30fps tick
      //else if moveProgress>=49 and moveProgress<=145
      else if moveProgress>48 and moveProgress<=145 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        if currentSide="LEFT"
          //x+=2
          x+=2*gDeltaTime //60fps change: per 30fps tick
        else if currentSide="RIGHT"
          //x-=2
          x-=2*gDeltaTime //60fps change: per 30fps tick
        //if moveProgress=145
        if scrCountPass(moveProgress,145) //60fps change: once, when the count reaches it
        {
          if currentSide="LEFT"
          {
            image_xscale=-1
            currentSide="RIGHT"
          }
          else if currentSide="RIGHT"
          {
            image_xscale=1
            currentSide="LEFT"
          }
        }
      }
      //else if moveProgress>=146 and moveProgress<194
      else if moveProgress>145 and moveProgress<=193 //60fps change: the same 30fps ticks, counted in gDeltaTime steps (<=193 is <194 in whole ticks)
        //y+=2
        y+=2*gDeltaTime //60fps change: per 30fps tick
      else if moveProgress>=195
      {
        bulletDropTime=0
        moveProgress=0
        moveTime=0
      }
    }

    //******************** BULLET SPREAD ********************
    //bulletSpreadTime+=1
    bulletSpreadTime+=gDeltaTime //60fps change: counts 30fps ticks
    if bulletSpreadTime>=bulletSpreadDelay
    {
      var dir,xOffset,yOffset;
      dir=point_direction(x,y,oPlayer1.x,oPlayer1.y)
      xOffset=14
      xOffset*=image_xscale
      yOffset=-16
      for(i=0;i<12;i+=1)
      {
        newBullet=instance_create(x+xOffset,y+yOffset,oMMeShotArc)
        newBullet.physicalPower=physicalPower
        newBullet.bDestroyOnOutside=1
        newBullet.bulletSpeed=5
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=78
        newBullet.bulletArc=5
        newBullet.image_blend=make_color_rgb(100,100,255)

        newBullet=instance_create(x+xOffset,y+yOffset,oMMeShotArc)
        newBullet.physicalPower=physicalPower
        newBullet.bDestroyOnOutside=1
        newBullet.bulletSpeed=7.5
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=57
        newBullet.bulletArc=7.5
        newBullet.image_blend=make_color_rgb(255,255,100)

        newBullet=instance_create(x+xOffset,y+yOffset,oMMeShotArc)
        newBullet.physicalPower=physicalPower
        newBullet.bDestroyOnOutside=1
        newBullet.bulletSpeed=10
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=36
        newBullet.bulletArc=10
        newBullet.image_blend=make_color_rgb(255,100,100)
        dir+=30
      }
      bulletSpreadTime=0
    }
    //******************** BULLET CIRCLE ********************
    //bulletCircleTime+=1
    bulletCircleTime+=gDeltaTime //60fps change: counts 30fps ticks
    if bulletCircleTime>=bulletCircleDelay
    {
      var dir,xOffset,yOffset;
      dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
      xOffset=3
      xOffset*=image_xscale
      yOffset=-50
      for(i=0;i<30;i+=1)
      {
        newBullet=instance_create(x+xOffset,y+yOffset,oMMeShot1)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=2.5
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        dir+=12
      }
      bulletCircleTime=0
    }
    //******************** BULLET LINE ********************
    //bulletLineTime+=1
    bulletLineTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if bulletLineTime>=bulletLineDelay
    if bulletLineTime>=bulletLineDelay and scrModPass(bulletLineTime,1) //60fps change: a bullet once per 30fps tick (each time the count reaches a whole number; every tick at 30fps)
    {
      var dir,xOffset,yOffset;
      dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
      xOffset=3
      xOffset*=image_xscale
      yOffset=-50
      newBullet=instance_create(x+xOffset,y+yOffset,oMMeShot1)
      newBullet.physicalPower=physicalPower
      newBullet.bulletSpeed=4
      //newBullet.direction=bulletLineDir
      newBullet._direction=bulletLineDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      bulletLineDir+=2
      if bulletLineDir>=360
      {
        bulletLineDir=0
        bulletLineTime=0
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      bulletSpreadDelay-=10
      bulletCircleDelay-=10
      bulletLineDelay-=10
      moveDelay-=10
      bulletDropDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      bulletSpreadDelay-=5
      bulletCircleDelay-=10
      bulletLineDelay-=10
      moveDelay-=5
      bulletDropDelay-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      bulletSpreadDelay-=5
      bulletCircleDelay-=10
      bulletLineDelay-=global.difficulty*10
      moveDelay-=5
      bulletDropDelay-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      bulletSpreadDelay-=global.difficulty*10
      bulletCircleDelay-=10
      bulletLineDelay-=10
      moveDelay-=5
      bulletDropDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      bulletSpreadDelay-=10
      bulletCircleDelay-=5
      bulletLineDelay-=global.difficulty*10
      moveDelay-=global.difficulty*5
      bulletDropDelay-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      bulletSpreadDelay-=10
      bulletCircleDelay-=5
      bulletLineDelay-=5
      moveDelay-=global.difficulty*5
      bulletDropDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      bulletSpreadDelay-=global.difficulty*10
      bulletCircleDelay-=5
      bulletLineDelay-=global.difficulty*5
      moveDelay-=global.difficulty*5
      bulletDropDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      bulletSpreadDelay-=10
      bulletCircleDelay-=global.difficulty*5
      bulletLineDelay-=global.difficulty*5
      moveDelay-=5
      bulletDropDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      bulletSpreadDelay-=global.difficulty*10
      bulletCircleDelay-=5
      bulletLineDelay-=10
      moveDelay-=5
      bulletDropDelay-=1
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
