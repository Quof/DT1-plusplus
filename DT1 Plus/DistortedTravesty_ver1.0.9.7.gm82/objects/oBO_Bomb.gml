#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
size=2
image_alpha=0.85
image_xscale=0.85
image_yscale=0.85
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  y+=5.5
  if y>=352
  {
    explosion=instance_create(x,352,oGASGExplosion)
    explosion.physicalPower=physicalPower
    explosion.sprite_index=sKMfirePillar
    explosion.image_speed=0.8
    instance_destroy()
  }
}
