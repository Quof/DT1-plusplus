#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=5500
maxLife=7500
life=maxLife
pointItemAmt=7
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=110
  bullet_Speed=1.5
  changeRate=6
  arcAmt=13
  sprayLength=140
}
else if global.difficulty=2
{
  bullet_Delay=100
  bullet_Speed=2
  changeRate=5
  arcAmt=11
  sprayLength=160
}
else if global.difficulty=3
{
  bullet_Delay=90
  bullet_Speed=2.5
  changeRate=4
  arcAmt=9
  sprayLength=170
}
else if global.difficulty=4
{
  bullet_Delay=80
  bullet_Speed=3
  changeRate=2
  arcAmt=6
  sprayLength=190
}
bullet_Time=bullet_Delay-45
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
    {
      dir1=270 //point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      dir2=270
    }
    if bullet_Time mod changeRate=0
    {
      for(i=0;i<8;i+=1)
      {
        newBullet=instance_create(x,y,oEnemyShipBulletDiamond)
        newBullet.sprite_index=sEbulletLong
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=bullet_Speed+i
        newBullet.direction=dir1

        if dir2!=90 or dir2!=270
        {
          newBullet=instance_create(x,y,oEnemyShipBulletDiamond)
          newBullet.sprite_index=sEbulletLong
          newBullet.bDestroyIfOffScreen=true
          newBullet.bulletSpeed=bullet_Speed+i
          newBullet.direction=dir2
        }
      }
      dir1+=arcAmt
      dir2-=arcAmt
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  speed=0
