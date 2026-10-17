#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
makeActive()
setCollisionBounds(-4,-7,4,7)
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
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

  if isCollisionSolid()
    y-=2
  if global.doorKeys[objectNum]=1
    instance_destroy()
  if y>room_height+24
    instance_destroy()
}
#define Collision_oCharacter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Key script.
objectNum relates to which global flag to write to.
*/
playSound(global.snd_SkillCapsule,0,1)
global.p1Keys+=1
global.doorKeys[objectNum]=1
instance_destroy()
