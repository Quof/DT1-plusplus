#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-7,-7,7,7)

//Enemy base statistics
damageType="SPIRIT"
elementType=1
throwSpeed=8
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
init=0
dirChange=90
decayTime=0
if global.difficulty=1
  decayTimeMax=120
else if global.difficulty=2
  decayTimeMax=140
else if global.difficulty=3
  decayTimeMax=160
else if global.difficulty=4
  decayTimeMax=180
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
    xVel=random(4)
    if round(random(10))>=6
      xVel*=-1
    yVel=random(3)-6
    init=1
  }
  image_angle+=15
  if type>=0 and type<=1
  {
    yVel+=0.2
    if type=0 //fall
    {
      if isCollisionBottom(1)
        instance_destroy()
      if isCollisionLeft(1)
        instance_destroy()
      if isCollisionRight(1)
        instance_destroy()
    }
    else if type=1 //bounce around
    {
      if isCollisionBottom(1)
        yVel*=-1
      if isCollisionLeft(1)
        xVel*=-1
      if isCollisionRight(1)
        xVel*=-1
      if isCollisionTop(1)
        yVel*=-1
    }
    moveTo(xVel,yVel)
  }
  decayTime+=1
  if decayTime>=decayTimeMax
    instance_destroy()
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
