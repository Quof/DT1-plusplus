#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shotTime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_angle+=dirChange
  shotTime+=1
  if shotTime mod shotFreq=0
  {
    for(i=0;i<2;i+=1)
    {
      effect=instance_create(x,y,oEffect)
      effect.x=x+lengthdir_x(23,image_angle+(i*180))
      effect.y=y+lengthdir_y(23,image_angle+(i*180))
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.image_xscale=0.2
      effect.image_yscale=0.2
      effect.newBlend=1

      newBullet=instance_create(x,y,oMMeShot1)
      newBullet.x=x+lengthdir_x(23,image_angle+(i*180))
      newBullet.y=y+lengthdir_y(23,image_angle+(i*180))
      newBullet.sprite_index=sEbulletDiamond
      newBullet.damageType="SPIRIT"
      newBullet.spiritPower=oShroudLordLv2.spiritPower/1.1
      newBullet.bulletSpeed=5
      newBullet.direction=image_angle+(i*180)
      newBullet.image_angle=image_angle+(i*180)
    }
  }
  decayTime-=1
  if decayTime=0
    instance_destroy()
}
