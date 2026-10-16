#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.5

//Enemy base statistics
eName="Gira"
maxLife=100
life=maxLife
expWorth=280
physicalPower=460
physicalDefense=100
spiritDefense=150
skillResist=100
noMoneyBonus=true
baseItemChance=20
moneyWorth=30
if global.difficulty=1
  runAcc=7
else if global.difficulty=2
  runAcc=8
else if global.difficulty=3
  runAcc=9
else if global.difficulty=4
  runAcc=10.1
difficultyAdjustments(global.difficulty)
if x>oPlayer1.x
  runAcc*=-1
if runAcc>0
  image_xscale=1
else
  image_xscale=-1
inactiveDist*=2
combatText="Same as the Bullet Bills, but faster."
sideText="Did you know that you could hit these with your fireballs in Super Mario Land? It always felt odd to me that I could do that."
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
    if findTargetX>inactiveDist/2
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }

    x+=runAcc
  }
  enemyStepEvent()
}
