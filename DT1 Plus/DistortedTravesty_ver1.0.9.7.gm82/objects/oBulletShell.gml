#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
setCollisionBounds(-3,-1,3,1)
//gravity_direction=270
//gravity=0.65
//60fps change: it moves by _hspeed/_vspeed (see correctHSpeedVSpeed, the spawner sets them) with this gravity, per
//30fps tick (the step)
shellGrav=0.65
_hspeed=0
_vspeed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //if direction>=90
  //  image_angle-=8
  //else
  //  image_angle+=8
  //60fps change: per 30fps tick; it moves by _hspeed/_vspeed, so the direction it's moving in is theirs
  if point_direction(0,0,_hspeed,_vspeed)>=90
    image_angle-=8*gDeltaTime
  else
    image_angle+=8*gDeltaTime
  if isCollisionTop(1)
    instance_destroy()
  if isCollisionBottom(1)
    instance_destroy()
  if isCollisionLeft(1)
    instance_destroy()
  if isCollisionRight(1)
    instance_destroy()
  if isCollisionSolid()
    instance_destroy()
}
//60fps change (added): GM's gravity (added to the speed before it moves; the built-ins also ran while paused), per
//30fps tick following the 30fps arc, then the move
_vspeed=scrGravAcc(_vspeed,shellGrav,1)
correctHSpeedVSpeed(id)
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
