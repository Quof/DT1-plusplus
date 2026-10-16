#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damageYoffset=y
damageAlpha=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damageYoffset-=2
damageAlpha-=0.05

draw_set_font(fnt_ScreenMessage)
draw_set_halign(fa_center)
draw_text_color(x+1,damageYoffset-1,round(damageValue),c_black,c_black,c_black,c_black,damageAlpha) //top right
draw_text_color(x-1,damageYoffset+1,round(damageValue),c_black,c_black,c_black,c_black,damageAlpha) //bottom left
draw_text_color(x-1,damageYoffset-1,round(damageValue),c_black,c_black,c_black,c_black,damageAlpha) //top left
draw_text_color(x+1,damageYoffset+1,round(damageValue),c_black,c_black,c_black,c_black,damageAlpha) //bottom right
draw_text_color(x,damageYoffset,round(damageValue),damageColor,damageColor,damageColor,damageColor,damageAlpha)

if damageAlpha<=0
  instance_destroy()
