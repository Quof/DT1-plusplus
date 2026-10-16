#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-11,-20,11,-1)
image_speed=0.33

//Enemy base statistics
eName="Red Eyed Spike Top"
maxLife=900
life=maxLife
expWorth=1000
physicalPower=220
physicalDefense=140
spiritPower=210
spiritDefense=170
FIREresist=15
WINDresist=65
EARTHresist=-50
skillResist=10
baseItemChance=80
moneyWorth=95
runAcc=0.125
if global.difficulty=1
  topSpeed=3.1
else if global.difficulty=2
  topSpeed=3.4
else if global.difficulty=3
  topSpeed=3.7
else if global.difficulty=4
  topSpeed=4.9
difficultyAdjustments(global.difficulty)
combatText="Another enemy that spins to gain momentum. Like the others, I suggest going around it so it has to first slow down to get you. I also suggest crippling these since their defenses are very high."
sideText="I swear, like half the things here spin around. What's the deal with that? And what's up with them having these constant eerie smiles? I guess you're not creeped out by it, but I am."
cripplePointText=">Downward Strike#>Full Swing"
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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
    inflictStatus(0)
}
