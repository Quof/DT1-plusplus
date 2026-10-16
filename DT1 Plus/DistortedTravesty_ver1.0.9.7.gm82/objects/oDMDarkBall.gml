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
throwSpeed=8
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
init=0
dirChange=90
decayTime=0
if global.difficulty=1
  decayTimeMax=130
else if global.difficulty=2
  decayTimeMax=170
else if global.difficulty=3
  decayTimeMax=210
else if global.difficulty=4
  decayTimeMax=250
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_angle+=5
  if type!=4
    speed=throwSpeed
  if type=1 and init=0 //towards player
  {
    direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
    init=1
  }
  else if type>=2 and type<=3
  {
    if init=0
    {
      decayTimeMax-=45
      init=1
    }
    if type=2 //spiral counter-clockwise
      direction+=dirChange
    else if type=3 //spiral clockwise
      direction-=dirChange
    if dirChange>15
      dirChange-=2
    if throwSpeed<12
      throwSpeed+=0.2
  }
  else if type=4 //bounce off walls
  {
    if init=0
    {
      if dir=0
      {
        xVel=throwSpeed/2
        yVel=throwSpeed/2
      }
      if dir=1
      {
        xVel=-throwSpeed/2
        yVel=throwSpeed/2
      }
      if dir=2
      {
        xVel=throwSpeed/2
        yVel=-throwSpeed/2
      }
      if dir=3
      {
        xVel=-throwSpeed/2
        yVel=-throwSpeed/2
      }
      decayTimeMax-=45
      init=1
    }
    if isCollisionBottom(1)
      yVel*=-1
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionTop(1)
      yVel*=-1
    moveTo(xVel,yVel)
  }
  //type 5 is 1 fixed direction
  decayTime+=1
  if decayTime>=decayTimeMax
    instance_destroy()
}
else
  speed=0
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
