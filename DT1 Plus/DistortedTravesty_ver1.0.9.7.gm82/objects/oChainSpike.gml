#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
swingSpeed=0

//Enemy base statistics
physicalPower=400
bCanTakeDamage=false
bShowHealthBar=false
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  //image_angle+=swingSpeed
  image_angle+=swingSpeed*gDeltaTime //60fps change: per 30fps tick

  if image_angle>360
  {
    //swingSpeed-=0.05
    swingSpeed-=0.05*gDeltaTime //60fps change: per 30fps tick
    if swingSpeed<-4
      swingSpeed=-4
  }
  else
  {
    //swingSpeed+=0.05
    swingSpeed+=0.05*gDeltaTime //60fps change: per 30fps tick
    if swingSpeed>4
      swingSpeed=4
  }
}
