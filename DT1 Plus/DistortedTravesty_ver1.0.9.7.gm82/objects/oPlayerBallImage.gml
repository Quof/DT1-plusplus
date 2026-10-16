#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=make_color_rgb(200,200,5)

image_index=oPlayer1.image_index
image_xscale=oPlayer1.image_xscale
image_alpha=1
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  image_alpha-=0.07
if image_alpha<=0
  instance_destroy()
