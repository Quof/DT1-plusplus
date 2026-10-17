#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if global.gameProgress=18
  stringToShow=""
else if global.gameProgress>=20 and global.gameProgress<=32
  stringToShow="Head east to the Old Castle."
else if global.gameProgress=33
  stringToShow=""
else if global.gameProgress>=35
  stringToShow="Go to the lands south-west from the Donut Plains.#You may find what it is you seek there."
talker="Mayor of Toad Town"
image_blend=c_ltgray
image_xscale=-1
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp))) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  if stringToShow!=""
  {
    if x<=oPlayer1.x
      image_xscale=1
    else
      image_xscale=-1
    npcTextBox()
  }
  else if global.gameProgress=18
    global.gameProgress=19
  else if global.gameProgress=33
    global.gameProgress=34
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
