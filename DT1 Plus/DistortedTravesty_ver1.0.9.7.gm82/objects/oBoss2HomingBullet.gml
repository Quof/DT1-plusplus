#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
bDestroyIfOffScreen=1
bulProg=0
straightTime=10
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
  if bulProg=0 //move to position
  {
    //straightTime-=1
    straightTime-=gDeltaTime //60fps change: counts 30fps ticks
    //if straightTime=0
    if scrCountPassDown(straightTime,0) //60fps change: once, when the count reaches 0
    {
      bulletSpeed=0
      bulProg+=1
    }
  }
  else if bulProg=1 //stopped wait time
  {
    //stopTime-=1
    stopTime-=gDeltaTime //60fps change: counts 30fps ticks
    //if stopTime=0
    if scrCountPassDown(stopTime,0) //60fps change: once, when the count reaches 0
    {
      //direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      _direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y) //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
      //direction+=random_range(-3,3)
      _direction+=random_range(-3,3) //60fps change: see above
      bulletSpeed=7
      bulProg+=1
    }
  }
}
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction (this frame's share of a 30fps tick) after this Step's aim, as GM's built-in motion did
