#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

image_blend=c_red
//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=bulletSpeed
  if x<oPlayer1.x
  {
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_xscale=0.3
    effect.image_yscale=0.3
    effect.newBlend=1
    newLaser=instance_create(x,y,oLaserB)
    newLaser.physicalPower=physicalPower
    newLaser.bulletSpeed=13
    newLaser.direction=270
    instance_destroy()
  }

  if x<1344
  {
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_xscale=0.3
    effect.image_yscale=0.3
    effect.newBlend=1
    instance_destroy()
  }
}
else
  speed=0
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
