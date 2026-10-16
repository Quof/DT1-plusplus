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
  wave+=1
  if wave>=0 and wave<=6
    x+=1
  else if wave>=9 and wave<=14
    x-=1
  else if wave>=16
    wave=0
  y-=ranSpeed
  if y<-8 or y<view_yview[0]-96
    instance_destroy()
}
