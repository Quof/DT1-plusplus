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
  //x+=xDir
  x+=xDir*gDeltaTime //60fps change: per 30fps tick
  //y+=yDir
  y+=yDir*gDeltaTime //60fps change: per 30fps tick
  if shiftTime>=shiftTimeMax
  {
    //shiftTime=0
    //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    shiftTime=gDeltaTime-1
    xDir*=-1
    yDir*=-1
  }
  else
    //shiftTime+=1
    shiftTime+=gDeltaTime //60fps change: see above
}
