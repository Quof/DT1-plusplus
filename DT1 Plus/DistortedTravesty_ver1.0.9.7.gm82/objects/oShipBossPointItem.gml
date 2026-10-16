#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_blue
image_alpha=0.75
pointValue=round((oPlayerShip.grazeCount*3.5)+100)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=12
  direction=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
}
else
  speed=0
#define Collision_oPlayerShip
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oPlayerShip.shooterCurrentScore+=pointValue
instance_destroy()
