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

    //imageRevTime+=1
    imageRevTime+=gDeltaTime //60fps change: counts 30fps ticks
    if imageRevTime>=6
    {
      image_xscale*=-1
      imageRevTime=0
    }
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
