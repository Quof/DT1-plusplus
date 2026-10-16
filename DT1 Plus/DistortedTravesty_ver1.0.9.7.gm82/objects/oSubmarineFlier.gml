#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0.33
//Enemy base statistics
eName="Submarine Flier"
maxLife=220
life=maxLife
expWorth=480
physicalPower=280
physicalDefense=100
spiritDefense=100
baseItemChance=65
dropInd=-10
moneyWorth=105
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  flySpeed=1.6
  reShootTime=90
  missileSpeed=1.8
}
else if global.difficulty=2
{
  flySpeed=1.8
  reShootTime=75
  missileSpeed=2.1
}
else if global.difficulty=3
{
  flySpeed=2
  reShootTime=65
  missileSpeed=2.4
}
else if global.difficulty=4
{
  flySpeed=2.2
  reShootTime=55
  missileSpeed=2.7
}
shootTime=20
init=0
difficultyAdjustments(global.difficulty)
combatText="A weird submarine robot that swims in one direction and fires homing torpedos. That's all they do.#First Appearance: Mega Man 6"
sideText="In the original source, it hides in a cloud and once Mega Man is close, it reveals itself and dives into the water and then starts shooting. I think it shot a bit faster though."
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
      if x>oPlayer1.x
      {
        flySpeed*=-1
        image_xscale=-1
      }
      init=1
    }
    x+=flySpeed
    shootTime+=1
    if shootTime>=reShootTime
    {
      newBullet=instance_create(x,y,oSubMissile)
      newBullet.damageType="PHYSICAL"
      newBullet.physicalPower=physicalPower
      newBullet.bulletSpeed=missileSpeed
      shootTime=0
    }
  }
  enemyStepEvent()
}
