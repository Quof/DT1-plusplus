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
if global.skillCapsules[objectNum]=1
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
Skill Capsule script.
objectNum relates to which global flag to write to.
0 = has not been obtained.
1 = has been obtained.
*/
global.p1SkillPoints+=1
playSound(global.snd_SkillCapsule,0,1)
global.skillCapsules[objectNum]=1
