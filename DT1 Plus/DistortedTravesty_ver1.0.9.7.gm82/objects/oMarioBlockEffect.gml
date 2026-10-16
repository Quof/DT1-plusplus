#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
decay=20
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0 //top left
{
  hspeed=-2
  vspeed=-6
}
else if type=1 //top right
{
  hspeed=2
  vspeed=-6
}
else if type=2 //bottom left
{
  hspeed=-2
  vspeed=-3
}
else if type=3 //bottom right
{
  hspeed=2
  vspeed=-3
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed+=0.4

decay-=1
if decay<=0
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0 //top left
  draw_sprite_general(sMarioBreakBlock,0,0,0,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=1 //top right
  draw_sprite_general(sMarioBreakBlock,0,8,0,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=2 //bottom left
  draw_sprite_general(sMarioBreakBlock,0,0,8,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
else if type=3 //bottom right
  draw_sprite_general(sMarioBreakBlock,0,8,8,8,8,x,y,1,1,image_angle,c_white,c_white,c_white,c_white,1)
