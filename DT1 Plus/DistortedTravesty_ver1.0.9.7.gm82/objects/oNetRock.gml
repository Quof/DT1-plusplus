#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-7,7,7)
image_alpha=0

//Enemy base statistics
damageType="SPIRIT"
elementType=4
throwSpeed=2
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if image_alpha<1
  {
    y-=4
    image_alpha+=0.05
  }
  else
  {
    throwDelay-=1
    if throwDelay=0
    {
      playSound(global.snd_RockThrow,0,1)
      direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      bCanDealDamage=true
    }
  }

  if throwDelay<=0
  {
    if throwSpeed<10
      throwSpeed+=0.5
    speed=throwSpeed
  }

  if throwDelay<=0
  {
    if isCollisionTop(1)
      instance_destroy()
    if isCollisionBottom(1)
      instance_destroy()
    if isCollisionLeft(1)
      instance_destroy()
    if isCollisionRight(1)
      instance_destroy()
  }
}
else
  speed=0
