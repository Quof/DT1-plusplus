#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-18,-58,18,-1)
image_speed=0

//Enemy base statistics
eName="Wheeling Knight"
maxLife=660
life=maxLife
expWorth=320
physicalPower=160
physicalDefense=100
spiritDefense=100
WINDresist=100
EARTHresist=-80
skillResist=5
baseItemChance=65
dropInd=-20
moneyWorth=20
detectDistY=144
if global.difficulty=1
  runAcc=2.5
else if global.difficulty=2
  runAcc=2.75
else if global.difficulty=3
  runAcc=3
else if global.difficulty=4
  runAcc=3.45
difficultyAdjustments(global.difficulty)
turnTime=0
init=0
combatText="These are kinda fast. They can only move one direction, but at a decent speed. If you get behind them, they will eventually turn themselves around."
sideText="I can't help but laugh when I see these. They give me quiet a few giggles. I mean seriously, just look at it."
cripplePointText=">Any Earth Fused Physical Attack"
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
    if init=0
    {
      image_speed=0.33
      if x>oCharacter.x
        xVel=-runAcc
      else
        xVel=runAcc
      init=1
    }

    //60fps change: counts 30fps ticks
    if x>oCharacter.x and image_xscale=1
      //turnTime+=1
      turnTime+=gDeltaTime
    else if x<oCharacter.x and image_xscale=-1
      //turnTime+=1
      turnTime+=gDeltaTime
    if turnTime>=25
    {
      xVel*=-1
      turnTime=0
    }

    if xVel>=0
      image_xscale=1
    else
      image_xscale=-1
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
    {
      xVel=runAcc
      turnTime=0
    }
    if isCollisionRight(1)
    {
      xVel=-runAcc
      turnTime=0
    }
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
      y-=2

    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.elementType=4
{
  inflictStatus(0)
}
