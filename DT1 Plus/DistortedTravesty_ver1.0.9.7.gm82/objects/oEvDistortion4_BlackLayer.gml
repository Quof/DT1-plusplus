#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.85
image_blend=c_black
pulseTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//pulseTime+=1
pulseTime+=gDeltaTime //60fps change: counts 30fps ticks
//if pulseTime>=1 and pulseTime<=300
if pulseTime>0 and pulseTime<=300 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  //image_alpha-=0.0001
  image_alpha-=0.0001*gDeltaTime //60fps change: per 30fps tick
//else if pulseTime>=301 and pulseTime<=600
else if pulseTime>300 and pulseTime<=600 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  //image_alpha+=0.0001
  image_alpha+=0.0001*gDeltaTime //60fps change: per 30fps tick
else if pulseTime>=601
  pulseTime=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(image_alpha)
draw_set_color(image_blend)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
