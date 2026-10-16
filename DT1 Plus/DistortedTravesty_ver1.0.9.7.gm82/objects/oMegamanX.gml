#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stringToShow=""
if global.gameProgress>=182
  stringToShow="I will keep you updated on anything new I find."
talker="X"
image_xscale=-1
textScan=""
textAlpha=1
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
  if global.gameProgress=116
    global.gameProgress=117
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
if textScan!=""
{
  draw_set_color(make_color_rgb(0,255,0))
  if textAlpha=1
    textAlpha=0.8
  else
    textAlpha=1
  draw_set_alpha(textAlpha)
  draw_set_font(fnt_CombatData)
  draw_set_halign(fa_center)
  draw_text(x,y-64,textScan)
}
