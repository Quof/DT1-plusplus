#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
ranSpeed=random_range(1,2.5)
image_index=choose(0,1)
wave=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //wave+=1
  wave+=gDeltaTime //60fps change: counts 30fps ticks
  //if wave>=0 and wave<=6
  if wave>-1 and wave<=6 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //x+=1
    x+=gDeltaTime //60fps change: per 30fps tick
  //else if wave>=9 and wave<=14
  else if wave>8 and wave<=14 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //x-=1
    x-=gDeltaTime //60fps change: per 30fps tick
  else if wave>=16
    wave=0
  //y-=ranSpeed
  y-=ranSpeed*gDeltaTime //60fps change: per 30fps tick
  if y<-8 or y<view_yview[0]-96
    instance_destroy()
}
