#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Skull Head (Zelda 2)"
maxLife=200
life=maxLife
expWorth=400
physicalPower=480
physicalDefense=100
spiritPower=350
spiritDefense=150
skillResist=50
baseItemChance=30
moneyWorth=130
noMoneyBonus=true
if global.difficulty=1
{
  runAcc=2.7
  bobAmount=3.5
}
else if global.difficulty=2
{
  runAcc=3
  bobAmount=3.8
}
else if global.difficulty=3
{
  runAcc=3.3
  bobAmount=4.1
}
else if global.difficulty=4
{
  runAcc=3.6
  bobAmount=4.5
}
bobTime=irandom(50)
if x>oPlayer1.x
  runAcc*=-1
xVel=runAcc
if xVel>0
  image_xscale=1
else
  image_xscale=-1
difficultyAdjustments(global.difficulty)
combatText="It's the same thing as a Medusa Head except that it constantly arcs."
sideText="Disregard my comments in the Wolf Head enemy about Skull Head not being used because Distortion 3 already has one with that name... Well it does have one, this one just has a 'Zelda 2' tag on it."
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
    else if bobTime>=25 and bobTime<=44
      y-=bobAmount
    else if bobTime>=49
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
