#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-13,7,-1)
image_speed=0

//Enemy base statistics
eName="Fighter Fly"
maxLife=100
life=maxLife
expWorth=700
physicalPower=420
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=120
jumpTime=0
canJump=0
weight=100
if global.difficulty=1
{
  runAcc=2.75
  reJumpTime=40
}
else if global.difficulty=2
{
  runAcc=3
  reJumpTime=30
}
else if global.difficulty=3
{
  runAcc=3.25
  reJumpTime=25
}
else if global.difficulty=4
{
  runAcc=3.5
  reJumpTime=20
}
difficultyAdjustments(global.difficulty)
combatText="It hops, that's all it does."
sideText="These also appeared in the original Mario Bros. They were quite a problem since they could hop. Mario had to time his jumps right in order to flip it over. Even the POW Block wouldn't hurt it while it was in the air."
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
  if x>oPlayer1.x
    image_xscale=-1
  else
    image_xscale=1
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if jumpTime>=reJumpTime
    {
      if canJump=0
      {
        if x>oCharacter.x
          xVel=-runAcc
        else
          xVel=runAcc
        image_index=1
        canJump=1
        y-=4.5
        yVel=-4.5
      }
      else if canJump=1 and yVel>0
        canJump=2
      else if canJump=2 and yVel=0
      {
        canJump=0
        //jumpTime=0
        //60fps change: counts 30fps ticks; the landing frame counts as a whole tick, as at 30fps (it doesn't count up),
        //so the count starts that far back (0 at 30fps)
        jumpTime=gDeltaTime-1
      }
    }
    else
      //jumpTime+=1
      jumpTime+=gDeltaTime //60fps change: see above

    if xVel>8
      xVel=8
    else if xVel<-8
      xVel=-8
    if xVel>0
      //xVel-=0.01
      xVel-=0.01*gDeltaTime //60fps change: per 30fps tick
    else if xVel<0
      //xVel+=0.01
      xVel+=0.01*gDeltaTime //60fps change: per 30fps tick

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      image_index=0
      xVel=0
      yVel=0
    }
    if isCollisionTop(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only bounce off a wall when moving into it (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
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
