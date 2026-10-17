#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
levelUpYoffset=y
levelUpAlpha=1
playSound(global.snd_LevelUp,0,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//levelUpYoffset-=1
levelUpYoffset-=gDeltaTime //60fps change: per 30fps tick
//levelUpAlpha-=0.03
levelUpAlpha-=0.03*gDeltaTime //60fps change: per 30fps tick

draw_set_font(fnt_AreaName)
draw_set_halign(fa_center)
draw_text_color(x-1,levelUpYoffset-1,"LEVEL UP",c_white,c_white,c_white,c_white,levelUpAlpha)
draw_text_color(x+1,levelUpYoffset+1,"LEVEL UP",c_black,c_black,c_black,c_black,levelUpAlpha)
draw_text_color(x,levelUpYoffset,"LEVEL UP",c_orange,c_orange,c_orange,c_orange,levelUpAlpha)

if levelUpAlpha<=0
  instance_destroy()
