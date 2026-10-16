#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-22,7,-1)
image_speed=0.2

//Enemy base statistics
eName="Red Paratroopa"
maxLife=370
life=maxLife
expWorth=120
physicalPower=140
physicalDefense=42
spiritDefense=45
FIREresist=70
WATERresist=-60
WINDresist=-15
EARTHresist=-30
skillResist=5
baseItemChance=50
dropInd=-20
moneyWorth=5
dirChange=0
weight=100
if global.difficulty=1
  runAcc=1.3
else if global.difficulty=2
  runAcc=1.5
else if global.difficulty=3
  runAcc=1.7
else if global.difficulty=4
  runAcc=2
xVel=runAcc
difficultyAdjustments(global.difficulty)
combatText="These are a little more sensible than the Green Paratroopas. At least they know to stay hovering. They really don't do much though, they have decent defense and have a crazy resistance to Fire."
sideText="You know, I already had comments about the green ones, I just don't care enough to give any extra thought about these too and relate any other info to the situation. Instead I'm going to rant about always having to give a side comment on top of giving combat info, which is probably overlooked anyway."
cripplePointText=">Wind Fused Upward Strike"
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
    dirChange+=1
    if dirChange>=60
    {
      if xVel>0
        xVel-=runAcc/30
      else
        xVel+=runAcc/30
      if dirChange>=87
      {
        if xVel>0
          xVel=-runAcc
        else
          xVel=runAcc
        dirChange=0
      }
    }
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1

    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=2
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=3
{
  inflictStatus(0)
}
