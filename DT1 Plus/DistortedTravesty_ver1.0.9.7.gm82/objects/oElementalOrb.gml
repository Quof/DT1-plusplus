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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//element colors change (added): in the colour picked for its element (Element Colors, Options Set 3); it was drawn as it is (frame type-1, set in the Step)
scrDrawElemSprite(1,type,x,y,image_xscale,image_yscale,image_angle,image_alpha)
