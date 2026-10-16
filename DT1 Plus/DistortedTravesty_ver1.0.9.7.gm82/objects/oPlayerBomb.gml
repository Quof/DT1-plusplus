#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bCanDealDamage=true
damageType="PHYSICAL"
elementType=0
bulletSpeed=15
decay=60
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  x=oPlayerShip.x
  y=oPlayerShip.y
  decay-=1
  image_xscale+=0.18
  image_yscale+=0.12

  if decay<=9
    image_alpha-=0.1
  if decay<=0
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_xscale,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
