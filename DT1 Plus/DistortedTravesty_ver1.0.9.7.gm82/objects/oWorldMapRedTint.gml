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
//distortedTime+=1
distortedTime+=gDeltaTime //60fps change: counts 30fps ticks
//if distortedTime>=1 and distortedTime<=60
if distortedTime>0 and distortedTime<=60 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  //distortedAlpha+=0.005
  distortedAlpha+=0.005*gDeltaTime //60fps change: per 30fps tick
//else if distortedTime>=61 and distortedTime<=120
else if distortedTime>60 and distortedTime<=120 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
{
  //distortedAlpha-=0.005
  distortedAlpha-=0.005*gDeltaTime //60fps change: per 30fps tick
  //if distortedTime=120
  if scrCountPass(distortedTime,120) //60fps change: once, when the count reaches it
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
