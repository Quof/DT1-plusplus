#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.4

//Enemy base statistics
eName="Freaked Out Fish"
maxLife=600
life=maxLife
expWorth=680
physicalPower=200
physicalDefense=70
spiritPower=230
spiritDefense=95
damageType="SPIRIT"
elementType=3
FIREresist=-10
WATERresist=90
WINDresist=-20
baseItemChance=65
dropInd=-10
moneyWorth=75
initDir=0
if global.difficulty=1
{
  runAcc=1
  reShootTime=90
  multiShotMax=2
  turnAroundTimeMax=80
}
else if global.difficulty=2
{
  runAcc=1.2
  reShootTime=75
  multiShotMax=3
  turnAroundTimeMax=65
}
else if global.difficulty=3
{
  runAcc=1.4
  reShootTime=60
  multiShotMax=4
  turnAroundTimeMax=50
}
else if global.difficulty=4
{
  runAcc=1.6
  reShootTime=45
  multiShotMax=5
  turnAroundTimeMax=35
}
shootTime=reShootTime-25
multiShot=multiShotMax
turnAroundTime=0
difficultyAdjustments(global.difficulty)
combatText="So what this does is frantically flap it's wing/fin thing and try to find you while shooting two streams of bullets at you. Can be a problem, but eh, you can handle it."
sideText="Fish that fly... Well that's not all that weird considering the ridiculousness of our situation."
cripplePointText=">Wind Burst"
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
    x+=xVel
    //turn delay around if player is behind it
    if image_xscale=1 and x>oPlayer1.x //right
      turnAroundTime+=1
    else if image_xscale=-1 and x<oPlayer1.x //left
      turnAroundTime+=1
    else if (image_xscale=1 and x<oPlayer1.x) or (image_xscale=-1 and x>oPlayer1.x)
      turnAroundTime=0
    if turnAroundTime>=turnAroundTimeMax
    {
      turnAroundTime=0
      image_xscale*=-1
      xVel*=-1
      shootTime=0
      multiShot=multiShotMax
    }
    //shoot
    shootTime+=1
    if shootTime>=reShootTime
    {
      if multiShot>0 and shootTime mod 3=0
      {
        var x1;
        if image_xscale=1
          x1=-11
        else
          x1=11
        newAttack=instance_create(x+x1,y-10,oCannonBullet)
        newAttack.physicalPower=physicalPower
        if image_xscale=1
        {
          newAttack.direction=340
          newAttack.image_angle=340
        }
        else
        {
          newAttack.direction=200
          newAttack.image_angle=200
        }
        newAttack.bulletSpeed=8
        newAttack=instance_create(x+x1,y-10,oCannonBullet)
        newAttack.physicalPower=physicalPower
        if image_xscale=1
        {
          newAttack.direction=310
          newAttack.image_angle=310
        }
        else
        {
          newAttack.direction=230
          newAttack.image_angle=230
        }
        newAttack.bulletSpeed=8
        multiShot-=1
        if multiShot=0
        {
          shootTime=0
          multiShot=multiShotMax
        }
      }
    }
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="WIND BURST"
{
  inflictStatus(0)
}
