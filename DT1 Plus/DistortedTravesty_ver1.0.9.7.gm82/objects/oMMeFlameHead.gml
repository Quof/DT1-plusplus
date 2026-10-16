#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.2+random(0.05)
//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
damageType="SPIRIT"
elementType=1
changeTime=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=bulletSpeed
  changeTime-=1
  if changeTime>0
  {
    if type=0 //right
    {
      direction+=3
    }
    else if type=1 //left
    {
      direction-=3
    }
  }
}
else
  speed=0
