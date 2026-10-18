#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if x>=oPlayer1.x
  xVel=2.5
else
  xVel=-2.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //yVel+=0.3
  yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionBottom(1)
    yVel=-5
  //if isCollisionLeft(1)
  //  xVel*=-1
  //if isCollisionRight(1)
  //  xVel*=-1
  //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
  if isCollisionLeftEdit(1)
    xVel*=-1
  if isCollisionRightEdit(1)
    xVel*=-1
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  //if isCollisionSolid()
  if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
    y-=2
  if y>room_height+24
    instance_destroy()
}
