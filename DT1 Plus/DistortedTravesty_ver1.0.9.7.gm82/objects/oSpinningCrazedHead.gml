#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-9,-21,9,-1)
image_speed=0.3

//Enemy base statistics
eName="Spinning Crazed Head"
maxLife=410
life=maxLife
expWorth=300
physicalPower=200
physicalDefense=50
spiritDefense=45
WATERresist=-70
WINDresist=80
EARTHresist=35
baseItemChance=70
moneyWorth=40
runAcc=0.12
if global.difficulty=1
  topSpeed=2.7
else if global.difficulty=2
  topSpeed=3.2
else if global.difficulty=3
  topSpeed=3.7
else if global.difficulty=4
  topSpeed=4.6
difficultyAdjustments(global.difficulty)
combatText="Whoa, talk about SCARY!! These things just spin right round... okay, I won't go any further with that joke. My tip for fighting against it's speed is to go around it and hit it till it dies before it can gain enough momentum to turn around and get you."
sideText="You spin me right round, baby#Right round like a record, baby#Right round, round, round#You spin me right round, baby#Right round like a record, baby#Right round, round, round#Okay I lied."
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
    if x>oCharacter.x
    {
      if xVel>-topSpeed
        xVel-=runAcc
    }
    else
    {
      if xVel<topSpeed
        xVel+=runAcc
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    moveTo(xVel,yVel)
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
