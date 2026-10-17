#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-8,-17,8,-1)
image_speed=0.15

//Enemy base statistics
eName="Scarfy"
maxLife=400
life=maxLife
expWorth=200
physicalPower=200
physicalDefense=40
spiritDefense=80
WINDresist=40
EARTHresist=-30
skillResist=5
baseItemChance=50
dropInd=-10
moneyWorth=12
jumpTime=0
canJump=0
weight=100
if global.difficulty=1
  reJumpTime=40
else if global.difficulty=2
  reJumpTime=30
else if global.difficulty=3
  reJumpTime=25
else if global.difficulty=4
  reJumpTime=20
difficultyAdjustments(global.difficulty)
combatText="Not really sure what to think of these. They just jump up and down and try to be annoying. They're slightly annoying for Kirby to deal with, but for you they really shouldn't be a problem."
sideText="In their original setting, if Kirby tried to suck them up, they would get really angry. I wonder if there is a way to anger the ones here? Would be humorous if anything. Especially for you since you seem to like pissing off everyone you come across...including me."
cripplePointText=">Earth Fused Upward Strike"
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
        canJump=1
        y-=4
        yVel=-6
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
    //60fps change: per 30fps tick
    if xVel>0
      //xVel-=0.05
      xVel-=0.05*gDeltaTime
    else if xVel<0
      //xVel+=0.05
      xVel+=0.05*gDeltaTime

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionTop(1)
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
    if isCollisionSolid()
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
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=4
{
  inflictStatus(0)
}
