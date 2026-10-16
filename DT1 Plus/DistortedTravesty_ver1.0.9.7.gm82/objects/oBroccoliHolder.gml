#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-12,-27,12,-1)
image_speed=0.18

//Enemy base statistics
eName="Broccoli Holder"
maxLife=590
life=maxLife
expWorth=550
physicalPower=200
physicalDefense=80
spiritPower=180
spiritDefense=100
FIREresist=-70
WATERresist=90
baseItemChance=65
dropInd=-20
moneyWorth=70
initDir=0
if global.difficulty=1
  runAcc=1.65
else if global.difficulty=2
  runAcc=1.9
else if global.difficulty=3
  runAcc=2.15
else if global.difficulty=4
  runAcc=2.5
difficultyAdjustments(global.difficulty)
combatText="Another bad guy that doesn't do anything but walk in one direction. Only difference is it walks faster and hurts more... and is holding broccoli with an overly cute smile on it's face."
sideText="So I hacked a bit to find out why it holds those 2 sticks of Broccoli. Turns out its for the obvious, it just takes a bite when it's hungry. Who woulda thought ya know?"cripplePointText=">Thrust Attack"
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
    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
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
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
{
  inflictStatus(0)
}
