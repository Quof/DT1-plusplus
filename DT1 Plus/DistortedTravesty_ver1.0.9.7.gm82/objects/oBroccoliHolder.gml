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
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
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
