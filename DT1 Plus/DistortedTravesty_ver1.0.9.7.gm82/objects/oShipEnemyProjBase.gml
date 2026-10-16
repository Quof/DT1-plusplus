#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bDestroyIfOffScreen=0
bulletSpeed=1
bulletArc=0
moveDelay=0
decay=-1
bCanGraze=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if moveDelay=0
  {
    speed=bulletSpeed
    direction+=bulletArc
  }
  else
    moveDelay-=1

  if bDestroyIfOffScreen=1 //delete if off screen
  {
    if x<-sprite_width-4
      instance_destroy()
    else if x>view_shooter_x+sprite_width+4
      instance_destroy()
    else if y<-sprite_height-4
      instance_destroy()
    else if y>room_height+sprite_height+4
      instance_destroy()
  }
  if decay>0
  {
    decay-=1
    if decay=0
      instance_destroy()
  }
}
else
  speed=0
#define Collision_oPlayerShip
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oPlayerShip.bCanTakeDamage=true and !instance_exists(oPlayerBomb)
{
  effect_create_above(ef_ring,x,y,2,c_red)
  oPlayerShip.damageTime=45
  oPlayerShip.bCanTakeDamage=false
  oPlayerShip.life-=1
  with oShipEnemyProjBase
  {
    effect_create_above(ef_ring,x,y,0,c_red)
    instance_destroy()
  }
  instance_destroy()
}
#define Collision_oPlayerShipGrazer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bCanGraze=1
{
  oPlayerShip.grazeCount+=1
  bCanGraze=0
}
