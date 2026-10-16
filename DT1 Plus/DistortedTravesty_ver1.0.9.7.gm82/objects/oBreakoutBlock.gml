#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
useColor=0
bCanHit=false
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bCanHit=true
{
  oEvDistortionW3.enemyCount-=1
  instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if useColor=0
  draw_sprite(sprite_index,-1,x,y)
else if useColor=1
  draw_sprite(sprite_index,pointValue-1,x,y)
