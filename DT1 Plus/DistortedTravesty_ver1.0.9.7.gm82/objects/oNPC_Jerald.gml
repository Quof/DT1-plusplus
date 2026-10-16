#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
bLooksAtPlayer=true
if global.gameProgress<=98
  stringToShow="If you want info about this area, you should talk to " +string(global.mainCharacters[5]) +string(".#He's in this building right next to me.#I'm not sure what we would do without ") +string(global.mainCharacters[5]) +string(" here.#Oh... hey ") +string(global.mainCharacters[0]) +string(", it's been some time. We'll have to catch up later#when these Darkness things aren't trying to get us.")
else if global.gameProgress>=99 and global.gameProgress<=181
  stringToShow="The Darkness really has gone too far this time.#Stick it to'em, we'll keep Abstracity guarded."
else if global.gameProgress>=182 and global.gameProgress<=241
  stringToShow="It is great that " +string(global.mainCharacters[5]) +string(" is back.#Though he doesn't seem to be himself.#Then again, I wouldn't after being in a place like that for so long.")
else if global.gameProgress>=242
  stringToShow="Geez, it's so crazy to think that this whole time,#we've essentially been inside a video game. It's kind of exciting,#but then the reality that said video game wants to kill us kicks in#and suddenly that excitement is gone."
talker="Jerald"
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
