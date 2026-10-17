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
  //moveInTime-=1
  moveInTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if moveInTime=0
  if moveInTime<=0 //60fps change: <= so it still happens if the frame rate changes mid-count
    bDestroyIfOffScreen=1
  //speed=moveSpeed
  _speed=moveSpeed //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)

  //---------- bullet pattern ----------
  //bullet_Time+=1
  bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
  if bullet_Time>=bullet_Delay
  {
    //if bullet_Time mod bulletFreq=0
    if scrModPass(bullet_Time,bulletFreq) //60fps change: once each time the count reaches a multiple of it
    {
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)

      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_Speed
      //newBullet.direction=270
      newBullet._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
    }
    if bullet_Time>=bullet_Delay+sprayLength
      bullet_Time=0
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
