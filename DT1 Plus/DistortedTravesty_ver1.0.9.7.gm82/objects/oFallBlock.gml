#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(0,0,sprite_width,sprite_height)

//variables for the fall platform
grav=1               //how fast it falls
falling=0            //is the platform falling
timeUntilFall=20     //time till platform falls
newSprite=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.location="Distortion WTF 1" or global.location="Distortion WTF 2"
{
  newSprite=1
  image_yscale=0.5
}
else if global.location="Rumpy Mountains"
{
  newSprite=2
  image_xscale=3
}
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
    timeUntilFall-=1
    if timeUntilFall<=0
      yAcc=grav
  }
  else
  {
    //if the character stands on the platform, start the timer
    if isCollisionCharacterTop(1)
      falling=1
  }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if newSprite=0 //Gyro Man stage
  draw_background_part(tileMMgyro,80,0,16,16,x,y)
else if newSprite=1 //Distortion 3
  draw_background_part(tileDistortion3,16,128,16,8,x,y)
else if newSprite=2 //Rumpy Mountains
  draw_background_part(tileMarioOverworld2,208,32,48,16,x,y)
