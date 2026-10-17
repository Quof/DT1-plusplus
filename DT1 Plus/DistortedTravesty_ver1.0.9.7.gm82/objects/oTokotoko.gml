#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-16,7,-1)
image_speed=0.33

//Enemy base statistics
eName="Tokotoko"
maxLife=100
life=maxLife
expWorth=700
physicalPower=430
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=120
initDir=0
if global.difficulty=1
  runAcc=4.7
else if global.difficulty=2
  runAcc=5
else if global.difficulty=3
  runAcc=5.3
else if global.difficulty=4
  runAcc=5.65
difficultyAdjustments(global.difficulty)
combatText="It has the same behavior as Chibibos, just faster... a lot faster."
sideText="These things always scared me, they seemed to come out of no where and fast. I admit that I got hit more than I should have by them."
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
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if initDir=0
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=1
    }
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (above 30fps it can still touch the wall on the next frame
    //and kept turning around inside it)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2

    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
