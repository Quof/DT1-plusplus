#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(1,0,sprite_width,sprite_height)
moving=false
eyeFrame=-1

chainY=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the character stands on the platform, move the platform continuously
if global.gamePaused=false
{
  if yVel!=0
  {
    for(i=0;i<4;i+=1)
    {
      tEffect=instance_create(x+4+random(sprite_width-8),y+60+random(14),oEffect)
      tEffect.depth=60
      tEffect.sprite_index=sEfSparkle
      tEffect.image_speed=0.2+random(0.2)
      tEffect.ySpd=random_range(0.9,3.1)
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if chainY>0
{
  for(i=0;i<40;i+=1)
  {
    draw_background_part(tileVeiledDetritus,80,144,16,16,x+88,y-272-(i*16)+chainY)
    draw_background_part(tileVeiledDetritus,80,144,16,16,x+264,y-272-(i*16)+chainY)
  }
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if eyeFrame>=0 {draw_sprite(sWhaleEye,eyeFrame,x+56,y+40)}
