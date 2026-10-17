#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rotSpeed=8+random(2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//image_angle-=rotSpeed
image_angle-=rotSpeed*gDeltaTime //60fps change: per 30fps tick
