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
    //if bullet_Time mod bulletFreq=0
    if scrModPass(bullet_Time,bulletFreq) //60fps change: once each time the count reaches a multiple of it
    {
      dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)
      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_Speed
      //newBullet.direction=dir
      newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
