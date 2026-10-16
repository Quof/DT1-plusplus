#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
effectDelay=0
size=2
bRiseUp=false
imageDelay=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bRiseUp=false
  {
    imageDelay+=1
    if imageDelay>=2
    {
      image_index+=1
      imageDelay=0
    }
    if image_index=4
      bRiseUp=true
  }
  else
  {
    imageDelay+=1
    if imageDelay>=2
    {
      if image_index=0
        instance_destroy()
      image_index-=1
      imageDelay=0
    }
  }
}
