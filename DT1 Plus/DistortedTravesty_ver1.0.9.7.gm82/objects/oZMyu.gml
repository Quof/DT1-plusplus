#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-5,-6,5,-1)
image_speed=0

//Enemy base statistics
eName="Myu"
maxLife=100
life=maxLife
expWorth=600
physicalPower=420
physicalDefense=100
spiritPower=350
spiritDefense=150
skillResist=50
baseItemChance=30
moneyWorth=120
if global.difficulty=1
  runAcc=0.8
else if global.difficulty=2
  runAcc=1.1
else if global.difficulty=3
  runAcc=1.4
else if global.difficulty=4
  runAcc=1.8
moveWait=15+irandom(30)
moveTime=0
jumpWait=10+irandom(80)
jumpTime=0
difficultyAdjustments(global.difficulty)
combatText="These are slow moving and sometimes make a short hop. They are a bit more jumpy here than the original. You still won't have as much trouble with these as you would in the original game since you can hit the ground with relative ease."
sideText="These really weren't all that annoying to me. Even before getting the downward stab, I never found them to be much of a nuisance."
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
    //move
    //moveTime+=1
    moveTime+=gDeltaTime //60fps change: counts 30fps ticks
    if moveTime>=moveWait and jumpTime<jumpWait and yVel=0
    {
      image_index=1
      y-=4
      yVel=-0.2
      if x>oCharacter.x
        xVel=-2
      else
        xVel=2
      moveWait=15+irandom(30)
      moveTime=0
    }
    //jump
    //jumpTime+=1
    jumpTime+=gDeltaTime //60fps change: counts 30fps ticks (it still lands on jumpWait exactly)
    if jumpTime=jumpWait and yVel=0
    {
      image_index=1
      y-=4
      yVel=-3
      if x>oCharacter.x
        xVel=-2
      else
        xVel=2
    }

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      image_index=0
      xVel=0
      yVel=0
      if jumpTime>=jumpWait
      {
        jumpWait=60+irandom(100)
        jumpTime=0
      }
    }
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only bounce off a wall when moving into it (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
      y-=1
    if y>room_height+30
      instance_destroy()
  }
  enemyStepEvent()
}
