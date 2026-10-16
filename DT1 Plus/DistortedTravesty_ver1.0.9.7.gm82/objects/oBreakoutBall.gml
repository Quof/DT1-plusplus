#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-2,-2,2,2)
bActive=true

//Enemy base statistics
physicalPower=450
spiritPower=450
bCanTakeDamage=false
bShowHealthBar=false
spawnNewBallTime=-1

difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=bulletSpeed
  spawnNewBallTime-=1
  if spawnNewBallTime=0 and instance_number(oBreakoutBall)<oBreakoutPaddle.maxBalls
  {
    followBallEx=instance_create(random_range(592,816),80,oBreakoutBall)
    followBallEx.direction=135
    followBallEx.bulletSpeed=4.5
    followBallEx.image_blend=c_gray
    spawnNewBallTime=500
  }
}
else
  speed=0
#define Collision_oSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
playSound(global.snd_MenuCursor,0,1)
move_bounce_all(false)
#define Collision_oBreakoutBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
playSound(global.snd_MenuShift,0,0.8)
oEvDistortionW3.breakoutScore+=other.pointValue
oEvDistortionW3.enemyCount-=1
spawnNewBallTime=500
move_bounce_all(false)
with other
{
  if pointValue=1
  {
    newAttack=instance_create(x,y,oBO_Blob)
    newAttack.physicalPower=oBreakoutBall.physicalPower
    newAttack.yVel=random(1)
  }
  else if pointValue=2
  {
    newAttack=instance_create(x,y,oBO_Bomb)
    newAttack.physicalPower=oBreakoutBall.physicalPower
  }
  else if pointValue=3
  {
    newAttack=instance_create(x,y,oLaserB)
    newAttack.spiritPower=oBreakoutBall.spiritPower
    newAttack.damageType="SPIRIT"
    newAttack.direction=270
    newAttack.image_angle=270
    newAttack.bulletSpeed=5
  }
  instance_destroy()
}
