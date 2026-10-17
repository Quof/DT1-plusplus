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
    //x-=8
    x-=8*gDeltaTime //60fps change: per 30fps tick
    //throwTime-=1
    throwTime-=gDeltaTime //60fps change: counts 30fps ticks
  }
  else
  {
    //image_xscale+=1.1
    image_xscale+=1.1*gDeltaTime //60fps change: per 30fps tick
    //image_yscale+=1.1
    image_yscale+=1.1*gDeltaTime //60fps change: per 30fps tick
    //image_alpha-=0.05
    image_alpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    if image_alpha<=0
      instance_destroy()
  }
}
