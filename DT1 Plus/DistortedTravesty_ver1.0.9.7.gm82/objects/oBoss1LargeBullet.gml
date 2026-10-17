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
csdLater=true //60fps change (added): the parent's Step leaves the move to the end of this one (below)
event_inherited()
if global.gamePaused=false
{
  //arcStop-=1
  arcStop-=gDeltaTime //60fps change: counts 30fps ticks
  if arcStop<=0
    bulletArc=0
  //bulletCreateTime+=1
  bulletCreateTime+=gDeltaTime //60fps change: counts 30fps ticks
  if bulletCreateTime>=bulletCreateDelay
  {
    var dir;
    //dir=direction+90
    dir=_direction+90 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
    for(i=0;i<2;i+=1)
    {
      newBullet=instance_create(x,y,oEnemyShipBulletNormal)
      newBullet.bDestroyIfOffScreen=true
      newBullet.bulletSpeed=bullet_speed
      //newBullet.direction=dir
      newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      dir+=180
    }
    bulletCreateTime=0
  }
}
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction (this frame's share of a 30fps tick) after this Step, which spawns from where it was before the move, as GM's built-in motion did
