#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-14,-14,14,14)

//Enemy base statistics
damageType="SPIRIT"
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
init=0
spiralTime=0
if global.difficulty=1
  growSpeed=0.1
else if global.difficulty=2
  growSpeed=0.12
else if global.difficulty=3
  growSpeed=0.13
else if global.difficulty=4
  growSpeed=0.15
wallHit=false
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
    dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
    init=1
  }
  if wallHit=false
  {
    if isCollisionBottom(1)
      wallHit=true
    if isCollisionLeft(1)
      wallHit=true
    if isCollisionRight(1)
      wallHit=true
    if isCollisionTop(1)
      wallHit=true
    moveTo(throwSpeed*cos(degtorad(dir)),-throwSpeed*sin(degtorad(dir)))
  }
  else
  {
    if image_blend=c_white
    {
      image_blend=c_black
      spiritPower-=20
      size=2
    }
    image_angle-=30
    image_xscale+=growSpeed
    image_yscale+=growSpeed
    image_alpha-=0.02
    spiralTime+=1
    if spiralTime>=20
      instance_destroy()
  }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
