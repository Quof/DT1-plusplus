#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fadeAlpha=0
changeType=0 //0: going off, 1: going on
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if changeType=0 //going off
{
  if fadeAlpha>0
    //fadeAlpha-=0.1
    fadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
}
else if changeType=1 //going on
{
  if fadeAlpha<1
    //fadeAlpha+=0.1
    fadeAlpha+=0.1*gDeltaTime //60fps change: per 30fps tick
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(fadeAlpha)
draw_set_color(c_black)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
