#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-9,-9,9,9)
image_speed=0
//Enemy base statistics
eName="100 Watton"
maxLife=10
life=maxLife
expWorth=500
physicalPower=280
physicalDefense=100
spiritDefense=100
baseItemChance=70
dropInd=-10
moneyWorth=140
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
weight=40
if global.difficulty=1
{
  flySpeed=2.7
  reShootTime=90
}
else if global.difficulty=2
{
  flySpeed=2.5
  reShootTime=70
}
else if global.difficulty=3
{
  flySpeed=2.3
  reShootTime=55
}
else if global.difficulty=4
{
  flySpeed=2.1
  reShootTime=50
}
shootTime=15
frameCount=0
difficultyAdjustments(global.difficulty)
combatText="A flying lightbulb enemy that controls the lights. It flys left and right, ocassionally stopping to fire a downwards bullet spread. If it is killed, the area will plunge into darkness, and a Dompan must be destroyed to bring the lights back on. #First Appearance: Mega Man 4"
sideText="For a trap type enemy, this is ingenious. Wily really knew what he was doing with this, but... well read my logs on the Dompan for the rest of the report."
cripplePointText=">None"
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oWattLight.changeType=1
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
    //60fps change: moves and counts per 30fps tick
    //x-=flySpeed
    //frameCount+=1
    x-=flySpeed*gDeltaTime
    frameCount+=gDeltaTime
    if frameCount=2
      image_index=1
    else if frameCount=4
      image_index=2
    else if frameCount=6
      image_index=1
    //else if frameCount=8
    else if frameCount>=8 //60fps change: (it counts in fractions)
    {
      image_index=0
      frameCount=0
    }
    //shootTime+=1
    shootTime+=gDeltaTime
    if shootTime>=reShootTime
    {
      newBullet=instance_create(x,y,oWattonBomb)
      newBullet.damageType="PHYSICAL"
      newBullet.physicalPower=physicalPower
      newBullet.yVel=-3
      shootTime=0
    }
  }
  enemyStepEvent()
}
