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
eName="Green Paratroopa"
maxLife=350
life=maxLife
expWorth=105
physicalPower=150
physicalDefense=35
spiritDefense=30
FIREresist=-15
WATERresist=70
WINDresist=-60
EARTHresist=-30
skillResist=5
baseItemChance=50
dropInd=-20
moneyWorth=4
initDir=0
weight=100
if global.difficulty=1
  runAcc=1
else if global.difficulty=2
  runAcc=1.2
else if global.difficulty=3
  runAcc=1.4
else if global.difficulty=4
  runAcc=1.7
difficultyAdjustments(global.difficulty)
combatText="All they do is hop in one direction. Their shell gives them decent defense. I'm seeing that they are very resistant to Water based attacks, but very weak to Wind elements."
sideText="You know, I'm starting to think that maybe Mario isn't all that great. I mean these guys can't even put up a half-way decent fight for you. I'm sure the traps are nasty, but still. I wonder how cheap it is to hire these things, or do they just enjoy arbitrarily bouncing around bottomless pit invested fields. Speaking of bottomless pits, the Mushroom Kingdom sure is a dangerous place with all of them laying around."
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    yVel+=0.3
    if isCollisionBottom(1)
      yVel=-6
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1

    if xVel>runAcc
      xVel=runAcc
    if xVel<-runAcc
      xVel=-runAcc
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=2
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=3
{
  inflictStatus(0)
}
