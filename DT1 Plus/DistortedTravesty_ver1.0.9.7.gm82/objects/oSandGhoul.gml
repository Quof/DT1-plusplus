#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-14,-28,14,-1)
sprite_index=sSandGhoulRise
image_speed=0
visible=false

//Enemy base statistics
eName="Sand Ghoul"
maxLife=600
life=maxLife
expWorth=1700
damageType="SPIRIT"
physicalPower=400
physicalDefense=145
spiritPower=450
spiritDefense=165
FIREresist=-50
WATERresist=-25
WINDresist=50
EARTHresist=100
skillResist=10
elementType=4
baseItemChance=45
dropInd=-5
moneyWorth=120
bInflictSpiritDrain=true
if global.difficulty=1
  runAcc=1
else if global.difficulty=2
  runAcc=1.2
else if global.difficulty=3
  runAcc=1.4
else if global.difficulty=4
  runAcc=1.7
difficultyAdjustments(global.difficulty)
detectDistX=128
bCanDealDamage=false
bCanTakeDamage=false
combatText="Moves very slow and isn't very smart. It is heavily resistant to earth attacks and inflicts Spirit Drain on contact. Also deals Earth damage."
sideText="These are probably past adventurers trying to find lost treasures in this place."
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
    if sprite_index=sSandGhoulWalk
    {
      detectDistX=320
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
    }
    else if sprite_index=sSandGhoulRise
    {
      visible=true
      image_speed=0.1
      if image_index>=3
      {
        sprite_index=sSandGhoulWalk
        image_speed=0.17
        bCanDealDamage=true
        bCanTakeDamage=true
      }
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

    if y>room_height+30
      instance_destroy()
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
