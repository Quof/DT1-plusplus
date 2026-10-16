#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=4000
maxLife=5000
life=maxLife
pointItemAmt=6
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=58
  bullet_Speed=2.75
  bulletDensity=6
  sprayLength=45
}
else if global.difficulty=2
{
  bullet_Delay=51
  bullet_Speed=3
  bulletDensity=5
  sprayLength=50
}
else if global.difficulty=3
{
  bullet_Delay=39
  bullet_Speed=3.5
  bulletDensity=4
  sprayLength=55
}
else if global.difficulty=4
{
  bullet_Delay=21
  bullet_Speed=4.25
  bulletDensity=3
  sprayLength=60
}
bullet_Time=0
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
    if bullet_Time=bullet_Delay
      dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
    if bullet_Time mod bulletDensity=0
    {
      dir-=30
      for(i=0;i<2;i+=1)
      {
        var xSpawn,ySpawn;
        xSpawn=x+lengthdir_x(16,dir)
        ySpawn=y+lengthdir_y(16,dir)
        newBullet=instance_create(xSpawn,ySpawn,oEnemyShipBulletLongArc)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=bullet_Speed
        newBullet.direction=dir
        newBullet.type=i
        dir+=60
      }
      dir-=90
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  speed=0
