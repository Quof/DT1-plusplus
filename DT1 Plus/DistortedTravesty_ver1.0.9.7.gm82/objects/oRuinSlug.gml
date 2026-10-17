#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y-=15
makeActive()
setCollisionBounds(-15,-14,15,-1)
image_speed=0
image_angle=180

//Enemy base statistics
eName="Ruin Slug"
maxLife=420
life=maxLife
expWorth=315
physicalPower=200
physicalDefense=65
spiritDefense=70
FIREresist=-50
WATERresist=15
EARTHresist=50
baseItemChance=70
moneyWorth=45
initDir=0
if global.difficulty=1
  runAcc=1.9
else if global.difficulty=2
  runAcc=2.1
else if global.difficulty=3
  runAcc=2.3
else if global.difficulty=4
  runAcc=2.6
detectDistX=144
detectDistY=304
difficultyAdjustments(global.difficulty)
combatText="Just sticks to the ceiling and will try to fall on you when you get close. Really, that's all they do, well then they'll crawl at you... and quite fast for a slug."
sideText="Wow these are nasty looking. I'm guessing they eat survive off of everything in here. Since they hang on the ceiling and only come down when you come running along, I assume they eat flesh."
cripplePointText=">Downward Strike"
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
      y+=16
      image_angle=0
      initDir=1
    }
    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      yVel=0
      if initDir=1
      {
        image_speed=0.15
        xVel=runAcc
        if x>oPlayer1.x
          xVel*=-1
        initDir=2
      }
    }
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
{
  inflictStatus(0)
}
