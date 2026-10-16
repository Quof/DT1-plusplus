#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if actorType=0 //rotate type
{
  image_angle+=rotateSpeed
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if drawType=0 //base background - screen follow
  draw_background_ext(backSet,view_xview[0]+xx,view_yview[0]+yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if drawType=1 //base sprite - screen follow
  draw_sprite_ext(backSet,0,view_xview[0]+xx,view_yview[0]+yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
