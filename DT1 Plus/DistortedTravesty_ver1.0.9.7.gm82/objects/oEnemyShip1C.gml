#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=1200
maxLife=500
life=maxLife
pointItemAmt=2
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=80
  bullet_Speed=2.25
  bulletFreq=11
  sprayLength=45
}
else if global.difficulty=2
{
  bullet_Delay=70
  bullet_Speed=2.5
  bulletFreq=8
  sprayLength=50
}
else if global.difficulty=3
{
  bullet_Delay=60
  bullet_Speed=2.75
  bulletFreq=6
  sprayLength=55
}
else if global.difficulty=4
{
  bullet_Delay=50
  bullet_Speed=3
  bulletFreq=4
  sprayLength=60
}
bullet_Time=bullet_Delay-20
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
  moveInTime-=1
  if moveInTime=0
    bDestroyIfOffScreen=1
  speed=moveSpeed

  //---------- bullet pattern ----------
  bullet_Time+=1
  if bullet_Time>=bullet_Delay
  {
    if bullet_Time mod bulletFreq=0
    {
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)

      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_Speed
      newBullet.direction=270
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  speed=0
