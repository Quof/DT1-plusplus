#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
physicalPower=600
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
if global.location="Distortion Reckoning" or global.location="Spire of Forgotten Souls"
  sprite_index=sInvisibleSolidMask
else if global.location="Secured Data Segment"
  physicalPower+=100
difficultyAdjustments(global.difficulty)
