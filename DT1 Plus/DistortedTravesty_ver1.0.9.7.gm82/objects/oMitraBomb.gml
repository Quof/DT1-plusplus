#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
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
  //waitTime-=1
  waitTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if waitTime=0
  if scrCountPassDown(waitTime,0) //60fps change: once, when the count reaches 0
  {
    bulletSpeed=7
    //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y)
    _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y) //60fps change: _direction stands in for direction (see correctSpeedDirection)
  }
  //else if waitTime>0
  else if waitTime>=1 //60fps change: the same 30fps ticks (the same as >0 in whole ticks)
  {
    if bulletSpeed>0
      //bulletSpeed-=0.2
      bulletSpeed-=0.2*gDeltaTime //60fps change: per 30fps tick
  }
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if waitTime<=-30
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(0.7)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,20,make_color_rgb(255,0,0),c_black,false)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
event_inherited()
