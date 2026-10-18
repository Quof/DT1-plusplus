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
      //newAttack.direction=dirOffset
      newAttack._direction=dirOffset //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that shoots counts as a whole tick, as at 30fps (it doesn't count
      //up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
