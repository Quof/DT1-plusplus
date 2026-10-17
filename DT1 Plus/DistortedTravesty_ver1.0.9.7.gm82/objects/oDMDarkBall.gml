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
  //image_angle+=5
  image_angle+=5*gDeltaTime //60fps change: per 30fps tick
  if type!=4
    //speed=throwSpeed
    _speed=throwSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  if type=1 and init=0 //towards player
  {
    //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
    _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22) //60fps change: _direction stands in for direction (see correctSpeedDirection)
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
      //direction+=dirChange
      _direction+=dirChange*gDeltaTime //60fps change: turns per 30fps tick; _direction stands in for direction (see correctSpeedDirection)
    else if type=3 //spiral clockwise
      //direction-=dirChange
      _direction-=dirChange*gDeltaTime //60fps change: see above
    if dirChange>15
      //dirChange-=2
      dirChange-=2*gDeltaTime //60fps change: per 30fps tick
    if throwSpeed<12
      //throwSpeed+=0.2
      throwSpeed+=0.2*gDeltaTime //60fps change: per 30fps tick
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
    //if isCollisionBottom(1)
    if isCollisionBottom(1) and (gDeltaTime==1 or yVel>0) //60fps change: above 30fps, only bounce off what it's moving into (it can still be touching it on the next frame)
      yVel*=-1
    //if isCollisionLeft(1)
    if isCollisionLeft(1) and (gDeltaTime==1 or xVel<0) //60fps change: see above
      xVel*=-1
    //if isCollisionRight(1)
    if isCollisionRight(1) and (gDeltaTime==1 or xVel>0) //60fps change: see above
      xVel*=-1
    //if isCollisionTop(1)
    if isCollisionTop(1) and (gDeltaTime==1 or yVel<0) //60fps change: see above
      yVel*=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  //type 5 is 1 fixed direction
  //decayTime+=1
  decayTime+=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime>=decayTimeMax
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
