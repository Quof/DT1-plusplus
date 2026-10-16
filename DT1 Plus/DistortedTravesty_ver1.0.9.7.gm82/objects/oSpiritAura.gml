#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.2
itemCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.spiritAuras[objectNum]=1
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
Spirit Aura script.
objectNum relates to which global flag to write to.
0 = has not been obtained.
1 = has been obtained.
*/
oPlayer1.maxSpiritEnergy+=20
oPlayer1.maxFireEnergy+=10
oPlayer1.maxWaterEnergy+=10
oPlayer1.maxWindEnergy+=10
oPlayer1.maxEarthEnergy+=10
stringToShow="Your Max Spirit Energy increased by 20!#Your Max Elemental Energy increased by 10!"
messageWidth=string_width(stringToShow)
newMessage=instance_create(256-(messageWidth/2),48,oMessageSign)
newMessage.message=stringToShow
newMessage.fadingTime=60
playSound(global.snd_SkillCapsule,0,1)
global.spiritAuras[objectNum]=1
