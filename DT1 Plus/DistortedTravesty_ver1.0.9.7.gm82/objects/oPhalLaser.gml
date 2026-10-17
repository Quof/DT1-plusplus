#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_angle=180
image_yscale=8

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if gDeltaDoTicks //60fps change (added): a new colour once per 30fps tick
    image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
  //image_xscale+=8
  image_xscale+=8*gDeltaTime //60fps change: per 30fps tick
  //if image_xscale>=800
  if image_xscale>=800-8*(1-gDeltaTime) //60fps change: from the frame in the 30fps tick that reaches 800 (the same at 30fps)
  {
    oPhalanx.sprite_index=sPhalanxHead
    //image_yscale-=1
    image_yscale-=1*gDeltaTime //60fps change: per 30fps tick
    //y-=1
    y-=1*gDeltaTime //60fps change: per 30fps tick
    if image_yscale<=1
    {
      oPhalanx.laserTime=0
      instance_destroy()
    }
  }
}
