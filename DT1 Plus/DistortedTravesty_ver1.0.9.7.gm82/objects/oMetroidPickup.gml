#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if objectType=101 and global.gameProgress>=344
  instance_destroy()
else if objectType=102 and global.gameProgress>=346
  instance_destroy()
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if objectType=101
{
  stringToShow="You got the Morph Ball!#Press [Down] to use it.#Press [Up] to come back out.#You roll faster than you run."
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),52,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=210
  global.gameProgress=344
}
else if objectType=102
{
  stringToShow="You got the Hi Jump Boots!#You can now jump very high."
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),52,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=130
  oPlayer1.initialJumpAcc=-15.46
  oPlayer1.jumpTimeTotal=44
  global.gameProgress=346
}
playSound(global.snd_SkillCapsule,0,1)
