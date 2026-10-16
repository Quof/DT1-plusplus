#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=1500
maxLife=700
life=maxLife
pointItemAmt=2
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=110
  bullet_Speed=3
  bulletFreq=8
  sprayLength=45
}
else if global.difficulty=2
{
  bullet_Delay=90
  bullet_Speed=3.25
  bulletFreq=6
  sprayLength=50
}
else if global.difficulty=3
{
  bullet_Delay=80
  bullet_Speed=3.5
  bulletFreq=5
  sprayLength=55
}
else if global.difficulty=4
{
  bullet_Delay=65
  bullet_Speed=4.5
  bulletFreq=3
  sprayLength=60
}
bullet_Time=bullet_Delay-30
bulletPattern=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //---------- move pattern ----------
  if patProg=0
  {
    moveInTime-=1
    if moveInTime>0
      speed=moveSpeed
    else
    {
      speed=0
      reverseTime-=1
      if reverseTime<=0
      {
        bDestroyIfOffScreen=1
        direction=moveOutDir
        moveSpeed/=2
        patProg=1
      }
    }
  }
  else if patProg=1
    speed=moveSpeed

  //---------- bullet pattern ----------
  bullet_Time+=1
  if bullet_Time>=bullet_Delay
  {
    if bullet_Time mod bulletFreq=0
    {
      dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)
      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_Speed
      newBullet.direction=dir
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  speed=0
