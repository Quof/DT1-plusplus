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
  //image_angle+=15
  image_angle+=15*gDeltaTime //60fps change: per 30fps tick
  if type>=0 and type<=1
  {
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
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
    }
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  //decayTime+=1
  decayTime+=gDeltaTime //60fps change: counts 30fps ticks
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
