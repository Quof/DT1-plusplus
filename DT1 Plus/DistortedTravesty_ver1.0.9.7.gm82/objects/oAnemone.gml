#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-12,-34,12,-1)
image_speed=0.25

//Enemy base statistics
eName="Anemone"
maxLife=1400
life=maxLife
expWorth=2900
physicalPower=450
physicalDefense=180
spiritPower=480
spiritDefense=150
WATERresist=-50
WINDresist=50
EARTHresist=100
baseItemChance=75
dropInd=-20
moneyWorth=190
if global.difficulty=1
{
  shootWait=65
  sprayWait=140
  sprayAmt=3
}
else if global.difficulty=2
{
  shootWait=55
  sprayWait=130
  sprayAmt=4
}
else if global.difficulty=3
{
  shootWait=45
  sprayWait=120
  sprayAmt=5
}
else if global.difficulty=4
{
  shootWait=40
  sprayWait=115
  sprayAmt=6
}
shootTime=15
sprayTime=25
difficultyAdjustments(global.difficulty)
combatText="These are immobile, but have 2 attacks. One is a gravity based spit projectile, the other are gravity based worms. Bleh, either kill them quickly or avoid them."
sideText="Really ugly isn't it? I don't have any additional comments for these things. They're annoying in the forest though because they hide a lot."
cripplePointText=">Fire Fused Thrust Attack#>Fire Fused Downward Strike"
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
    if sprayTime<sprayWait-11
    {
      shootTime+=1
      if shootTime<shootWait-10 and shootTime>6
      {
        sprite_index=sAnemoneIdle
        image_speed=0.25
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }
      if shootTime=shootWait-10
      {
        sprite_index=sAnemoneSide
        image_speed=0
        image_index=0
      }
      else if shootTime=shootWait-5
        image_index=1
      else if shootTime>=shootWait
      {
        image_index=2
        if image_xscale=1
          offsetShotX=11
        else
          offsetShotX=-11
        newAttack=instance_create(x+offsetShotX,y-12,oShotzoBullet)
        newAttack.sprite_index=sFlyingDemonPoop
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.elementType=4
        newAttack.yVel=-random(1)-1.5
        newAttack.xVel=7*image_xscale
        newAttack.image_xscale=image_xscale
        shootTime=0
      }
    }
    //spew maggots
    if shootTime<shootWait-11
    {
      sprayTime+=1
      if sprayTime=sprayWait-10
      {
        sprite_index=sAnemoneTop
        image_speed=0
        image_index=0
      }
      else if sprayTime=sprayWait-5
          image_index=1
      else if sprayTime=sprayWait
      {
        for(i=0;i<sprayAmt;i+=1)
        {
          var xRan;
          xRan=(x-4)+random(8)
          newAttack=instance_create(xRan,y-26,oShotzoBullet)
          newAttack.sprite_index=sAnemoneMaggot
          newAttack.damageType="SPIRIT"
          newAttack.spiritPower=spiritPower
          newAttack.elementType=4
          newAttack.xVel=random_range(-4.25,4.25)
          newAttack.yVel=random_range(-6,-2)-(i/4)
        }
      }
      if sprayTime>=sprayWait+10
      {
        sprayTime=0
        if shootTime<shootWait-15
          shootWait+=5
      }
    }

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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB and other.elementType=1
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=1
    inflictStatus(0)
}
