#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.33
image_alpha=0.75

//Enemy base statistics
init=0
fireSpeed=6
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if type=1
  {
    if oMetaKnight.image_xscale=1
      offsetX=2
    else
      offsetX=-2
    x=oMetaKnight.x+offsetX
    y=oMetaKnight.y-8
  }
  else if type=2
  {
    if init=0
    {
      if image_xscale=-1
        //direction=180
        _direction=180 //60fps change: _direction stands in for direction (see correctSpeedDirection)
      image_speed=0
      image_index=1
      init=1
    }
    //speed=fireSpeed
    _speed=fireSpeed //60fps change: moved by correctSpeedDirection (end of the step)
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
