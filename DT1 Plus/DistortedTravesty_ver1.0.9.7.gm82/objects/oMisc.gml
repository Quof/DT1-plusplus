#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dieTime=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if type=3 //Samus after image
if type=3 and gDeltaDoTicks //Samus after image //60fps change: one per 30fps tick
{
  afterImage=instance_create(x,y,oEnemyAfterImage)
  afterImage.sprite_index=sprite_index
  afterImage.image_xscale=image_xscale
  afterImage.imageFade=0.1
  afterImage.xScalingSet=0
  afterImage.yScalingSet=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=2 //IEF9 Shroud Lord glow
{
  draw_set_alpha(0.25)
  draw_set_color(make_color_rgb(255,57,214))
  draw_triangle(oGlobalEvent.sLordX,-384,oGlobalEvent.sLordX+84,304,oGlobalEvent.sLordX-84,304,false)
  draw_set_alpha(0.5)
  draw_set_blend_mode(bm_add)
  draw_circle_color(oGlobalEvent.sLordX,oGlobalEvent.sLordY-16,128,make_color_rgb(255,57,214),c_black,false)
  draw_set_blend_mode(bm_normal)
}
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
