#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bCanDealDamage=true
damageType="PHYSICAL"
elementType=0
bulletSpeed=19
image_xscale=0.6
image_yscale=0.6
enemyID=instance_nearest(x,y,oShipEnemyBase)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if instance_exists(enemyID)
  {
    speed=bulletSpeed
    direction=point_direction(x,y,enemyID.x,enemyID.y)
    image_angle=direction+270
  }
  else
    instance_destroy()
}
else
  speed=0
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_blend_mode(bm_normal)
