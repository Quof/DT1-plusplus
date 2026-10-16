#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
bCanMove=true
followBall=0
activateBoss=0
maxSpd=3
spawnSecondBall=900
maxBalls=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=98
    followBall=instance_create(704,224,oBreakoutBall)
    followBall.direction=135
    followBall.bulletSpeed=4.5
    followBall.spawnNewBallTime=500
    activateBoss=2
  }
  if bCanMove=true
  {
    if instance_exists(followBall)
    {
      if x>=followBall.x and x>632 //go left
        xVel=-maxSpd
      else if x<=followBall.x and x<776 //go right
        xVel=maxSpd

      //stop from going past borders
      if x<632
      {
        x=632
        xVel=0
      }
      else if x>776
      {
        x=776
        xVel=0
      }
    }
    else //Fight over
    {
      xVel=-maxSpd
    }

    //spawn second ball
    spawnSecondBall-=1
    if spawnSecondBall=0 and instance_number(oBreakoutBall)<maxBalls
    {
      followBall2=instance_create(704,168,oBreakoutBall)
      followBall2.direction=135
      followBall2.bulletSpeed=3.5
      followBall2.image_blend=c_gray
    }
  }
}
