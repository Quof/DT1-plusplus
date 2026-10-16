#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-13,-10,13,-1)
image_speed=0.2

//Enemy base statistics
eName="Castle Spider"
maxLife=100
life=maxLife
expWorth=800
physicalPower=470
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=130
initDir=0
if global.difficulty=1
  runAcc=5.5
else if global.difficulty=2
  runAcc=5.8
else if global.difficulty=3
  runAcc=6.1
else if global.difficulty=4
  runAcc=6.45
difficultyAdjustments(global.difficulty)
combatText="It works just like a Goomba and anything else with that movement type. Again, it's just faster. Ready, set, reused code. Wait a minute... this is practically the same as a palette swap!! What the hell?!"
sideText="These things are really creepy looking for something that's only black and white and a few pixels. Good design I guess."
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
