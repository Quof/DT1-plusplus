#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
init=0

//Enemy base statistics
physicalPower=400
bCanTakeDamage=false
bShowHealthBar=false
bFollow=false

if global.location="Spire of Forgotten Souls"
  physicalPower+=50
if image_blend=c_black
  physicalPower+=150
difficultyAdjustments(global.difficulty)
if !variable_local_exists("swingSpeed")
{
  swingSpeed=random_range(-2.5,2.5)
  image_angle=irandom(360)
}
if variable_local_exists("idFollow")
  bFollow=true

if variable_local_exists("newDDX")
  detectDistX=newDDX
if variable_local_exists("newDDY")
  detectDistY=newDDY
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=0
{
  if global.difficulty=1
    swingSpeed*=0.9
  else if global.difficulty=3
    swingSpeed*=1.1
  else if global.difficulty=4
    swingSpeed*=1.25
  init=1
}
if global.gamePaused=false
{
  makeEnemyActive()
  image_angle+=swingSpeed
  followInstance()
}
