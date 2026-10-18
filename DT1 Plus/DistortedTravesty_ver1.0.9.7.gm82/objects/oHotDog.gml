#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-30,-48,30,-1)

//Enemy base statistics
eName="Hot Dog"
maxLife=1820
life=maxLife
expWorth=2000
physicalPower=310
physicalDefense=100
spiritPower=290
spiritDefense=100
baseItemChance=75
dropInd=-10
moneyWorth=140
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  reShootTime=55
  flameAmt=5
}
else if global.difficulty=2
{
  reShootTime=45
  flameAmt=6
}
else if global.difficulty=3
{
  reShootTime=35
  flameAmt=8
}
else if global.difficulty=4
{
  reShootTime=30
  flameAmt=10
}
flameCount=0
shootTime=5
difficultyAdjustments(global.difficulty)
combatText="A giant blue dog that spits fire in a wave like pattern. It doesn't do anything except that.#First Appearance: Mega Man 2"
sideText="I always liked these bigger mini-boss like enemies in the Mega Man games. They were pretty easy, but it was always awesome to bring one down. Though I do wish they would drop health pickups more often."
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
  if shootTime<reShootTime-15 and shootTime>5
    image_index=0
  else
    image_index=1
  //flameAmt
  if bActive=true and dieFade=0
  {
    if shootTime<reShootTime-15 and shootTime>10
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime>=reShootTime
    {
      var dirOffset;
      if image_xscale=1
        dirOffset=32
      else
        dirOffset=-32
      //if shootTime mod 2=0
      if scrModPass(shootTime,2) //60fps change: once each time the count reaches an even number
      {
        newAttack=instance_create(x,y-25,oMMeFlameHead)
        newAttack.spiritPower=spiritPower
        newAttack.bulletSpeed=8
        if image_xscale=1
        {
          //newAttack.direction=315
          newAttack._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newAttack.type=0
        }
        else
        {
          //newAttack.direction=225
          newAttack._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newAttack.image_xscale=-1
          newAttack.type=1
        }
        flameCount+=1
      }
      if flameCount>=flameAmt
      {
        flameCount=0
        shootTime=0
      }
    }

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
