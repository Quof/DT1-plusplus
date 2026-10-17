#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-10,-10,10,10)
image_speed=0
//Enemy base statistics
eName="Kouker Q"
maxLife=320
life=maxLife
expWorth=450
physicalPower=270
physicalDefense=100
spiritDefense=100
baseItemChance=65
dropInd=-10
moneyWorth=90
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  reSlamTime=60
  slamSpeed=10
}
else if global.difficulty=2
{
  reSlamTime=50
  slamSpeed=11
}
else if global.difficulty=3
{
  reSlamTime=40
  slamSpeed=12
}
else if global.difficulty=4
{
  reSlamTime=30
  slamSpeed=13
}
frameSpeed=0
moveSpeed=3
if variable_local_exists("rev")
  moveSpeed=-3
turnTime=0
slamTime=reSlamTime
bSlamDown=false
bReturn=false
stayTime=0
normalPower=physicalPower
slamPower=round(physicalPower*1.2)
difficultyAdjustments(global.difficulty)
combatText="It flys slowly around and the instant it detects you under it, it stalls its engine, folds its propeller, reveals its spikes underneath, and dives like a heavy weight. Luckily its spikes won't 1-hit kill you.#First Appearance: Mega Man 5"
sideText="What a machine to build. The material used must be amazing if it can withstand all that impact... well maybe not actually. Considering these things are destroyed so fast and the creators most likely know this fact, the material probably isn't all that great. It won't have to go through that many impacts with the ground.##Did you know that its name is derived from the Japanese word 'Kyuukouka', which roughly means 'nose dive'?"
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if image_index=3
    physicalPower=slamPower
  else
    physicalPower=normalPower
  if bActive=true and dieFade=0
  {
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //animation
    //frameSpeed+=1
    frameSpeed+=gDeltaTime //60fps change: counts 30fps ticks
    //if frameSpeed mod 4=0 and bSlamDown=false
    if scrModPass(frameSpeed,4) and bSlamDown=false //60fps change: once each time the count reaches a multiple of it
    {
      if image_index=0
        image_index=1
      else if image_index=1
        image_index=0
    }
    //if frameSpeed=40 and bSlamDown=false
    if frameSpeed>=40 and bSlamDown=false //60fps change: >= so it still resets if the frame rate changes mid-count
      frameSpeed=0

    if bSlamDown=false and stayTime=0 and bReturn=false //roam
    {
      //turnTime+=1
      turnTime+=gDeltaTime //60fps change: counts 30fps ticks
      xVel=moveSpeed
      //if turnTime mod 45=0
      if scrModPass(turnTime,45) //60fps change: once each time the count reaches a multiple of it
        moveSpeed*=-1
    }
    else if bReturn=true and stayTime=0 //return (fly up)
    {
      //y-=3
      y-=3*gDeltaTime //60fps change: per 30fps tick
      if y<ystart
      {
        frameSpeed=0
        turnTime=0
        slamTime=0
        image_index=0
        bSlamDown=false
        bReturn=false
      }
    }
    else if stayTime>0 //stay on ground
      //stayTime-=1
      stayTime=max(0,stayTime-gDeltaTime) //60fps change: counts 30fps ticks (stops at 0: it's checked for =0)

    //slam down
    //slamTime+=1
    slamTime+=gDeltaTime //60fps change: counts 30fps ticks
    if slamTime>=reSlamTime and bReturn=false
    {
      xDist=point_distance(x,0,oPlayer1.x,0)
      if xDist<56
      {
        xVel=0
        bSlamDown=true
      }
      if bSlamDown=true
      {
        if frameSpeed<100
        {
          frameSpeed=200
          image_index=2
        }
        //else if frameSpeed=206
        else if scrCountPass(frameSpeed,206) //60fps change: once, when the count reaches it
          image_index=3
        else if frameSpeed>=212
          yVel=slamSpeed
      }
    }

    if isCollisionBottom(1) and bReturn=false
    {
      yVel=0
      stayTime=30
      bReturn=true
    }
    //if isCollisionLeft(1)
    if isCollisionLeft(1) and (gDeltaTime==1 or moveSpeed<0) //60fps change: above 30fps, only turn around when moving into the wall (it can still touch it on the next frame)
    {
      turnTime=0
      moveSpeed*=-1
    }
    //if isCollisionRight(1)
    if isCollisionRight(1) and (gDeltaTime==1 or moveSpeed>0) //60fps change: see above
    {
      turnTime=0
      moveSpeed*=-1
    }
    if isCollisionSolid()
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
