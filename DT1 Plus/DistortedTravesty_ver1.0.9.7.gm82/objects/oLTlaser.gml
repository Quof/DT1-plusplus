#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-7,7,7)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
decayTime=12
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_blend=make_color_rgb(round(random(50)+100),round(random(50)+100),round(random(50)+100))
  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
