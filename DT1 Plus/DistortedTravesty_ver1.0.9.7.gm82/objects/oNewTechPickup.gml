#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.4
itemCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.techCapsule[objectNum]=1
  instance_destroy()
else
{
  if itemCheck=0
  {
    extraItemAlert()
    itemCheck=1
  }
}
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Tech Capsule script.
objectNum relates to which global flag to write to.
0 = has not been obtained.
1 = has been obtained.

objectType relates to which object to give.
101: Zephyr/Earth Shift
102: Grand Slam
*/
if objectType=101
{
  global.windLv=2
  global.earthLv=2
  stringToShow=global.mainCharacters[0] +string(" learned:#Wind Technique: Zephyr#Earth Technique: Earth Shift")
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),144,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=90
}
else if objectType=102
{
  global.techLv=4
  stringToShow=global.mainCharacters[0] +string(" learned:#Physical Technique: Grand Slam")
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),144,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=90
}
else if objectType=201
{
  oPlayer1.maxLife+=20
  oPlayer1.life+=20
  oPlayer1.maxSpiritEnergy+=5
  stringToShow="Oh SNAP!!#Max Life increased by 20!#Max Spirit Energy increased by 5!"
  messageWidth=string_width(stringToShow)
  newMessage=instance_create(256-(messageWidth/2),144,oMessageSign)
  newMessage.message=stringToShow
  newMessage.fadingTime=120
}

playSound(global.snd_SkillCapsule,0,1)
global.techCapsule[objectNum]=1
