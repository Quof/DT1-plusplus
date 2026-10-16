#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.15

//Enemy base statistics
eName="Parasol"
maxLife=40
life=maxLife
expWorth=40
physicalPower=150
physicalDefense=10
spiritDefense=10
noMoneyBonus=true
baseItemChance=15
dropInd=-5
if global.difficulty=1
  runAcc=0.2
else if global.difficulty=2
  runAcc=0.3
else if global.difficulty=3
  runAcc=0.4
else if global.difficulty=4
  runAcc=0.65
runAcc+=random(0.4)
difficultyAdjustments(global.difficulty)
colorChangeTime=0
inactiveDist=detectDistX*2
combatText="Come on man, why do you want me to scan an umbrella? All it does is fall at a very slow speed. Yeah they hurt when they hit you, but they're like free killing spree material."
sideText="I always liked when enemies would fly down on an umbrella. Not sure why, it just looked awesome... What, you want more of a side comment? It's an umbrella, what more can I say?"
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
    y+=runAcc
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
