#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(1,0,sprite_width,sprite_height)
moving=0

findTargetX=0
findTargetY=0
drawRangeX=512
drawRangeY=384
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("bStart")
{
  xVel=moveSpeedX
  yVel=moveSpeedY
  moving=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the character stands on the platform, move the platform continuously
if global.gamePaused=false
{
  if isCollisionCharacterTop(1) and moving=false
  {
    xVel=moveSpeedX
    yVel=moveSpeedY
    moving=true
  }
  if x<-128
    instance_destroy()
  else if x>room_width+128
    instance_destroy()
  else if y<-128
    instance_destroy()
  else if y>room_height+128
    instance_destroy()
}
#define Collision_oPhalanxBody
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect_create_above(ef_smoke,x+8,y+14,1,c_gray)
instance_destroy()
