#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
maxLife=300
life=maxLife
pointItemAmt=1
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=43
  bullet_Speed=2.8
}
else if global.difficulty=2
{
  bullet_Delay=38
  bullet_Speed=3
}
else if global.difficulty=3
{
  bullet_Delay=30
  bullet_Speed=3.2
}
else if global.difficulty=4
{
  bullet_Delay=21
  bullet_Speed=3.5
}
bullet_Time=bullet_Delay-15
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
  speed=moveSpeed
  arcTime-=1
  if arcTime<=0
  {
    bDestroyIfOffScreen=1
    if bArc=1
      direction+=arcChange
  }

  //---------- bullet pattern ----------
  bullet_Time+=1
  if bullet_Time>=bullet_Delay
  {
    var dir;
    dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
    newBullet=instance_create(x,y,oEnemyShipBulletNormal)
    newBullet.bDestroyIfOffScreen=true
    newBullet.bulletSpeed=bullet_Speed
    newBullet.direction=dir
    bullet_Time=0
  }
}
else
  speed=0
