#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
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
  //stopArc-=1
  stopArc-=gDeltaTime //60fps change: counts 30fps ticks
  //if stopArc>0
  //  direction+=changeDir
  //if stopArc=0
  //60fps change: it turns per 30fps tick, for the same 30fps ticks (>=1 is >0 in whole ticks); _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
  if stopArc>=1
    _direction+=changeDir*gDeltaTime
  if scrCountPassDown(stopArc,0)
  {
    bulletSpeed/=1.5
    if bOffset=1
    {
      //direction-=global.difficulty*4
      _direction-=global.difficulty*4 //60fps change: see above
      //direction+=random(global.difficulty*8)
      _direction+=random(global.difficulty*8) //60fps change: see above
    }
  }
  //image_angle=direction
  image_angle=_direction //60fps change: see above
}
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction (this frame's share of a 30fps tick) after this Step's turn, as GM's built-in motion did
