#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+368
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//y-=scrollSpeed
y-=scrollSpeed*gDeltaTime //60fps change: per 30fps tick
if y<=-(64+sprite_height)
  instance_destroy()
