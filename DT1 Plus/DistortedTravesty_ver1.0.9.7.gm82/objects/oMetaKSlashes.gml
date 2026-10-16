#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.33
image_alpha=0.75

//Enemy base statistics
init=0
fireSpeed=6
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if type=1
  {
    if oMetaKnight.image_xscale=1
      offsetX=2
    else
      offsetX=-2
    x=oMetaKnight.x+offsetX
    y=oMetaKnight.y-8
  }
  else if type=2
  {
    if init=0
    {
      if image_xscale=-1
        direction=180
      image_speed=0
      image_index=1
      init=1
    }
    speed=fireSpeed
  }
  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
else
  speed=0
