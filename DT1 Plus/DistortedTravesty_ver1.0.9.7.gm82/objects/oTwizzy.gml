#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
image_speed=0.1+random(0.1)

//Enemy base statistics
eName="Twizzy"
maxLife=200
life=maxLife
expWorth=120
physicalPower=150
physicalDefense=30
spiritDefense=40
FIREresist=-70
WATERresist=-60
WINDresist=80
EARTHresist=70
noMoneyBonus=true
baseItemChance=20
dropInd=-5
initDir=0
if global.difficulty=1
  runAcc=1.2
else if global.difficulty=2
  runAcc=1.5
else if global.difficulty=3
  runAcc=1.8
else if global.difficulty=4
  runAcc=2.2
runAcc+=random(0.6)
difficultyAdjustments(global.difficulty)
inactiveDist*=2
combatText="All they do is fly in one direction. Most of them stay in the air and out of the way. Though it is fun to roast a few here and there."
sideText="Comments? Why would you want any additional comments on these bird chicken things? I guess I would like to eat one, just for fun, and I bet they are tasty..."
cripplePointText=">Any Fire Fused Physical Attack"
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    x+=xVel
    if findTargetX>inactiveDist/2
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
if damageTime=flashTime and dieFade=0 and other.elementType=1
{
  inflictStatus(0)
}
