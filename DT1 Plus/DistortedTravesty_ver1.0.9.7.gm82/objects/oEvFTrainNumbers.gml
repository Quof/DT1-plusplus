#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
yText=236
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(make_color_rgb(210,180,120))
draw_set_font(fnt_Continue)
draw_set_alpha(1)
draw_set_halign(fa_center)
if room=rFrightTrain1
{
  draw_text(416,yText,"1")
  draw_text(928,yText,"2")
  draw_text(1440,yText,"3")
  draw_text(1984,yText,"4")
  draw_text(2496,yText,"5")
  draw_text(3072,yText,"6")
  draw_text(3584,yText,"7")
  draw_text(4192,yText,"8")
  draw_text(4768,yText,"9")
  draw_text(5280,yText,"10")
  draw_text(5664,yText,"11")
  draw_text(6208,yText,"12")
}
else if room=rFrightTrain2
{
  draw_text(352,yText,"13")
  draw_text(992,yText,"14")
  draw_text(1504,yText,"15")
  draw_text(1888,yText,"16")
  draw_text(2272,yText,"17")
  draw_text(2656,yText,"18")
  draw_text(3488,yText,"19")
  draw_text(4080,yText,"20")
  draw_text(5248,yText,"21")
}
else if room=rFrightTrain6
{
  draw_text(448,yText,"22")
  draw_text(960,yText,"23")
  draw_text(1472,yText,"24")
  draw_text(2016,yText,"25")
}
else if room=rFrightTrain7
  draw_text(544,yText,"26")
