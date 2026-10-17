#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)

//Enemy base statistics
damageType="SPIRIT"
if global.difficulty=1
  throwSpeed=4
else if global.difficulty=2
  throwSpeed=5
else if global.difficulty=3
  throwSpeed=6
else if global.difficulty=4
  throwSpeed=7
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    if type=0
      decayTime=30+(throwDelay*3)
    else if type=1
    {
      bCanDealDamage=true
      decayTime=90
    }
    init=1
  }
  if type=0
  {
    //throwDelay-=1
    throwDelay-=gDeltaTime //60fps change: counts 30fps ticks
    //if throwDelay=0
    if scrCountPassDown(throwDelay,0) //60fps change: once, when the count reaches 0
    {
      //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22) //60fps change: _direction stands in for direction (see correctSpeedDirection)
      bCanDealDamage=true
    }
  }

  if throwDelay<=0
  {
    if throwSpeed<12
      //throwSpeed+=0.25
      throwSpeed=min(12,scrGravAcc(throwSpeed,0.25,1)) //60fps change: speeds up per 30fps tick, following the 30fps path (the same at 30fps)
    //speed=throwSpeed
    _speed=throwSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  }

  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
