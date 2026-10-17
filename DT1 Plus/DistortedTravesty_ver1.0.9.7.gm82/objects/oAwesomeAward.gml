#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=48
y=64
awesomeYoffset=y
awesomeAlpha=1
init=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=0
{
  oPlayer1.awesomePoints+=awesomeValue
  init=1
}
//awesomeYoffset-=0.2
awesomeYoffset-=0.2*gDeltaTime //60fps change: per 30fps tick
//awesomeAlpha-=0.03
awesomeAlpha-=0.03*gDeltaTime //60fps change: per 30fps tick

draw_set_font(fnt_Exp)
draw_set_halign(fa_center)
draw_text_color(view_xview[0]+x,view_yview[0]+awesomeYoffset,round(awesomeValue),c_white,c_white,c_white,c_white,awesomeAlpha)
draw_text_color(view_xview[0]+x,view_yview[0]+awesomeYoffset+10,"Awesome",c_white,c_white,c_white,c_white,awesomeAlpha)

if awesomeAlpha<=0
  instance_destroy()
