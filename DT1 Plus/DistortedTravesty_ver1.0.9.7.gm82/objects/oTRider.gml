#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Train Rider"
maxLife=600
life=maxLife
expWorth=600
physicalPower=240
physicalDefense=105
spiritDefense=100
FIREresist=60
WATERresist=70
WINDresist=-75
EARTHresist=-20
skillResist=5
baseItemChance=75
moneyWorth=60
bCanDealDamage=false
initDir=0
weight=200
if global.difficulty=1
{
  runAcc=2.9
  reShootTime=55
  multiShotMax=6
  turnAroundTimeMax=65
}
else if global.difficulty=2
{
  runAcc=3.2
  reShootTime=40
  multiShotMax=8
  turnAroundTimeMax=50
}
else if global.difficulty=3
{
  runAcc=3.5
  reShootTime=25
  multiShotMax=10
  turnAroundTimeMax=35
}
else if global.difficulty=4
{
  runAcc=3.8
  reShootTime=20
  multiShotMax=12
  turnAroundTimeMax=25
}
shootTime=0
multiShot=multiShotMax
turnAroundTime=0
detectDistX=320
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
effectXscale=1.5
difficultyAdjustments(global.difficulty)
combatText="These guys ride Aeriel Speeder Bikes equip with a minigun. They can only fire downward, but they fire fast and a lot. The best way to beat them is to get around them and hit them from behind.# #That's what she said."
sideText="The Darkness has quite a diverse range of minions. You gotta wonder though, how does it pay them all? They may be trying to take over the world or whatever, but you still gotta pay your henchmen! Oh well, this is why I wouldn't be part of the mass henchmen army, I'd be like a vice-executive or a secretary or something."
cripplePointText=">Wind Fused Full Swing#Wind Fused Upward Strike"
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
        var x1,x2;
        if image_xscale=1
        {
          x1=42
          x2=18
        }
        else
        {
          x1=-42
          x2=-18
        }
        newBulletShell=instance_create(x+x2,y-20,oBulletShell)
        newBulletShell.direction=35+random(70)
        newBulletShell.speed=3+random(2)
        newAttack=instance_create(x+x1,y-8,oCannonBullet)
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
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=3
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=3
    inflictStatus(0)
}
