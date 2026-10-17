#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_xscale=room_width
image_yscale=5
size=2

//Enemy base statistics
damageType="SPIRIT"
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.gamePaused=false
if global.gamePaused=false and gDeltaDoTicks //60fps change: a new colour once per 30fps tick
  image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
