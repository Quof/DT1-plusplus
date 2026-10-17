#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
changeDir=1.2
changeDirTime=10
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
  if type=0
    //direction+=changeDir
    _direction+=changeDir*gDeltaTime //60fps change: turns per 30fps tick; _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
  else if type=1
    //direction-=changeDir
    _direction-=changeDir*gDeltaTime //60fps change: see above
  //changeDirTime+=1
  changeDirTime+=gDeltaTime //60fps change: counts 30fps ticks
  if changeDirTime>=60
  {
    changeDir*=-1
    changeDirTime=0
  }
}
//image_angle=direction
image_angle=_direction //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction (this frame's share of a 30fps tick) after this Step's turn, as GM's built-in motion did
