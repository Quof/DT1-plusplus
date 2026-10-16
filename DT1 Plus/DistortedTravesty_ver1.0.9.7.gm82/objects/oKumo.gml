#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-13,7,-1)
image_speed=0.15

//Enemy base statistics
eName="Kumo"
maxLife=100
life=maxLife
expWorth=750
physicalPower=430
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=120
jumpTime=0
canJump=0
weight=90
if global.difficulty=1
{
  runAcc=5.25
  reJumpTime=40
}
else if global.difficulty=2
{
  runAcc=5.5
  reJumpTime=30
}
else if global.difficulty=3
{
  runAcc=5.75
  reJumpTime=25
}
else if global.difficulty=4
{
  runAcc=6
  reJumpTime=20
}
difficultyAdjustments(global.difficulty)
combatText="It hops, that's all it does... and it's a spider."
sideText="These were so annoying in Super Mario Land. I wound up jumping into them half the time. They seem to be modified a bit here."
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if x>oPlayer1.x
    image_xscale=-1
  else
    image_xscale=1
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if jumpTime>=reJumpTime
    {
      if canJump=0
      {
        if x>oCharacter.x
          xVel=-runAcc
        else
          xVel=runAcc
        canJump=1
        y-=4
        yVel=-4.25
      }
      else if canJump=1 and yVel>0
        canJump=2
      else if canJump=2 and yVel=0
      {
        canJump=0
        jumpTime=0
      }
    }
    else
      jumpTime+=1

    if xVel>8
      xVel=8
    else if xVel<-8
      xVel=-8
    if xVel>0
      xVel-=0.025
    else if xVel<0
      xVel+=0.025

    yVel+=0.2
    if isCollisionBottom(1)
    {
      xVel=0
      yVel=0
    }
    if isCollisionTop(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
