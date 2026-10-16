#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
physicalPower=500
bCanTakeDamage=false
bCauseKnockback=false
bShowHealthBar=false
difficultyAdjustments(global.difficulty)

shiftTime=0
shiftTimeMax=96

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shiftTimeMax=shiftChange
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  x+=xDir
  y+=yDir
  if shiftTime>=shiftTimeMax
  {
    shiftTime=0
    xDir*=-1
    yDir*=-1
  }
  else
    shiftTime+=1
}
