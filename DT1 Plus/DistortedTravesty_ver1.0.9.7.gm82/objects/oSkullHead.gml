#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.1

//Enemy base statistics
eName="Skull Head"
maxLife=100
life=maxLife
expWorth=300
damageType="SPIRIT"
physicalDefense=100
spiritPower=450
spiritDefense=150
skillResist=100
noMoneyBonus=true
baseItemChance=35
moneyWorth=15
if global.difficulty=1
{
  runAcc=2.9
  bobAmount=3.7
}
else if global.difficulty=2
{
  runAcc=3.1
  bobAmount=4
}
else if global.difficulty=3
{
  runAcc=3.3
  bobAmount=4.3
}
else if global.difficulty=4
{
  runAcc=3.6
  bobAmount=4.6
}
runAcc+=random(0.4)
bobTime=0
difficultyAdjustments(global.difficulty)
if x>oPlayer1.x
  runAcc*=-1
xVel=runAcc
if xVel>0
  image_xscale=1
else
  image_xscale=-1
inactiveDist*=2
combatText="It's basically a Medusa Head. No really, it's pattern it literally stolen from the Medusa Head code, it's just faster."
sideText="This is not the pattern they had from the original source. It seems The Darkness took some liberties with them. I'm guessing that this place being caught in Distortion means that it was useless to The Darkness."
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

    bobTime+=1
    if bobTime>=1 and bobTime<=20
      y+=bobAmount
    else if bobTime>=28 and bobTime<=47
      y-=bobAmount
    else if bobTime>=55
      bobTime=0
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
