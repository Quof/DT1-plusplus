#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-5,-14,5,-1)
image_speed=0.2

//Enemy base statistics
eName="Rope"
maxLife=200
life=maxLife
expWorth=1500
physicalPower=470
physicalDefense=100
spiritPower=350
spiritDefense=150
skillResist=50
baseItemChance=40
moneyWorth=130
if global.difficulty=1
  reShootTime=65
else if global.difficulty=2
  reShootTime=55
else if global.difficulty=3
  reShootTime=45
else if global.difficulty=4
  reShootTime=35
shootTime=10
difficultyAdjustments(global.difficulty)
combatText="Stays in one place and hops. Once it reaches the height of it's short hop, it fires off a fireball. In the original game, the red versions of these were really annoying. Some of these even moved around. ugh this game gives me nightmares, but I was still somehow able to complete the entire game without losing all my lives."
sideText="I guess I put some of my personal comments in the combat related area already. Does it really matter anymore? I've crossed the two over so many times."
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
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks (it still lands on reShootTime-10 exactly)
    if shootTime<reShootTime-10 and shootTime>1
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    //if shootTime=reShootTime-10
    if scrCountPass(shootTime,reShootTime-10) //60fps change: once, when the count reaches it (even if a frame rate change moved it off whole ticks)
    {
      y-=4
      yVel=-2.4
    }
    if shootTime>=reShootTime
    {
      if image_xscale=1
        offsetShotX=4
      else
        offsetShotX=-4
      newAttack=instance_create(x+offsetShotX,y-8,oSkullFire)
      newAttack.sprite_index=sRopeFireball
      newAttack.spiritPower=spiritPower
      newAttack.bulletSpeed=7
      if image_xscale=1
        //newAttack.direction=0
        newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      else
        //newAttack.direction=180
        newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      shootTime=0
    }

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+30
      instance_destroy()
  }
  enemyStepEvent()
}
