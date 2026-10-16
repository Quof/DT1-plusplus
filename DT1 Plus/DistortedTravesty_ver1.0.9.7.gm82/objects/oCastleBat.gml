#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.1

//Enemy base statistics
eName="Castle Bat"
maxLife=100
life=maxLife
expWorth=750
physicalPower=460
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=30
moneyWorth=110
if global.difficulty=1
  runAcc=2.8
else if global.difficulty=2
  runAcc=3
else if global.difficulty=3
  runAcc=3.2
else if global.difficulty=4
  runAcc=3.5
runAcc+=random(0.5)
bobTime=0
flyProg=0
dropTime=0
initDir=false
difficultyAdjustments(global.difficulty)
detectDistX=192
inactiveDist*=2
combatText="It will dive down and when it senses you, it will fly toward you. Pretty simple stuff, it has a wave like flying motion like the Vampire Bats."
sideText="These bats don't seem nearly as deadly as they were in Castlevania Adventure. But that whip was not nearly as versatile as your arsenal."
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
    if flyProg=0
    {
      y+=6
      if point_distance(0,y,0,oPlayer1.y)<36
      {
        sprite_index=sCastleBatFly
        flyProg=1
      }
    }
    else if flyProg=1
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
      bobTime+=1
      if bobTime>=1 and bobTime<=20
        y+=0.7
      else if bobTime>=21 and bobTime<=40
      {
        y-=0.7
        if bobTime=40
          bobTime=0
      }
      x+=xVel
      if findTargetX>inactiveDist/2
      {
        if questType>0
          enemyQuest(questType)
        instance_destroy()
      }
    }
  }
  enemyStepEvent()
}
