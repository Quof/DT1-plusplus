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
    //moveInTime-=1
    moveInTime-=gDeltaTime //60fps change: counts 30fps ticks
    //if moveInTime>0
    if moveInTime>=1 //60fps change: the same 30fps ticks (it counts down in gDeltaTime steps; the same as >0 in whole ticks)
      //speed=moveSpeed
      _speed=moveSpeed //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
    else
    {
      //speed=0
      _speed=0 //60fps change: see above
      //reverseTime-=1
      reverseTime-=gDeltaTime //60fps change: counts 30fps ticks
      if reverseTime<=0
      {
        bDestroyIfOffScreen=1
        //direction=moveOutDir
        _direction=moveOutDir //60fps change: see above
        moveSpeed/=2
        patProg=1
      }
    }
  }
  else if patProg=1
    //speed=moveSpeed
    _speed=moveSpeed //60fps change: see above

  //---------- bullet pattern ----------
  //bullet_Time+=1
  bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
  if bullet_Time>=bullet_Delay
  {
    //if bullet_Time=bullet_Delay
    if scrCountPass(bullet_Time,bullet_Delay) //60fps change: once, when the count reaches it
    {
      dir1=270 //point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      dir2=270
    }
    //if bullet_Time mod changeRate=0
    if scrModPass(bullet_Time,changeRate) //60fps change: once each time the count reaches a multiple of it
    {
      for(i=0;i<8;i+=1)
      {
        newBullet=instance_create(x,y,oEnemyShipBulletDiamond)
        newBullet.sprite_index=sEbulletLong
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=bullet_Speed+i
        //newBullet.direction=dir1
        newBullet._direction=dir1 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

        if dir2!=90 or dir2!=270
        {
          newBullet=instance_create(x,y,oEnemyShipBulletDiamond)
          newBullet.sprite_index=sEbulletLong
          newBullet.bDestroyIfOffScreen=true
          newBullet.bulletSpeed=bullet_Speed+i
          //newBullet.direction=dir2
          newBullet._direction=dir2 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
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
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
