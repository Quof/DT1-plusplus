#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//find the correct sprite for effect and collision
damageType="SKILL"
physicalPower=oPlayer1.physicalPower/1.2
elementType=2

attackType=MUUGURU
skillPower=5
image_speed=0.66
lifeTime=40
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  speed=bulletSpeed

  if lifeTime<=0
    instance_destroy()
  else
    lifeTime-=1
}
else
  speed=0
