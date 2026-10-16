#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.6

//Enemy base statistics
maxLife=1
life=maxLife
expWorth=3
rupeeWorth=2
baseItemChance=2
hitSound=0
dieSound=0
dieEffect=sGrenadeExplosion
effectXscale=0.3
effectYscale=0.3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(0.15)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y-8,16,make_color_rgb(240,193,64),c_black,false)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
event_inherited()
