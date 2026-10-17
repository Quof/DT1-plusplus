#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=2500
maxLife=3500
life=maxLife
pointItemAmt=4
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  bullet_Delay=55
  bullet_Speed=2.8
  sprayAmount=4
}
else if global.difficulty=2
{
  bullet_Delay=50
  bullet_Speed=3
  sprayAmount=5
}
else if global.difficulty=3
{
  bullet_Delay=37
  bullet_Speed=3.2
  sprayAmount=6
}
else if global.difficulty=4
{
  bullet_Delay=21
  bullet_Speed=3.5
  sprayAmount=7
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
      if bulletPattern=0
      {
        dir=225
        dir2=dir+90
      }
      else
      {
        dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
        dir2=dir+45
        dir-=45
      }
      bulDelay=20
    }
    //if bullet_Time mod 2=0
    if scrModPass(bullet_Time,2) //60fps change: once each time the count reaches a multiple of it
    {
      var xSpawn,ySpawn;
      xSpawn=x+lengthdir_x(32,dir)
      ySpawn=y+lengthdir_y(32,dir)
      newBullet=instance_create(xSpawn,ySpawn,oEnemyShipBulletNormal)
      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_Speed
      newBullet.moveDelay=bulDelay
      if bulletPattern=0
        //newBullet.direction=270
        newBullet._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      else
        //newBullet.direction=dir2-45
        newBullet._direction=dir2-45 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      dir+=90/sprayAmount
      bulDelay-=2
    }
    if dir>dir2
    {
      if bulletPattern=0
        bulletPattern=1
      else
        bulletPattern=0
      bullet_Time=0
    }
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
