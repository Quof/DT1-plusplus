#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-5,-3,5,3)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
decayTime=150
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
  image_angle=direction
  speed=bulletSpeed
  decayTime-=1
  if decayTime<=0
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
