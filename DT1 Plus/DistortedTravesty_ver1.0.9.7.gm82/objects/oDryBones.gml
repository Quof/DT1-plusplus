#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-8,-38,8,-1)
image_speed=0.1

//Enemy base statistics
eName="Dry Bones"
maxLife=390
life=maxLife
expWorth=120
physicalPower=130
physicalDefense=32
spiritDefense=36
FIREresist=-35
WINDresist=90
EARTHresist=-40
skillResist=5
baseItemChance=50
moneyWorth=8
initDir=0
throwTime=0
if global.difficulty=1
{
  runAcc=0.75
  throwDelay=70
}
else if global.difficulty=2
{
  runAcc=1
  throwDelay=55
}
else if global.difficulty=3
{
  runAcc=1.3
  throwDelay=40
}
else if global.difficulty=4
{
  runAcc=1.55
  throwDelay=25
}
difficultyAdjustments(global.difficulty)
combatText="Despite being nothing but bones, they are fairly durable. The main thing you need to watch out for is their bone throw attack. They like to spam that at times. Earth and Fire seems to be their weakness. They also don't get back up like you're used to."
sideText="I always did like the castle stages. They gave a sense of danger and suspense I found missing from some games."
cripplePointText=">Downward Strike"
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
    if throwTime>=throwDelay
      image_index=0
    if initDir=false
    {
      if x>oPlayer1.x
        xVel=-runAcc
      else
        xVel=runAcc
      initDir=true
    }
    //throwTime+=1
    throwTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if throwTime>=throwDelay
    if throwTime>throwDelay-1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps; with >= it walked half a tick more each cycle)
    {
      xVel=0
      if throwTime>=throwDelay+(throwDelay/5)
      {
        if image_xscale=1
          offsetShotX=4
        else
          offsetShotX=-4
        newAttack=instance_create(x+offsetShotX,y-14,oDBBone)
        newAttack.physicalPower=physicalPower
        newAttack.bulletSpeed=3
        if image_xscale=1
          //newAttack.direction=0
          newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        else
          //newAttack.direction=180
          newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        throwTime=0
        initDir=false
      }
    }
    else
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1

    if xVel>0
      image_xscale=1
    else if xVel<0
      image_xscale=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
      y-=2
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
{
  inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if throwTime>=throwDelay and dieFade=0
{
  if image_xscale=1
    offsetBoneX=-4
  else
    offsetBoneX=4
  draw_sprite(sDBBone,-1,x+offsetBoneX,y-20)
}
