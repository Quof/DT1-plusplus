#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
arcStop=60
bDestroyIfOffScreen=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //arcStop-=1
  arcStop-=gDeltaTime //60fps change: counts 30fps ticks
  if arcStop<=0
    bulletArc=0
}
