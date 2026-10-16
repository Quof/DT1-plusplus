#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
throwTime=15
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=0
{
  image_index=type-1
  init=1
}
if global.gamePaused=false
{
  if throwTime>0
  {
    x-=8
    throwTime-=1
  }
  else
  {
    image_xscale+=1.1
    image_yscale+=1.1
    image_alpha-=0.05
    if image_alpha<=0
      instance_destroy()
  }
}
