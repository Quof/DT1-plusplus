#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="B2 Spirit Plane"
maxLife=1000
life=maxLife
expWorth=1750
physicalPower=270
physicalDefense=200
spiritPower=310
spiritDefense=200
FIREresist=-50
WINDresist=90
EARTHresist=25
baseItemChance=75
moneyWorth=130
detectDistX=320
detectDistY=320
initDir=0
if global.difficulty=1
{
  runAcc=6.9
  bombWait=20
}
else if global.difficulty=2
{
  runAcc=6.7
  bombWait=15
}
else if global.difficulty=3
{
  runAcc=6.5
  bombWait=12
}
else if global.difficulty=4
{
  runAcc=6.3
  bombWait=10
}
bombTime=bombWait-2
difficultyAdjustments(global.difficulty)
combatText="The only thing it does is fly-by-bombing. Quite a nuisance and they keep coming too. I wouldn't recommend trying to bring them down."
sideText="These things are extremely out of place. You know though... I wish I had a whole butt load of these like The Darkness does. Why do the bad guys always get all the awesome stuff?"
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
    //movement
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
    //x+=xVel
    x+=xVel*gDeltaTime //60fps change: per 30fps tick
    //shoot
    //bombTime+=1
    bombTime+=gDeltaTime //60fps change: counts 30fps ticks
    if bombTime>=bombWait
    {
      newAttack=instance_create(x,y+8,oB2Bomb)
      newAttack.damageType="SPIRIT"
      newAttack.spiritPower=spiritPower
      //60fps change: _direction instead of GM's direction (oB2Bomb)
      if image_xscale=1
      {
        //newAttack.direction=350
        newAttack._direction=350
        newAttack.image_angle=350
      }
      else
      {
        //newAttack.direction=190
        newAttack._direction=190
        newAttack.image_angle=190
      }
      newAttack.bulletSpeed=4
      bombTime=0
    }

    if findTargetX>inactiveDist/1.5
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
