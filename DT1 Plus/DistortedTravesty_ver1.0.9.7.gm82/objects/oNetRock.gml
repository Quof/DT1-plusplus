#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-7,7,7)
image_alpha=0

//Enemy base statistics
damageType="SPIRIT"
elementType=4
throwSpeed=2
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if image_alpha<1
  {
    //y-=4
    y-=4*gDeltaTime //60fps change: per 30fps tick
    //image_alpha+=0.05
    image_alpha+=0.05*gDeltaTime //60fps change: per 30fps tick
  }
  else
  {
    //throwDelay-=1
    throwDelay-=gDeltaTime //60fps change: counts 30fps ticks
    //if throwDelay=0
    if scrCountPassDown(throwDelay,0) //60fps change: once, when the count reaches 0
    {
      playSound(global.snd_RockThrow,0,1)
      //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22) //60fps change: _direction stands in for direction (see correctSpeedDirection)
      bCanDealDamage=true
    }
  }

  if throwDelay<=0
  {
    if throwSpeed<10
      //throwSpeed+=0.5
      throwSpeed=min(10,scrGravAcc(throwSpeed,0.5,1)) //60fps change: speeds up per 30fps tick, following the 30fps path (the same at 30fps)
    //speed=throwSpeed
    _speed=throwSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  }

  if throwDelay<=0
  {
    if isCollisionTop(1)
      instance_destroy()
    if isCollisionBottom(1)
      instance_destroy()
    if isCollisionLeft(1)
      instance_destroy()
    if isCollisionRight(1)
      instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
