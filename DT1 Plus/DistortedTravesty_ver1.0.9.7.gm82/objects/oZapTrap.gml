#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

image_speed=random(0.15)+0.5

//Enemy base statistics
physicalPower=400
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
if global.location="Spire of Forgotten Souls"
  physicalPower+=50
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
