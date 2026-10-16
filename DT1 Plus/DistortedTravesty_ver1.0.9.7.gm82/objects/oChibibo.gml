#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-3,-7,3,-1)
imageRevTime=0

//Enemy base statistics
eName="Chibibo"
maxLife=100
life=maxLife
expWorth=400
physicalPower=400
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=30
moneyWorth=100
initDir=0
if global.difficulty=1
  runAcc=1.5
else if global.difficulty=2
  runAcc=1.7
else if global.difficulty=3
  runAcc=1.9
else if global.difficulty=4
  runAcc=2.2
difficultyAdjustments(global.difficulty)
combatText="It has the same behavior as Goombas, just faster."
sideText="The version of the Goomba in Super Mario Land on the Game Boy. It's kinda cute, too bad it has monochromatic powers and does lots of damage."
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
    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2

    imageRevTime+=1
    if imageRevTime>=6
    {
      image_xscale*=-1
      imageRevTime=0
    }
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
