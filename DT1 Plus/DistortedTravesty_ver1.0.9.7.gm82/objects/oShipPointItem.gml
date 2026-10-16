#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_yellow
image_alpha=0.75
pointValue=oPlayerShip.grazeCount*20+1000
direction=90
prog=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  prog+=1
  if prog>=1 and prog<=8
    speed=5
  else if prog>=9
  {
    speed=2
    direction=270
  }
  if y>=room_height+8
    instance_destroy()
}
else
  speed=0
#define Collision_oPlayerShipGrazer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayerShip.shooterCurrentScore+=pointValue
instance_destroy()
