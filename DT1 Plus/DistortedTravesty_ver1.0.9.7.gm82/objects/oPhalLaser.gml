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
  image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
  image_xscale+=8
  if image_xscale>=800
  {
    oPhalanx.sprite_index=sPhalanxHead
    image_yscale-=1
    y-=1
    if image_yscale<=1
    {
      oPhalanx.laserTime=0
      instance_destroy()
    }
  }
}
