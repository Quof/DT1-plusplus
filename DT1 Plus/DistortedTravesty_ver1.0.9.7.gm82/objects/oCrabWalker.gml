#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-18,-28,18,-1)
image_speed=0.25

//Enemy base statistics
eName="Crab Walker"
maxLife=200
life=maxLife
expWorth=15
physicalPower=100
physicalDefense=30
FIREresist=-10
WATERresist=-5
WINDresist=90
EARTHresist=-70
noMoneyBonus=true
baseItemChance=40
dropInd=-25
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
  runAcc=0.45
else if global.difficulty=2
  runAcc=0.6
else if global.difficulty=3
  runAcc=0.75
else if global.difficulty=4
  runAcc=0.95
difficultyAdjustments(global.difficulty)
combatText="A slow moving crab bot. They're armed with absolutely nothing except a hard shell. They really have nothing going for them. Earth based attacks in particular can hurt them bad."
sideText="I never understood why anyone would make a crab robot. Seriously, it's like some kind of cruel joke. Luckily these things are only robots because I can only imagine the shame and anguish they would feel if they had feelings."
cripplePointText=">Earth Fused Downward Strike"
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
    if x>oCharacter.x
    {
      image_xscale=-1
      xVel=-runAcc
    }
    else
    {
      image_xscale=1
      xVel=runAcc
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=2

    if y>room_height+30
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=4
{
  inflictStatus(0)
}
