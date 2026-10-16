#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
bLooksAtPlayer=false
if global.gameProgress<=98
  stringToShow="There's a crazy train carrying some interesting cargo just to the#east from here. We need that cargo, but it's under the#control of The Darkness."
else if global.gameProgress>=99 and global.gameProgress<=181
  stringToShow="Wow, you are awesome! Stopped them on their own turf.#Now that's impressive."
else if global.gameProgress>=182 and global.gameProgress<=241
  stringToShow="I can't believe we're all being held in this hell hole by a damn program.#I wonder if it dividing by zero would shut it down...#it probably has a fail safe for that."
else if global.gameProgress>=242
  stringToShow="It would be cool if I got to use these swords again."
talker="Narusus"
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
