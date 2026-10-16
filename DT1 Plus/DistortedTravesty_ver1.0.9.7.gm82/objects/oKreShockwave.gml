#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-30,7,-1)
image_speed=0.2

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
fireSpeed=6
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=fireSpeed
  spiritPower-=1

  if isCollisionLeft(1)
    instance_destroy()
  if isCollisionRight(1)
    instance_destroy()
}
else
  speed=0
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
