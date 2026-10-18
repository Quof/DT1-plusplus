#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
makeActive()
setCollisionBounds(2,0,sprite_width-2,sprite_height-1)
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
    yVel=0
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  //if isCollisionSolid()
  if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
    y-=2
  if y>room_height+24
    instance_destroy()
}
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.yVel>0
{
  oPlayer1.canAirDash=1
  other.yVel=-20
  other.yVelSetExt=1 //60fps change (added): the player's speed set once: the 30fps formula for it (see pMoveToWrapNew)
  if other.attackState=other.PART_JUMP_SLASH_1
  {
    oPlayer1.attackState=0
    oPlayer1.jumpSlashPower=0
  }
  else if other.attackState=other.TECH_GRAND_SLAM
  {
    oPlayer1.attackState=0
    oPlayer1.jumpSlashPower=0
  }
}
