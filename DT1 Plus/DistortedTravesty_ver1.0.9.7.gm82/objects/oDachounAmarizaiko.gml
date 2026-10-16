#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-20,-54,20,-1)
image_speed=0.18
//Enemy base statistics
eName="Dachoun Amarizaiko"
maxLife=1020
life=maxLife
expWorth=900
physicalPower=330
physicalDefense=100
spiritDefense=100
baseItemChance=70
dropInd=-10
moneyWorth=130
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  reShootTime=85
  walkSpeed=2.2
}
else if global.difficulty=2
{
  reShootTime=70
  walkSpeed=2.6
}
else if global.difficulty=3
{
  reShootTime=55
  walkSpeed=3
}
else if global.difficulty=4
{
  reShootTime=45
  walkSpeed=3.3
}
shootTime=25
init=0
difficultyAdjustments(global.difficulty)
combatText="It is a scout walker that will fire at various intervals in 5 directions one after the other. This is different from it's original source. They deal a lot of damage if they walk into you.#First Appearance: Mega Man 6"
sideText="These actually made an appearance in Mega Man 5, but with the Amarizaiko part of the name and fired lasers instead of bullets. Did you know the name 'Dachou' is Japanese for Ostrich?"
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
  if bActive=true and dieFade=0
  {
    if init=0
    {
      if x>oCharacter.x
        walkSpeed*=-1
      init=1
      xVel=walkSpeed
    }
    if xVel>0
      image_xscale=1
    else if xVel<0
      image_xscale=-1

    shootTime+=1
    if shootTime>=reShootTime
    {
      if shootTime<100
      {
        shootTime=200
        if image_xscale=1
        {
          dirOffset=15
          shotStart=20
          changeAmt=-10
        }
        else
        {
          dirOffset=-15
          shotStart=160
          changeAmt=10
        }
      }
      if shootTime mod 6=0
      {
        newAttack=instance_create(x+dirOffset,y-40,oMMeShot1)
        newAttack.physicalPower=physicalPower-round(physicalPower/7)
        newAttack.bulletSpeed=7
        newAttack.direction=shotStart
        shotStart+=changeAmt
      }
      if shootTime>227
        shootTime=0
    }

    yVel+=0.3
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
