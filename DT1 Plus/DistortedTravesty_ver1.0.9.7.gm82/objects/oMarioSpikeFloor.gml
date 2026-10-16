#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

image_angle=180
x+=15
y+=16

//Enemy base statistics
physicalPower=400
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
bFollow=false
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.location="Black Rock Fortress"
{
  physicalPower+=200
  sprite_index=sBRFSpike
}
else if global.location="Windy Slopes"
{
  x+=1
  physicalPower+=200
  sprite_index=sWindySlopesSpike
}
else if global.location="Spire of Forgotten Souls"
  physicalPower+=50
difficultyAdjustments(global.difficulty)

if variable_local_exists("idFollow")
  bFollow=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
  makeEnemyActive()
followInstance()
