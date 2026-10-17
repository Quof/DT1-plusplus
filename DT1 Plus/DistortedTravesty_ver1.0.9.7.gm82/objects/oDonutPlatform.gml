#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(0,0,sprite_width,sprite_height)

//variables for the donut platform
grav=1                          //how fast it falls
returnAfterPeriodOfTime=180     //number of steps until it returns after it falls (set to 0 to make it never return)
timeUntilFall=20                //how long the character can stand on this until it falls
timeUntilFallMax=20             //the max value for timeUntilFall
falling=0                       //is the platform falling
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the character's falling
//if global.gamePaused=false
if global.gamePaused=false and gDeltaDoTicks //60fps change: its logic runs once per 30fps tick (every frame at 30fps), on the tick's last frame: the platform engine (gameStepEvent) reads xVel/yVel once a tick and makes the tick's move over the frames, so here it's where it is at 30fps
{
  if falling
  {
    yAcc=grav
    returnAfterPeriodOfTime-=1
    if returnAfterPeriodOfTime=0
    {
      instance_create(xstart,ystart,oDonutPlatformStart)  
    }
  }
  else
  {
    //if the character is standing on the platform, subtract one from the timer
    if isCollisionCharacterTop(1)
    {
      timeUntilFall-=1
      //also, check to see if it is <= 0
      if timeUntilFall<=0
        falling=1
    }
    else
    {
      if timeUntilFall<timeUntilFallMax
        timeUntilFall+=1
    }
  }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if returnAfterPeriodOfTime<=0
  instance_destroy()
