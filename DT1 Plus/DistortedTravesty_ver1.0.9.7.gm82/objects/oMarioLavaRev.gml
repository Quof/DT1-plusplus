#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

image_angle=180
x+=15
y+=15
image_speed=random(0.1)+0.1

//Enemy base statistics
spiritPower=600
damageType="SPIRIT"
elementType=1
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
