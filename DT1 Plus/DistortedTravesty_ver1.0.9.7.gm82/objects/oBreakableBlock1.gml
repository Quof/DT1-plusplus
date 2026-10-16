#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spriteChange=0
if global.location="Distortion WTF"
  spriteChange=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if spriteChange=0
  draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if spriteChange=1
  draw_background_part(tileDistortion3,32,0,16,16,x,y)
