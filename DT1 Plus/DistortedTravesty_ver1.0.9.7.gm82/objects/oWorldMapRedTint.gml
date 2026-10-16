#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
distortedAlpha=0.28
distortedTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
distortedTime+=1
if distortedTime>=1 and distortedTime<=60
  distortedAlpha+=0.005
else if distortedTime>=61 and distortedTime<=120
{
  distortedAlpha-=0.005
  if distortedTime=120
    distortedTime=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_red)
draw_set_alpha(distortedAlpha)
draw_rectangle(0,0,room_width,room_height,0)
