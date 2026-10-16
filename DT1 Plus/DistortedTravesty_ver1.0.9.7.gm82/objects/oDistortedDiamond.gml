#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.2
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
playSound(global.snd_SkillCapsule,0,0.78)
effect_create_above(ef_firework,x,y,0,make_color_rgb(random(255),random(255),random(255)))
if room=rDistortionW4_4
{
  oEvDistortion4_PlayerLamp.vWidth+=128
  oEvDistortion4_PlayerLamp.vHeight+=96
}
instance_destroy()
