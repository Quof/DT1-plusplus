#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bPlayable=false
//60fps change (added): _speed/_direction/_hspeed/_vspeed stand in for GameMaker's speed/direction/hspeed/vspeed in
//enemies, traps and enemy shots (GM applies those in full every frame; see correctSpeedDirection/correctHSpeedVSpeed)
if !variable_local_exists("_speed") {_speed=0}
if !variable_local_exists("_direction") {_direction=0}
if !variable_local_exists("_hspeed") {_hspeed=0}
if !variable_local_exists("_vspeed") {_vspeed=0}
charEnemyCreateEvent()
size=1
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bCanDealDamage=true
{
  with other
    hitPlayer()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bTakingDamage=false and other.bCanDealDamage=true and bActive=true
{
  var tempCheck;
  tempCheck=0
  for(i=0;i<other.maxAtkId;i+=1)
  {
    if other.atkId[i]=id
      tempCheck=1
  }
  if tempCheck=0
  {
    takeDamage()
    other.atkId[other.maxAtkId]=id
    other.atkIdTime[other.maxAtkId]=reHitTime
    other.maxAtkId+=1
  }

  if other.sprite_index=sBusterShot and parent="enemy"
  {
    with other
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if findTargetX<480 and findTargetY<352
  enemyDrawEvent()
