#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-18,7,-1)
image_speed=0.3

//Enemy base statistics
eName="Goomba"
maxLife=230
life=maxLife
expWorth=40
physicalPower=110
physicalDefense=20
spiritDefense=25
WATERresist=50
WINDresist=-15
EARTHresist=-30
baseItemChance=50
initDir=0
if global.difficulty=1
  runAcc=0.75
else if global.difficulty=2
  runAcc=1
else if global.difficulty=3
  runAcc=1.25
else if global.difficulty=4
  runAcc=1.6
difficultyAdjustments(global.difficulty)
combatText="It's a Goomba...yes, an actual Goomba. Because you don't have the boots that Mario does, you will not be able to jump on them without hurting yourself. It's okay though because you can still just kick their asses your way. They just walk in one direction and keep going."
sideText="I can't believe we're seeing a real Goomba here. But you know...it's actually kinda disappointing now that I'm looking at one for real. I mean seriously, they're cannonfodder. There's not really much to go into on them since you probably know everything about them anyway."
cripplePointText=">Full Swing"
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
{
  inflictStatus(0)
}
