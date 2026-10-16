#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-12,-28,12,-1)
image_speed=0.5
//Enemy base statistics
eName="Gyro Man"
maxLife=7000
life=maxLife
expWorth=15000
physicalPower=320
physicalDefense=100
spiritDefense=100
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
attackProgress=0
if global.difficulty=1
  gyroSpeed=6.4
else if global.difficulty=2
  gyroSpeed=7
else if global.difficulty=3
  gyroSpeed=7.6
else if global.difficulty=4
  gyroSpeed=8.2
shootTime=0
dropType=0
attackPriority=0 //positive: stand, negative: fly
difficultyAdjustments(global.difficulty)
combatText="His actions are almost the same as they were in the original source. He will fire a Gyro Attack, which is some lame propeller he throws at you. You can see when he throws it at you, just watch him. Another thing he may do is fly up into the clouds where you can't see him and toss a Gyro Attack at you, then drop down. These Gyro Attacks will suddenly shift up or down in your direction when they are below or above you respectively.#First Appearance: Mega Man 5"
sideText="Model Number: DWN-036#A robot created by Dr. Wily that resembles a helicopter. He was originally planned to have a flying device, but it was replaced by a propeller built into his back because of the cost, and Gyro Man preferred this flight mode. In Mega Man 5, Wily ordered him to take over a hanging garden and obtain money from the admission fee, but the attendance dropped as soon as he took over the place, and Gyro Man got bored."
cripplePointText=">None"
xCenter=720
yGround=320
roomSpan=160
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
    if attackProgress=0 and y>yGround-8 //choose attack type
    {
      shootTime-=1
      if dropType=0
      {
        dropType=-1
        shootTime=0
      }
      else if dropType>0
      {
        dropType=-1
        shootTime=10
      }
      sprite_index=sGyroManIdle
      if shootTime=0
      {
        dropType=0
        attackProgress=irandom(100)+attackPriority
        if attackProgress>=50
        {
          attackProgress=10
          attackPriority-=2
        }
        else
        {
          attackProgress=20
          attackPriority+=5
        }

        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }
    }
    else if attackProgress=10 //stay on ground
    {
      shootTime+=1
      if shootTime=10
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
        image_speed=0
        image_index=0
        sprite_index=sGyroManThrow
      }
      else if shootTime=20
      {
        image_index=1
        newAttack=instance_create(x,y-24,oGyroAttack)
        newAttack.physicalPower=physicalPower
        if image_xscale=1
        {
          newAttack.bulletSpeed=gyroSpeed
          newAttack.x+=6
        }
        else
        {
          newAttack.bulletSpeed=-gyroSpeed
          newAttack.x-=6
        }
      }
      else if shootTime=25
      {
        sprite_index=sGyroManIdle
        image_speed=0.5
      }
      if shootTime>=50
        attackProgress=0
    }
    else if attackProgress=20 //fly up
    {
      shootTime+=1
      if shootTime=1
        sprite_index=sGyroManProp
      else if shootTime>=11 and shootTime<=42
      {
        sprite_index=sGyroManJump
        y-=5
      }
      else if shootTime=60
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
        newAttack=instance_create(x,y-24,oGyroAttack)
        newAttack.physicalPower=physicalPower
        if image_xscale=1
        {
          newAttack.bulletSpeed=gyroSpeed
          newAttack.x+=6
        }
        else
        {
          newAttack.bulletSpeed=-gyroSpeed
          newAttack.x-=6
        }
      }
      else if shootTime=85
      {
        dropType=choose(1,2)
        if dropType=1
          x=(xCenter-roomSpan)+irandom(roomSpan*2)
        else
        {
          x=oPlayer1.x
          if x<xCenter-roomSpan
            x=xCenter-roomSpan
          else if x>xCenter+roomSpan
            x=xCenter+roomSpan
        }
        yVel=7.5
        attackProgress=0
      }
    }

    if yVel>0
      yVel+=0.4
    if isCollisionBottom(1)
      yVel=0
    moveTo(xVel,yVel)
  }
  enemyStepEvent()
}
