#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

image_speed=random(0.1)+0.1

//Enemy base statistics
spiritPower=600
damageType="SPIRIT"
elementType=1
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
if global.location="Distortion Reckoning"
{
  spiritPower+=100
  image_blend=c_black
}
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
