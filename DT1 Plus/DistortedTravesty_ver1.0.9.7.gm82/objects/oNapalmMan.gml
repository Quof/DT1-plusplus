#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-12,-29,12,-1)
image_speed=0
//Enemy base statistics
eName="Napalm Man"
maxLife=5500
life=maxLife
expWorth=7500
physicalPower=320
physicalDefense=100
spiritDefense=100
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
attackProgress=0
attackType=0
shootTime=0
difficultyAdjustments(global.difficulty)
combatText="His actions are almost the same as they were in the original source. His choice on whether to fire the missiles or the bombs depends on your proximity to him. His energy has been boosted a bit though and bombs will randomly drop from the ceiling. I guess to balance out the fact that you are more mobile than Mega Man. His power is pretty high, so don't get hit.#First Appearance: Mega Man 5"
sideText="Model Number: DWN-039#Created by Dr. Wily to protect his secret weapons factory. He is a weapons enthusiast loyal to Wily. Because he is a walking weapon, even his allies fell uncomfortable near him, so he doesn't have many friends. Wow, that's sad, luckily it's just a robot with no real emotions."
cripplePointText=">None"
yGround=336
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and dieFade=0
  {
    if attackProgress=0 //choose attack type
    {
      xDist=point_distance(x,0,oPlayer1.x,0)
      if xDist>192
      {
        sprite_index=sNapalmManShootStraight
        attackType=0
      }
      else
      {
        sprite_index=sNapalmManShootDiagonal
        attackType=1
      }
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
      attackProgress+=1
    }
    else if attackProgress=1 //missiles
    {
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      if attackType=0
      {
        //if shootTime mod 15=0
        if scrModPass(shootTime,15) //60fps change: once each time the count reaches a multiple of it
        {
          newAttack=instance_create(x,y-24,oMMeShot1)
          newAttack.sprite_index=sNapalmMissile
          newAttack.physicalPower=physicalPower
          newAttack.bulletSpeed=8
          if image_xscale=1
          {
            //newAttack.direction=0
            newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.x+=6
          }
          else
          {
            //newAttack.direction=180
            newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.x-=6
          }
          newAttack.image_angle=direction
        }
        if shootTime>=50
        {
          sprite_index=sNapalmManIdle
          shootTime=0
          attackProgress+=1
        }
      }
      else if attackType=1 //bombs
      {
        //if shootTime=15
        if scrCountPass(shootTime,15) //60fps change: once, when the count reaches it
        {
          newAttack=instance_create(x,y-26,oGASGrenade)
          newAttack.sprite_index=sNapalmBomb
          newAttack.physicalPower=physicalPower
          if image_xscale=1
          {
            newAttack.xVel=2.75+random(0.25)
            newAttack.x+=3
          }
          else
          {
            newAttack.xVel=-2.75-random(0.25)
            newAttack.x-=3
          }
          newAttack.yVel=-6

          newAttack=instance_create(x,y-26,oGASGrenade)
          newAttack.sprite_index=sNapalmBomb
          newAttack.physicalPower=physicalPower
          if image_xscale=1
          {
            newAttack.xVel=3+random(0.5)
            newAttack.x+=14
          }
          else
          {
            newAttack.xVel=-3-random(0.5)
            newAttack.x-=14
          }
          newAttack.yVel=-5
        }
        if shootTime>=20
        {
          sprite_index=sNapalmManIdle
          shootTime=0
          attackProgress+=1
        }
      }
    }
    else if attackProgress=2 //wait time
    {
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      if attackType=0 and shootTime>=5
      {
        shootTime=0
        attackProgress+=1
      }
      else if attackType=1 and shootTime>=20
      {
        shootTime=0
        attackProgress+=1
      }
    }
    else if attackProgress=3 //jump
    {
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if shootTime=1
      if scrCountPass(shootTime,1) //60fps change: once, when the count reaches it
      {
        sprite_index=sNapalmManJump
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1

        y-=4
        yVel=-7
        if image_xscale=1
          xVel=5
        else
          xVel=-5
      }
    }
    else if attackProgress=4 //slight wait time
    {
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      if shootTime>=10
      {
        shootTime=0
        attackProgress=0
      }
    }

    //yVel+=0.4
    yVel=scrGravAcc(yVel,0.4,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      yVel=0
      if attackProgress=3 and shootTime>=10
      {
        xVel=0
        sprite_index=sNapalmManIdle
        shootTime=0
        attackProgress=4
      }
    }
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
  }
  enemyStepEvent()
}
