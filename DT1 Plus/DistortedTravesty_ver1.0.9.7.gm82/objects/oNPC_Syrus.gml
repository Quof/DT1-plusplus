#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
stringToShow=""
if global.gameProgress>=86
  stringToShow="The train is to the east, I've marked it on your map."
if global.gameProgress>=181
  stringToShow="Good luck.#I will keep this place safe."
if global.gameProgress>=241
  stringToShow=". . ."
talker=global.mainCharacters[5]
image_xscale=-1
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
{
  if stringToShow!=""
  {
    if x<=oPlayer1.x
      image_xscale=1
    else
      image_xscale=-1
    npcTextBox()
  }
  if global.gameProgress=84
    global.gameProgress=85
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
