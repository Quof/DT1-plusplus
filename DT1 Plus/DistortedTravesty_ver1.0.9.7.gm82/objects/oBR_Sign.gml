#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
colorBorder=make_color_rgb(169,99,0)
colorFill=make_color_rgb(255,183,81)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1)
draw_set_color(colorFill)
draw_rectangle(x-58,y,x+58,y+40,0)
draw_set_color(colorBorder)
draw_rectangle(x-58,y,x+58,y+40,1)
draw_set_color(c_black)
draw_set_font(fnt_BossRush)
draw_set_halign(fa_center)
draw_text(x,y-1,bossText)
