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
if image_alpha=0.75
  image_alpha=0.25
else
  image_alpha=0.75

//set in the instance creation code
if switchID.activated=1
  instance_destroy()
