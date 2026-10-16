#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if doorElement=1
  image_blend=c_red
else if doorElement=2
  image_blend=c_blue
else if doorElement=3
  image_blend=c_green
else if doorElement=4
  image_blend=make_color_rgb(175,77,30)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.p1CurrentElement=1 and doorElement=1
{
  mask_index=sNull
  alpha=0.35
}
else if global.p1CurrentElement=2 and doorElement=2
{
  mask_index=sNull
  alpha=0.35
}
else if global.p1CurrentElement=3 and doorElement=3
{
  mask_index=sNull
  alpha=0.35
}
else if global.p1CurrentElement=4 and doorElement=4
{
  mask_index=sNull
  alpha=0.35
}
else
{
  mask_index=sprite_index
  alpha=1
}
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,alpha)
