#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.switchTrigger[objectNum]=1
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,-1,x,y)
draw_sprite(sMDoorSide,doorColor,x-24,y)
draw_sprite_ext(sMDoorSide,doorColor,x+24,y,-1,1,0,c_white,1)
