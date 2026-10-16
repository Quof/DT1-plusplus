#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
size=2

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
decayTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
  decayTime+=1
  if decayTime>=1 and decayTime<=120
  {
    image_xscale+=8
    image_yscale+=0.25
  }
  else if decayTime>=121 and decayTime<=134
    image_yscale-=2
  else if decayTime>=135
    instance_destroy()
}
