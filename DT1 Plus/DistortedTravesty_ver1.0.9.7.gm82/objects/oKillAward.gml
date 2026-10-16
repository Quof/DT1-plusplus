#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
expYoffset=y
expAlpha=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
expYoffset-=0.2
expAlpha-=0.03

draw_set_font(fnt_Exp)
draw_set_halign(fa_center)
draw_text_color(x+1,expYoffset+1,round(expValue),c_black,c_black,c_black,c_black,expAlpha)
draw_text_color(x+1,expYoffset+11,"Exp",c_black,c_black,c_black,c_black,expAlpha)
draw_text_color(x,expYoffset,round(expValue),c_white,c_white,c_white,c_white,expAlpha)
draw_text_color(x,expYoffset+10,"Exp",c_white,c_white,c_white,c_white,expAlpha)

if expAlpha<=0
  instance_destroy()
