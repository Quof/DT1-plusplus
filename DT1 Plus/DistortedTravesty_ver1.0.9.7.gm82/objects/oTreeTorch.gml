#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-17,-42,17,-1)
image_speed=0.15

//Enemy base statistics
eName="Tree Torch"
maxLife=700
life=maxLife
expWorth=1150
physicalPower=200
physicalDefense=90
spiritPower=245
spiritDefense=180
FIREresist=90
WATERresist=-75
WINDresist=-25
EARTHresist=25
baseItemChance=80
dropInd=-15
moneyWorth=130
if global.difficulty=1
{
  runAcc=1.2
  reShootTime=70
  fireFrequency=7
}
else if global.difficulty=2
{
  runAcc=1.4
  reShootTime=60
  fireFrequency=6
}
else if global.difficulty=3
{
  runAcc=1.6
  reShootTime=50
  fireFrequency=5
}
else if global.difficulty=4
{
  runAcc=1.8
  reShootTime=40
  fireFrequency=4
}
shootTime=20
difficultyAdjustments(global.difficulty)
combatText="This thing isn't too tough, but when you can't reach it right away, it can be a pest. When you see it charge up and lean back, it is getting ready to fire a large volley of fireballs. It doesn't have much control of them, so it just spits them everywhere, which actually makes it worse for you."
sideText="So this thing is a tree on fire?#I'm having trouble comprehending how this is possible, but okay..."
cripplePointText=">Water Blast"
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
    if shootTime<reShootTime-15
    {
      if x>oCharacter.x
      {
        image_xscale=-1
        xVel=-runAcc
      }
      else
      {
        image_xscale=1
        xVel=runAcc
      }
    }

    shootTime+=1
    if shootTime>=reShootTime-15 and shootTime<reShootTime
    {
      xVel=0
      sprite_index=sTreeTorchReady
    }

    if shootTime>=reShootTime and shootTime mod fireFrequency=0
    {
      sprite_index=sTreeTorchFire
      if image_xscale=1
        offsetShotX=4
      else
        offsetShotX=-4
      newAttack=instance_create(x+offsetShotX,y-18,oCannonBullet)
      newAttack.spiritPower=spiritPower
      newAttack.damageType="SPIRIT"
      newAttack.elementType=1
      newAttack.sprite_index=sTTfire
      newAttack.bulletSpeed=6
      if image_xscale=1
        newAttack.direction=random(20)+350
      else
        newAttack.direction=random(20)+170
    }
    if shootTime>=reShootTime+30
    {
      sprite_index=sTreeTorchWalk
      shootTime=0
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=2

    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
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
if damageTime=flashTime and dieFade=0 and other.currentSpell="WATER BLAST"
{
  inflictStatus(0)
}
