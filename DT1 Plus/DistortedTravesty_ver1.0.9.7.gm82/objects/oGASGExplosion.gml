#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=0
{
  init=1
  if sprite_index=sBoomlol
    decayTime=8
}
if variable_local_exists("decayTime")
{
  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime<=0
    instance_destroy()
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index!=sBoomlol
  instance_destroy()
