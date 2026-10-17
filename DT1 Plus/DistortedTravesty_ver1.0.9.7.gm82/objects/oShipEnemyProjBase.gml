#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
_speed=0 //60fps change (added): _speed/_direction stand in for the built-in speed/direction, which start at 0
_direction=0 //60fps change (added): (they must exist before the Step reads them; a spawner sets them after this)
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
  //if moveDelay=0
  //{
  //  speed=bulletSpeed
  //  direction+=bulletArc
  //}
  //else
  //  moveDelay-=1
  //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end); it turns and counts per 30fps tick (<= so the wait still ends if the frame rate
  //changes mid-count)
  if moveDelay<=0
  {
    _speed=bulletSpeed
    _direction+=bulletArc*gDeltaTime
  }
  else
    moveDelay-=gDeltaTime

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
    //decay-=1
    //if decay=0
    decay-=gDeltaTime //60fps change: counts 30fps ticks
    if decay<=0 //60fps change: <= so it still ends if the frame rate changes mid-count
      instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
//60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick. A child whose own Step
//changes them (or uses x/y) after event_inherited() sets csdLater first and moves at the end of its own Step instead,
//as GM's built-in motion came after the whole Step event
if !variable_local_exists("csdLater") correctSpeedDirection(id)
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
