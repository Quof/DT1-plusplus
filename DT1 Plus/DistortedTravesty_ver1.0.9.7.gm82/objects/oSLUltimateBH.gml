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
  //image_angle+=dirChange
  image_angle+=dirChange*gDeltaTime //60fps change: per 30fps tick
  //shotTime+=1
  shotTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if shotTime mod shotFreq=0
  if scrModPass(shotTime,shotFreq) //60fps change: once each time the count reaches a multiple of it
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
      //newBullet.direction=image_angle+(i*180)
      newBullet._direction=image_angle+(i*180) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newBullet.image_angle=image_angle+(i*180)
    }
  }
  //decayTime-=1
  decayTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if decayTime=0
  if decayTime<=0 //60fps change: <= so it still ends if the frame rate changes mid-count
    instance_destroy()
}
