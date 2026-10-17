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
      dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
    //if bullet_Time mod bulletDensity=0
    if scrModPass(bullet_Time,bulletDensity) //60fps change: once each time the count reaches a multiple of it
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
        //newBullet.direction=dir
        newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
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
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
