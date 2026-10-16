#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-3,-3,3,3)

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
direction=90
arcStop=0
decayTime=150
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_angle+=8
  if dir=0
  {
    arcStop+=1
    if arcStop<32
      direction-=5
    else
      direction-=1
  }
  else
  {
    arcStop+=1
    if arcStop<32
      direction+=5
    else
      direction+=1
  }
  speed=bulletSpeed
  if y>=room_height+24
    instance_destroy()
  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
else
  speed=0
