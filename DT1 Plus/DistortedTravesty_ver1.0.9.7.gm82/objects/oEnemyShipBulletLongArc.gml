#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
changeDir=1.2
changeDirTime=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if type=0
    direction+=changeDir
  else if type=1
    direction-=changeDir
  changeDirTime+=1
  if changeDirTime>=60
  {
    changeDir*=-1
    changeDirTime=0
  }
}
image_angle=direction
