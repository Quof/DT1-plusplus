#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=32
image_speed=0
if global.gameProgress<183
  instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  npcTextBox()
}
