#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-10,-30,10,-1)
image_speed=0
//Enemy base statistics
eName="Common Cannon"
maxLife=520
life=maxLife
expWorth=600
physicalPower=260
physicalDefense=100
spiritDefense=100
baseItemChance=65
dropInd=-10
moneyWorth=100
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
  reShootTime=55
else if global.difficulty=2
  reShootTime=45
else if global.difficulty=3
  reShootTime=35
else if global.difficulty=4
  reShootTime=25
shootTime=5
difficultyAdjustments(global.difficulty)
combatText="Stays in one place and fires at set intervals.#First Appearance: Mega Man 6"
sideText="There are various palette swaps of these, but the only one you'll see is what you see here luckily. I hate palette swaps... a lot."
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
  if shootTime<reShootTime-15
    image_index=0
  else
    image_index=1
  if bActive=true and dieFade=0
  {
    if shootTime<reShootTime-15 and shootTime>3
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    if shootTime>=reShootTime
    {
      var dirOffset;
      if image_xscale=1
        dirOffset=0
      else
        dirOffset=180
      newAttack=instance_create(x,y-20,oMMeShot1)
      newAttack.physicalPower=physicalPower
      newAttack.bulletSpeed=5
      newAttack.direction=dirOffset
      shootTime=0
    }
    else
      shootTime+=1

    yVel+=0.3
    if isCollisionBottom(1)
      yVel=0
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
