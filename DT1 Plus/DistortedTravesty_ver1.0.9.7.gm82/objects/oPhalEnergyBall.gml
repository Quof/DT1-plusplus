#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.4

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
if global.difficulty=1
{
  bulletSpeed=3
  idleWait=40
}
else if global.difficulty=2
{
  bulletSpeed=3.25
  idleWait=35
}
else if global.difficulty=3
{
  bulletSpeed=3.5
  idleWait=30
}
else if global.difficulty=4
{
  bulletSpeed=3.75
  idleWait=25
}
currentSpd=0
idleTime=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  idleTime-=1
  if idleTime<=0
  {
    if idleTime=0
    {
      if x>oPlayer1.x
        image_xscale=-1
      else
        image_xscale=1
      currentSpd=bulletSpeed
      direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    }
    currentSpd-=0.02
    if currentSpd<=1
    {
      currentSpd=0
      idleTime=idleWait
    }
  }
  speed=currentSpd
}
else
  speed=0
#define Collision_oPhalPlatform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_above(ef_smoke,other.x+8,other.y+14,1,c_gray)
with other
  instance_destroy()
oPhalLarms.energyBallTime=0
instance_destroy()
