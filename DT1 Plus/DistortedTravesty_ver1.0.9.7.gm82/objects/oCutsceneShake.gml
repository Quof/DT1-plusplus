#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shakeChange=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gDeltaDoTicks //60fps change (added): it shakes once per 30fps tick, as at 30fps
{ //60fps change (added)
if shakeChange=0
{
  x+=shakePower
  shakeChange=1
}
else if shakeChange=1
{
  x-=shakePower
  shakeChange=0
}
} //60fps change (added)
