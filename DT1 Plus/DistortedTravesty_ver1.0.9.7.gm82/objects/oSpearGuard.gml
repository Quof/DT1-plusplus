#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-10,-56,10,-1)
image_speed=0

//Enemy base statistics
eName="Spear Guard"
maxLife=520
life=maxLife
expWorth=210
physicalPower=150
physicalDefense=80
spiritDefense=50
WATERresist=-50
WINDresist=80
EARTHresist=-30
skillResist=5
baseItemChance=55
dropInd=-10
moneyWorth=20
detectDistY=144
if global.difficulty=1
  runAcc=1.25
else if global.difficulty=2
  runAcc=1.5
else if global.difficulty=3
  runAcc=1.75
else if global.difficulty=4
  runAcc=2.1
difficultyAdjustments(global.difficulty)
init=0
combatText="These don't do...anything! Okay they do, but all they do is walk at you. It's a decent speed though, and it's armor is quite good. You'll definitely want to cripple these guys. Not sure why it's a water attack that does it. Maybe it has something to do with making it heavier? Who knows, I've decided that nothing here is logical anymore anyway."
sideText="You're lucky these things don't try to poke at you like they started doing in some of the later games they appeared in. Which by the way, I think these things are just haunted pieces of armor, don't believe it when someone says it's an undead inside, I don't see anything when they fall apart."
cripplePointText=">Water Fused Downward Strike"
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
    if init=0
    {
      image_speed=0.16
      init=1
    }
    if x>oCharacter.x
    {
      image_xscale=-1
      xVel=-runAcc
    }
    else
    {
      image_xscale=1
      xVel=runAcc
    }

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
      y-=2

    if y>room_height+30
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=2
{
  inflictStatus(0)
}
