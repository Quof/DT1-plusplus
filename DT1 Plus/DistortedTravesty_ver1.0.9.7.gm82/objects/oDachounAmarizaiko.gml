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

    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
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
      //if shootTime mod 6=0
      if scrModPass(shootTime,6) //60fps change: once each time the count reaches a multiple of 6
      {
        newAttack=instance_create(x+dirOffset,y-40,oMMeShot1)
        newAttack.physicalPower=physicalPower-round(physicalPower/7)
        newAttack.bulletSpeed=7
        //newAttack.direction=shotStart
        newAttack._direction=shotStart //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        shotStart+=changeAmt
      }
      //if shootTime>227
      if shootTime>=228 //60fps change: the same as >227 in whole ticks (the 5th shot is at 228)
        shootTime=0
    }

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
