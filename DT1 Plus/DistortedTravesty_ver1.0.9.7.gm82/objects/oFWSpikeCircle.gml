#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_blend=c_white

//Enemy base statistics
physicalPower=700
powerGain=0
bCanTakeDamage=false
bCauseKnockback=true
bShowHealthBar=false
difficultyAdjustments(global.difficulty)
pPower=physicalPower
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
startScale=image_xscale
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  powerGain=mean(image_xscale,image_yscale)*10
  if powerGain<0
    powerGain*=-1
  physicalPower=round(powerGain)+pPower

  image_angle+=spinSpd

  image_xscale-=0.05
  image_yscale-=0.05
  if image_xscale<=0
  {
    if bDestroyOnSmallScale=1
      instance_destroy()
    if image_xscale<=-startScale
      instance_destroy()
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other
{
  if bCanTakeHit=true and bCanTakeDamage=true and jumpSlashPower<=49
    takeDamage()
}
