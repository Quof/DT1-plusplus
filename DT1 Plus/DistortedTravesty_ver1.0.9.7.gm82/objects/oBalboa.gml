#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-23,-56,23,-1)
image_speed=0.3

//Enemy base statistics
eName="Balboa"
maxLife=1300
life=maxLife
expWorth=1280
physicalPower=225
physicalDefense=100
spiritPower=250
spiritDefense=140
damageType="SPIRIT"
elementType=1
FIREresist=50
WATERresist=-65
WINDresist=30
EARTHresist=90
skillResist=5
baseItemChance=85
dropInd=-20
moneyWorth=110
initDir=0
if global.difficulty=1
  runAcc=2.9
else if global.difficulty=2
  runAcc=3.2
else if global.difficulty=3
  runAcc=3.5
else if global.difficulty=4
  runAcc=4.2
difficultyAdjustments(global.difficulty)
combatText="Whoa! Watch out for this thing. It's big and hits hard. It also hits you with the fire element. Although it's easy to dodge, it just rolls in one direction, but at a pretty good pace."
sideText="So all it can do is roll? It must suck to be this thing, I mean really. Your whole existence is just spinning and going in one direction."
cripplePointText=">Thrust Attack#>Downward Strike#>Full Swing"
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionTop(1)
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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
    inflictStatus(0)
}
