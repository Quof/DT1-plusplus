#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setToDestroy=150
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //setToDestroy-=1
  setToDestroy-=gDeltaTime //60fps change: counts 30fps ticks
  //if setToDestroy=0
  if setToDestroy<=0 //60fps change: <= so it still happens if the frame rate changes mid-count
    bDestroyIfOffScreen=true
}
