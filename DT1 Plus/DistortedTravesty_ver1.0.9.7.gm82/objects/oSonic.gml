#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if global.gameProgress<=274
  stringToShow="I won't wake him.#He'd probably rather sleep than face up to all the bad games being#released in his name."
else if global.gameProgress>=275
  stringToShow="Looks like The Darkness didn't see him as a threat.#He's so mixed up in depression over his failed career, I can see why."
talker=global.mainCharacters[0]
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
  npcTextBox()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
