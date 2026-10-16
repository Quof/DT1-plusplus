#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
damageType="SPIRIT"
elementType=4
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
returnProg=0
returnTime=50
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_angle-=12
  speed=throwSpeed
  if returnProg=0
  {
    returnTime-=1
    if returnTime<=0
      returnProg=1
  }
  else if returnProg=1 //slight wait
  {
    returnTime+=1
    if returnTime>=10
      returnProg=2
  }
  else if returnProg=2 //return to sender
  {
    direction=point_direction(x,y,returnID.x+xAdjust,returnID.y+yAdjust)
    if point_distance(x,y,returnID.x+xAdjust,returnID.y+yAdjust)<16
      instance_destroy()
  }
}
else
  speed=0
