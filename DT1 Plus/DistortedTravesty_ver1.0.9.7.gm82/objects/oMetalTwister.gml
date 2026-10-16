#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)
image_speed=0.5
image_yscale=1.7

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
fireSpeed=10
changeTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=fireSpeed
  changeTime+=1
  if changeTime>=45
  {
    if direction=0
      direction=180
    else
      direction=0
    changeTime=0
    twisterPasses-=1
    if twisterPasses<=0
      instance_destroy()
  }
}
else
  speed=0
