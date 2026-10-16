#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-12,-42,12,-1)

//Enemy base statistics
eName="Skeledragon"
maxLife=550
life=maxLife
expWorth=180
physicalPower=150
physicalDefense=60
spiritPower=200
spiritDefense=70
WINDresist=90
EARTHresist=-60
skillResist=10
baseItemChance=65
dropInd=-30
moneyWorth=12
detectDistY=176
if global.difficulty=1
  reShootTime=80
else if global.difficulty=2
  reShootTime=70
else if global.difficulty=3
  reShootTime=60
else if global.difficulty=4
  reShootTime=45
shootTime=10
initShot=false
colorChangeTime=0
difficultyAdjustments(global.difficulty)
combatText="Nothing really too special with these things. You just gotta watch when they flash, because that's when they are going to blast fire at you. Their defenses are insane, I recommend crippling them or you'll be wailing on them for awhile."
sideText="When these things are in the right spot, they can be incredibly annoying. I hate it when they are placed next to bottomless pits and they shoot just as you land after a jump. I can't tell you how many times I've died because of that stuff. Man, these things tick me off and they aren't even that bad of an enemy."
cripplePointText=">Jump Strike"
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
    if shootTime>=reShootTime-15
    {
      colorChangeTime+=1
      if colorChangeTime=1
        image_blend=c_silver
      else if colorChangeTime=4
      {
        image_blend=c_white
        colorChangeTime=0
      }
      if initShot=false
      {
        if image_xscale=1
        {
          if x>=oPlayer1.x
          {
            offsetShotY=33
            shotDir=180
          }
          else
          {
            offsetShotY=14
            shotDir=0
          }
        }
        else
        {
          if x>=oPlayer1.x
          {
            offsetShotY=14
            shotDir=180
          }
          else
          {
            offsetShotY=33
            shotDir=0
          }
        }
        initShot=true
      }
    }
    if shootTime>=reShootTime
    {
      image_blend=c_white
      colorChangeTime=0
      initShot=false
      newAttack=instance_create(x,y-offsetShotY,oSkeleFire)
      newAttack.spiritPower=spiritPower
      newAttack.bulletSpeed=6
      newAttack.direction=shotDir
      shootTime=0
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

    if y>room_height+24
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_JUMP_SLASH_2
{
  inflictStatus(0)
}
