#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-13,-23,13,-1)
image_speed=0.4

//Enemy base statistics
eName="Red Skull"
maxLife=900
life=maxLife
expWorth=2150
physicalPower=430
physicalDefense=170
spiritPower=450
spiritDefense=180
FIREresist=-20
WATERresist=20
WINDresist=100
EARTHresist=-60
skillResist=5
baseItemChance=60
dropInd=-20
moneyWorth=150
if global.difficulty=1
  reShootTime=65
else if global.difficulty=2
  reShootTime=55
else if global.difficulty=3
  reShootTime=45
else if global.difficulty=4
  reShootTime=35
shootTime=20
bCanDealDamage=false
difficultyAdjustments(global.difficulty)
combatText="These aren't mobile, but they have the ability to spit fire fairly quickly. One interesting fact, they cannot hurt you if their mouth is closed."
sideText="Just an ugly dragon skull ripped from Castlevania. You know, there are a lot of clashing graphics here."
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
  if shootTime<reShootTime-11
    image_index=0
  else
    if dieFade=0
      bCanDealDamage=true
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if shootTime<reShootTime-11 and shootTime>6
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    if shootTime>=reShootTime
    {
      if image_xscale=1
        offsetShotX=4
      else
        offsetShotX=-4
      newAttack=instance_create(x+offsetShotX,y-14,oSkullFire)
      newAttack.spiritPower=spiritPower
      newAttack.bulletSpeed=8.5
      if image_xscale=1
        newAttack.direction=0
      else
        newAttack.direction=180
      shootTime=0
      bCanDealDamage=false
    }
    else
      shootTime+=1

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)

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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=4
{
  inflictStatus(0)
}
