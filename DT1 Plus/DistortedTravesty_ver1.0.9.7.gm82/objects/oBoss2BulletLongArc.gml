#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  stopArc-=1
  if stopArc>0
    direction+=changeDir
  if stopArc=0
  {
    bulletSpeed/=1.5
    if bOffset=1
    {
      direction-=global.difficulty*4
      direction+=random(global.difficulty*8)
    }
  }
  image_angle=direction
}
