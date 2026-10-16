#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)

//Enemy base statistics
damageType="SPIRIT"
if global.difficulty=1
  throwSpeed=4
else if global.difficulty=2
  throwSpeed=5
else if global.difficulty=3
  throwSpeed=6
else if global.difficulty=4
  throwSpeed=7
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if init=0
  {
    if type=0
      decayTime=30+(throwDelay*3)
    else if type=1
    {
      bCanDealDamage=true
      decayTime=90
    }
    init=1
  }
  if type=0
  {
    throwDelay-=1
    if throwDelay=0
    {
      direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      bCanDealDamage=true
    }
  }

  if throwDelay<=0
  {
    if throwSpeed<12
      throwSpeed+=0.25
    speed=throwSpeed
  }

  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
else
  speed=0
