#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-15,-15,15,15)

//Enemy base statistics
physicalPower=450
bCanTakeDamage=false
bShowHealthBar=false
seekSpeed=10
seekTime=0
seekDelay=20
bReturning=false
bTargetFound=false
detectDistX=44
detectDistY=288

difficultyAdjustments(global.difficulty)
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.location="Black Rock Fortress"
{
  physicalPower+=200
  seekSpeed+=1
  sprite_index=sBRFCrushingSpike
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  //start movement in Player's direction (down)
  if bActive=true and y<oPlayer1.y
  {
    if bTargetFound=false
    {
      yVel=seekSpeed
      bTargetFound=true
      seekTime=seekDelay
    }
  }
  if seekTime>0
  {
    seekTime-=1
    if isCollisionBottom(1)
    {
      bReturning=true
      yVel/=-3
    }
    if seekTime=0 and bReturning=false
    {
      bReturning=true
      yVel/=-3
    }
  }
  moveTo(xVel,yVel)

  //Return to original position
  if bReturning=true
  {
    if y<=ystart
    {
      y=ystart
      yVel=0
      bTargetFound=false
      bReturning=false
      bActive=false
    }
  }
}
