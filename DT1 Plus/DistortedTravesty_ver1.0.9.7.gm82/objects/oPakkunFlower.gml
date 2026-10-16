#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.15
y+=16

//Enemy base statistics
eName="Pakkun Flower"
maxLife=100
life=maxLife
expWorth=450
physicalPower=440
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=100
detectDistX=80
riseTime=0
bCanTakeDamage=false
difficultyAdjustments(global.difficulty)
combatText="Works just like a Piranha Plant. I don't need to explain their behavior. Oh, these will still come up even if you are standing on the pipe."
sideText="These looked okay in the original source, but here they look so silly being so small."
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
    riseTime+=1
    if riseTime>=1 and riseTime<=8
    {
      if riseTime=1
        bCanTakeDamage=true
      y-=2
    }
    else if riseTime>=53 and riseTime<=60
    {
      if riseTime=60
        bCanTakeDamage=false
      y+=2
    }
    else if riseTime>=101
    {
      riseTime=0
      bActive=false
    }
  }
  enemyStepEvent()
}
