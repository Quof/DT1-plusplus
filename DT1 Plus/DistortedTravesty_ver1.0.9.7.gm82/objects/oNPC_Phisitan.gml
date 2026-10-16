#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
bLooksAtPlayer=false

if global.gameProgress<=98
  stringToShow="You have to be careful down in these parts.#The Darkness' minions are everywhere, luckily for this city#we have Anti-Darkness Turrets (ADT) installed and running."
else if global.gameProgress>=99 and global.gameProgress<=127
  stringToShow="He is south through the jungle.#Remember, it's not what it seems."
else if global.gameProgress>=128 and global.gameProgress<=181
  stringToShow="I'm surprised X decided to help so fast."
else if global.gameProgress>=182 and global.gameProgress<=241
  stringToShow="It is good to have someone like X on our side.#Thank God that he wasn't caught during the initial Phase Distortion."
else if global.gameProgress>=242
  stringToShow="The guy that's responsible for all this is right here.#I don't know if I want to punch him or shake his hand.#... ... ... Both, shake then BAM!!"
talker="Phisitan"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bLooksAtPlayer=true
  {
    if x<=oPlayer1.x
      image_xscale=1
    else
      image_xscale=-1
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
{
  if x<=oPlayer1.x
    image_xscale=1
  else
    image_xscale=-1
  npcTextBox()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
