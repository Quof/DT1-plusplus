/*
This script is used for NPC characters.
It will make the npc walk/stand randomly.
*/
if bStandOnly=false
{
  if bWalking=true
  {
    if image_xscale=1
      xVel=runAcc
    else
      xVel=-runAcc
    if walkingTime<=0
    {
      image_speed=0
      image_index=0
      xVel=0
      //walkingTime=round(random(120)+30)
      walkingTime=round(random(120)+30)+1-gDeltaTime //60fps change: counts down 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count down), so the count starts that much higher (the same at 30fps)
      bWalking=false
    }
    else
      //walkingTime-=1
      walkingTime-=gDeltaTime //60fps change: counts 30fps ticks
  }
  else
  {
    if walkingTime<=0
    {
      if round(random(10))>=6
        image_xscale=1
      else
        image_xscale=-1
      image_speed=0.2
      //walkingTime=round(random(150)+90)
      walkingTime=round(random(150)+90)+1-gDeltaTime //60fps change: see above
      bWalking=true
    }
    else
      //walkingTime-=1
      walkingTime-=gDeltaTime //60fps change: counts 30fps ticks
  }
}

if x<0
{
  xVel=0
  x=0
}
else if x>room_width
{
  xVel=0
  x=room_width
}

//yVel+=0.2
yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
if isCollisionBottom(1)
  yVel=0
if isCollisionLeft(1)
  xVel=runAcc
if isCollisionRight(1)
  xVel=-runAcc
//moveTo(xVel,yVel)
moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
//if isCollisionSolid()
if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
  y-=2
