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
timeUntilBreak=9    //time till platform falls
newSprite=0
effectYscale=0.3
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.location="Diluted Mansion"
{
  newSprite=2
  timeUntilBreak=16
  effectXscale=1.3
  image_xscale=1.5
}
else if global.location="Shady Caves"
{
  newSprite=1
  timeUntilBreak=12
  effectYscale=0.9
  image_yscale=2
}
else if global.location="Secured Data Segment"
{
  newSprite=3
  timeUntilBreak=12
  effectYscale=0.9
  image_yscale=2
}
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
      effect.image_xscale=0.9
      effect.image_yscale=effectYscale
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
else if newSprite=1 //Shady Caves block
  draw_background_part(tileShadyCaves,0,64,32,32,x,y)
else if newSprite=2 //Diluted Mansion
  draw_background_part(tileDilutedMansion,208,112,48,16,x,y)
else if newSprite=3 //Secured Data Segment
  draw_background_part(tileDataSegment1,64,32,32,16,x,y)
