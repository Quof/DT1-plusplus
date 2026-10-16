#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.75
image_blend=c_orange
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gDeltaDoTicks //60fps change (added): flickers once per 30fps tick
{
if image_alpha=0.75
  image_alpha=0.25
else
  image_alpha=0.75
} //60fps change (added)

//set in the instance creation code
//if switchID.activated=1
//GM8.2 change: the room gives the switch's old GM8.1 id (switchCache); look it up (see GID)
if variable_local_exists("switchCache") {switchID=GID(switchCache)}
if instance_exists(switchID)
  if switchID.activated=1
    instance_destroy()
