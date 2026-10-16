#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(0,0,sprite_width,sprite_height)

//variables for the break platform
bBreaking=0         //is the platform breaking
timeUntilBreak=6    //time till platform falls
newSprite=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("spriteChange")
  newSprite=spriteChange
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the character's falling
if global.gamePaused=false
{
  if bBreaking
  {
    timeUntilBreak-=1
    if timeUntilBreak<=0
    {
      effect=instance_create(x+(sprite_width/2),y+(sprite_height/2),oEffect)
      effect.sprite_index=sDustCloud
      effect.image_xscale=0.3
      effect.image_yscale=0.3
      instance_destroy()
    }
  }
  else
  {
    //if the character stands on or bumps the platform, start the timer
    if isCollisionCharacterTop(1)
      bBreaking=1
    if isCollisionCharacterBottom(1)
      bBreaking=1
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if newSprite=0
  draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
else if newSprite=1 //Veiled Detritus Block
  draw_background_part(tileVeiledDetritus,80,48,16,16,x,y)
