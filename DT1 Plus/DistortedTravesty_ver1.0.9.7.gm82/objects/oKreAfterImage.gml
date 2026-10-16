#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
imageColor=make_color_rgb(64,128,88)
image_xscale=oFlameInstigator.image_xscale
image_alpha=0.8
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  image_alpha-=0.15
if image_alpha<=0
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,imageColor,image_alpha)
