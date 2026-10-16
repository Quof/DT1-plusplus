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
  waitTime-=1
  if waitTime=0
  {
    bulletSpeed=7
    direction=point_direction(x,y,oPlayer1.x,oPlayer1.y)
  }
  else if waitTime>0
  {
    if bulletSpeed>0
      bulletSpeed-=0.2
  }
  speed=bulletSpeed
}
else
  speed=0
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
