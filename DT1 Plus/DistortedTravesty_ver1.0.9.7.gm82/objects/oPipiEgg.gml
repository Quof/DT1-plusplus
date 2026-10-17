#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-6,1,6,9)
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
weight=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and dieFade=0
  {
    //yVel+=0.5
    yVel=scrGravAcc(yVel,0.5,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      for(i=0;i<4;i+=1)
      {
        var xLoc,yLoc;
        if i=0
        {
          xLoc=x-16
          yLoc=y-16
        }
        else if i=1
        {
          xLoc=x+16
          yLoc=y-16
        }
        else if i=2
        {
          xLoc=x-16
          yLoc=y+16
        }
        else if i=3
        {
          xLoc=x+16
          yLoc=y+16
        }
        childPipi=instance_create(xLoc,yLoc,oChildPipi)
        childPipi.bActive=true
        //childPipi.direction=i*90
        childPipi._direction=i*90 //60fps change: _direction instead of GM's direction (oChildPipi)
      }
      instance_destroy()
    }
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
