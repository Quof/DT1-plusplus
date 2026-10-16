#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spawnDir=0
spawnTime=0
findTargetX=0
findTargetY=0
detectDistX=32
detectDistY=room_height
inactiveDist=room_width
bActive=false
xOffset=0
init=0
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
    if oPlayer1.x>x //player starts from the right
      spawnDir=0
    else //player starts from the left
      spawnDir=1
    init=1
  }

  makeEnemyActive()
  if bActive=true
  {
    spawnTime+=1
    if spawnDir=0 //right
    {
      if init=1
      {
        if oPlayer1.x<x
          instance_destroy()
        init=2
      }
    }
    else if spawnDir=1 //left
    {
      if init=1
      {
        if oPlayer1.x>x
          instance_destroy()
        init=2
      }
    }

    if spawnTime mod spawnSpd=0
    {
      if spawnDir=0 //fly right
        xOffset=oPlayer1.x-(view_wview[0]/2)-random(8)
      if spawnDir=1 //fly left
        xOffset=oPlayer1.x+(view_wview[0]/2)+random(8)
      darkling=instance_create(xOffset,random_range(y1,y2),oDarkling)
      darkling.dir=spawnDir
    }
    if spawnTime>=spawnMax
      instance_destroy()
  }
}
