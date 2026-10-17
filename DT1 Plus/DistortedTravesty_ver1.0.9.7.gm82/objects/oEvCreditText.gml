#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+368
y=view_yview[0]+384
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if creditAlign=fa_left
  x=view_xview[0]+246
else if creditAlign=fa_right
  x=view_xview[0]+490
y+=yAdjust
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//y-=scrollSpeed
y-=scrollSpeed*gDeltaTime //60fps change: per 30fps tick
if y<=-(64+string_height(creditString))
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(creditFont)
draw_set_halign(creditAlign)
draw_set_valign(fa_top)
draw_set_alpha(image_alpha)
draw_set_color(c_black)
draw_text(x,y-1,creditString) //top
draw_text(x,y+1,creditString) //bottom
draw_text(x+1,y,creditString) //left
draw_text(x+1,y,creditString) //right
draw_text(x-1,y-1,creditString) //top-left
draw_text(x-1,y+1,creditString) //bottom-left
draw_text(x+1,y-1,creditString) //top-right
draw_text(x+1,y+1,creditString) //bottom-right
draw_set_color(image_blend)
draw_text(x,y,creditString) //normal
