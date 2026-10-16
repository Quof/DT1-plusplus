#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-14,-3,14,-1)
image_speed=0.2

//Enemy base statistics
eName="Red Dust Snake"
maxLife=100
life=maxLife
expWorth=50
physicalPower=180
physicalDefense=15
spiritDefense=20
FIREresist=40
WATERresist=-40
baseItemChance=25
moneyWorth=5
noMoneyBonus=true
initDir=0
weight=20
if global.difficulty=1
  runAcc=1.5
else if global.difficulty=2
  runAcc=1.8
else if global.difficulty=3
  runAcc=2.1
else if global.difficulty=4
  runAcc=2.4
xVel=runAcc
if x>oPlayer1.x
  xVel*=-1
difficultyAdjustments(global.difficulty)
combatText="Just a snake. They pop out at you in groups though, so be careful. You know, I bet Mental Insurrection could take care of the entire group."
sideText=string("I'm surprised you were even able to click on this thing, it's so small... Oh man, that's what she said.# # >>TRANSMISSION FROM ") +string(string_upper(global.mainCharacters[0])) +string("<<#Har har, you are SO funny. -_-")
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
    if xVel>0
    {
      if xVel>=runAcc
        xVel-=0.01
    }
    else
    {
      if xVel<=-runAcc
        xVel+=0.01
    }
    yVel+=0.3
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
