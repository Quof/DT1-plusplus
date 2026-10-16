#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
parent="projectile"
event_inherited()
weight=10000
#define Collision_oWaterBarrier
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if size=1
{
  if damageType="PHYSICAL"
    initialDamage=physicalPower
  else if damageType="SPIRIT"
    initialDamage=spiritPower
  other.life-=initialDamage
  instance_destroy()
}
#define Collision_oBlastShield
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if size=1
  instance_destroy()
