#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//post message
if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
{
  global.recSignsRead+=1
  with oMessageSign
    instance_destroy()
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(floor(256-(messageWidth/2)),48,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=60
}
