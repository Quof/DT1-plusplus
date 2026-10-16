#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.difficulty=1
{
  bulletCreateDelay=35
  bullet_speed=3.75
}
else if global.difficulty=2
{
  bulletCreateDelay=30
  bullet_speed=4
}
else if global.difficulty=3
{
  bulletCreateDelay=25
  bullet_speed=4.25
}
else if global.difficulty=4
{
  bulletCreateDelay=20
  bullet_speed=4.5
}
bulletCreateTime=0
arcStop=60
bDestroyIfOffScreen=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  arcStop-=1
  if arcStop<=0
    bulletArc=0
  bulletCreateTime+=1
  if bulletCreateTime>=bulletCreateDelay
  {
    var dir;
    dir=direction+90
    for(i=0;i<2;i+=1)
    {
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)
      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_speed
      newBullet.direction=dir
      dir+=180
    }
    bulletCreateTime=0
  }
}
