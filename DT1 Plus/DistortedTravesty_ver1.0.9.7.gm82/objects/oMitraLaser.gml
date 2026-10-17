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
  if gDeltaDoTicks //60fps change (added): a new colour once per 30fps tick
    image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
  //decayTime+=1
  decayTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if decayTime>=1 and decayTime<=120
  if decayTime>0 and decayTime<=120 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
  {
    //image_xscale+=8
    image_xscale+=8*gDeltaTime //60fps change: per 30fps tick
    //image_yscale+=0.25
    image_yscale+=0.25*gDeltaTime //60fps change: per 30fps tick
  }
  //else if decayTime>=121 and decayTime<=134
  else if decayTime>120 and decayTime<=134 //60fps change: see above
    //image_yscale-=2
    image_yscale-=2*gDeltaTime //60fps change: per 30fps tick
  //else if decayTime>=135
  else if decayTime>134 //60fps change: see above
    instance_destroy()
}
