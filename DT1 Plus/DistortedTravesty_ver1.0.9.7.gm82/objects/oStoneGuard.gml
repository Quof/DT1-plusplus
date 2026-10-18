#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-9,-24,9,-1)
image_speed=0
frameCount=0
frameProg=0

//Enemy base statistics
eName="Stone Guard"
maxLife=1300
life=maxLife
expWorth=2650
physicalPower=440
physicalDefense=200
spiritPower=430
spiritDefense=230
WATERresist=-50
WINDresist=75
EARTHresist=100
skillResist=5
baseItemChance=75
dropInd=-10
moneyWorth=160
if global.difficulty=1
{
  runAcc=2.5
  reShootTime=50
  moveFreq=32
}
else if global.difficulty=2
{
  runAcc=2.75
  reShootTime=45
  moveFreq=30
}
else if global.difficulty=3
{
  runAcc=3.25
  reShootTime=40
  moveFreq=25
}
else if global.difficulty=4
{
  runAcc=3.5
  reShootTime=35
  moveFreq=20
}
shootTime=10
extraPower=0
curFrame=0
moveTime=0
difficultyAdjustments(global.difficulty)
combatText="Here's an interesting guard. They've got crazy wind and earth resistance, but water cripples them badly. Its behavior is simple. It takes a few steps, and when it stops, it's going to fire a missile in front of itself and up. Careful about that missile fired upward."
sideText="This is an Armos sprite from one of the Zelda games, it may actually be a custom sprite..."
cripplePointText=">Water Blast"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if shootTime<reShootTime and moveTime=0
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }

    //shoot
    if sprite_index=sStoneGuardFire
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime>=reShootTime+115
    {
      var x1;
      if image_xscale=1
        x1=9
      else
        x1=-9
      effect=instance_create(x+x1,y-16,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.image_xscale=0.35
      effect.image_yscale=0.35
      effect.newBlend=1
      effect.followID=id
      effect.xFollow=x1
      effect.yFollow=-16

      newAttack=instance_create(x+x1,y-16,oCannonBullet)
      newAttack.physicalPower=physicalPower
      newAttack.sprite_index=sGTmissile
      newAttack.bulletSpeed=9
      if image_xscale=-1
        //newAttack.direction=180
        newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newAttack.image_xscale=1.5
      newAttack.image_yscale=1.5

      newAttack=instance_create(x+x1,y-16,oCannonBullet)
      newAttack.physicalPower=physicalPower
      newAttack.sprite_index=sGTmissile
      newAttack.bulletSpeed=9
      //newAttack.direction=90
      newAttack._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newAttack.image_xscale=1.5
      newAttack.image_yscale=1.5
      sprite_index=sStoneGuardWalk
      shootTime=0
    }

    //movement
    if sprite_index=sStoneGuardWalk and image_index!=curFrame
    {
      //moveTime+=1
      //shootTime+=1
      moveTime+=gDeltaTime //60fps change: counts 30fps ticks
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if moveTime=1
      if scrCountPass(moveTime,1) //60fps change: once, when the count reaches it
      {
        xVel=runAcc
        if x>oCharacter.x
          xVel*=-1
      }
      if moveTime>=8
      {
        playSound(global.snd_Clang,0,0.9)
        curFrame=image_index
        moveTime=0
        shootTime+=4
        xVel=0
      }
      if shootTime>=reShootTime
      {
        sprite_index=sStoneGuardFire
        shootTime=reShootTime+100
        curFrame=image_index
        moveTime=0
        xVel=0
      }
    }
    //animation
    if sprite_index=sStoneGuardWalk
    {
      //frameCount+=1
      frameCount+=gDeltaTime //60fps change: counts 30fps ticks
      //if frameCount mod moveFreq=0
      if scrModPass(frameCount,moveFreq) //60fps change: once each time the count reaches a multiple of it
      {
        frameProg+=1
        if frameProg=1
          image_index=1
        else if frameProg=2
          image_index=0
        else if frameProg=3
          image_index=2
        else if frameProg=4
        {
          image_index=0
          frameProg=0
        }
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
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2

    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="WATER BLAST"
{
  inflictStatus(0)
}
