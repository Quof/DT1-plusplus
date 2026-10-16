#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oEvDataSegmentW1.choiceMade=buttonType
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=make_color_rgb(90,90,90)
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_white
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,1,1,0,image_blend,1)
draw_set_alpha(1)
draw_set_font(fnt_HUD_Shooter)
draw_set_color(make_color_rgb(82,9,9))
draw_set_halign(fa_center)
draw_text(x,y-10,buttonMessage)
