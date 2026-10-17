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
    //moveTo(throwSpeed*cos(degtorad(dir)),-throwSpeed*sin(degtorad(dir)))
    moveTo(throwSpeed*cos(degtorad(dir))*gDeltaTime,-throwSpeed*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  else
  {
    if image_blend=c_white
    {
      image_blend=c_black
      spiritPower-=20
      size=2
    }
    //image_angle-=30
    image_angle-=30*gDeltaTime //60fps change: per 30fps tick
    //image_xscale+=growSpeed
    image_xscale+=growSpeed*gDeltaTime //60fps change: per 30fps tick
    //image_yscale+=growSpeed
    image_yscale+=growSpeed*gDeltaTime //60fps change: per 30fps tick
    //image_alpha-=0.02
    image_alpha-=0.02*gDeltaTime //60fps change: per 30fps tick
    //spiralTime+=1
    spiralTime+=gDeltaTime //60fps change: counts 30fps ticks
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
