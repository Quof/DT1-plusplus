#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-10,-44,10,-1)
image_speed=0.1

//Enemy base statistics
eName="Bone Skeleton"
maxLife=360
life=maxLife
expWorth=165
physicalPower=145
physicalDefense=40
spiritPower=170
spiritDefense=50
FIREresist=-25
WINDresist=80
EARTHresist=-50
baseItemChance=65
dropInd=-5
moneyWorth=9
if global.difficulty=1
{
  runAcc=1.7
  reShootTime=80
}
else if global.difficulty=2
{
  runAcc=2
  reShootTime=70
}
else if global.difficulty=3
{
  runAcc=2.3
  reShootTime=60
}
else if global.difficulty=4
{
  runAcc=2.55
  reShootTime=45
}
if round(random(10))>=5
  runAcc*=-1
xVel=runAcc
shootTime=10
walkTime=0
walkChange=round(random(25)+40)
difficultyAdjustments(global.difficulty)
combatText="This is a pretty standard enemy. It moves around back and forth in it's initial area and will sometimes throw bones at you. Like other skeleton type enemies, it's weak against Earth based attacks and strong against Wind attacks. The bones they throw can be a little rough since they go through walls and arc."
sideText="I thought some of these couldn't throw bones. Eh, whatever.##Yeah, that's all for my comments on this. I'm feeling boring so just go kick it's ass."
cripplePointText=">Fire Fused Downward Strike"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    //walkTime+=1
    walkTime+=gDeltaTime //60fps change: counts 30fps ticks
    if walkTime>=walkChange
    {
      runAcc*=-1
      xVel=runAcc
      walkTime=0
      walkChange=round(random(25)+40)
    }
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if shootTime=reShootTime-22
    if scrCountPass(shootTime,reShootTime-22) //60fps change: once, when the count reaches it
    {
      xVel=0
      sprite_index=sBoneSkeletonThrow
      image_index=0
    }
    //if shootTime=reShootTime
    if scrCountPass(shootTime,reShootTime) //60fps change: once, when the count reaches it
    {
      newAttack=instance_create(x,y-40,oCBone)
      newAttack.spiritPower=spiritPower
      newAttack.bulletSpeed=8
      if x>=oPlayer1.x
        newAttack.dir=1
      else
        newAttack.dir=0
    }
    //if shootTime=reShootTime+5
    if shootTime>=reShootTime+5 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
    {
      xVel=runAcc
      if round(random(10))>=5
        runAcc*=-1
      sprite_index=sBoneSkeletonWalk
      shootTime=0
    }
    if x>oCharacter.x
      image_xscale=-1
    else
      image_xscale=1
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=1
{
  inflictStatus(0)
}
