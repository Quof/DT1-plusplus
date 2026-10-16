#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if actorType=0
{
  image_angle+=rotateSpeed
  direction+=dirChange
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if drawType=0
{
  draw_background_ext(backSet,vx,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
else if drawType=1
  draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
