#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle2=0
angle3=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameOver=false
{
  x=mouse_x
  y=mouse_y
  angle2+=3.02
  angle3-=3.03
  if room=rWorldMap
    image_alpha=1
  else
    image_alpha=global.optIdentifier/100
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//colorInverter(1,64)
draw_sprite_ext(sIdentifier1,-1,mouse_x,mouse_y,1,1,0,image_blend,image_alpha)
draw_sprite_ext(sIdentifier2,-1,mouse_x,mouse_y,1,1,angle2,image_blend,image_alpha)
draw_sprite_ext(sIdentifier3,-1,mouse_x,mouse_y,1,1,angle3,image_blend,image_alpha)
