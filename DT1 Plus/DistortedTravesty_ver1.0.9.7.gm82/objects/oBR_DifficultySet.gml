#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1
curConfirm=ord("J")
image_blend=c_green
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
/*
Difficulty script.
*/
if (keyboard_check_pressed(ord(global.ctrlUp))) or keyboard_check_pressed(vk_up) and global.gamePaused=false
{
  playSound(global.snd_MenuConfirm,0,1)
  global.difficulty+=1
  if global.difficulty=5
    global.difficulty=1

  if global.difficulty=1 {stringToShow="Difficulty Level: Beginner"}
  else if global.difficulty=2 {stringToShow="Difficulty Level: Veteran"}
  else if global.difficulty=3 {stringToShow="Difficulty Level: Hardcore"}
  else if global.difficulty=4 {stringToShow="Difficulty Level: Distorted"}

  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),192,oMessageMenuPopup)
  newMessage.message=stringToShow
  newMessage.fadingTime=70
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,image_blend,1)
