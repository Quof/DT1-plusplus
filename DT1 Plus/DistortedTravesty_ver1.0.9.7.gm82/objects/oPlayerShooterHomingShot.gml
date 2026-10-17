#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_speed=0 //60fps change (added): _speed/_direction stand in for the built-in speed/direction, which start at 0
_direction=0 //60fps change (added): (they must exist before anything reads them)
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
    //speed=bulletSpeed
    _speed=bulletSpeed //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end of the Step)
    //direction=point_direction(x,y,enemyID.x,enemyID.y)
    _direction=point_direction(x,y,enemyID.x,enemyID.y) //60fps change: see above
    //image_angle=direction+270
    image_angle=_direction+270 //60fps change: see above
  }
  else
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
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
