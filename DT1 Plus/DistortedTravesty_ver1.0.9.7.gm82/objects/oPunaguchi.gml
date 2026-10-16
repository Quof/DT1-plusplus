#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-23,7,-1)
image_speed=0

//Enemy base statistics
eName="Punaguchi"
maxLife=175
life=maxLife
expWorth=1200
physicalPower=470
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=120
initDir=0
if global.difficulty=1
  reShootTime=40
else if global.difficulty=2
  reShootTime=35
else if global.difficulty=3
  reShootTime=30
else if global.difficulty=4
  reShootTime=25
shootTime=5
difficultyAdjustments(global.difficulty)
combatText="Just sits there and shoots cotton balls at you. What? That's what they look like!"
sideText="I hate these things. They gave me sooo much trouble in Castlevania Adventure. They were always in spots designed specifically to screw me over. Luckily you have a lot of abilities to counter the screwing-over-the-player moments that these will inevitably be placed at."
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
  if shootTime<=reShootTime-20
    image_index=0
  else if shootTime>=reShootTime-19 and shootTime<=reShootTime-10
    image_index=1
  else if shootTime>=reShootTime-9 and shootTime<=reShootTime+1
    image_index=2

  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if shootTime<reShootTime-19 and shootTime>1
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
      newAttack=instance_create(x+offsetShotX,y-16,oCannonBullet)
      newAttack.sprite_index=sD3Fire
      newAttack.physicalPower=physicalPower
      newAttack.bulletSpeed=7
      if image_xscale=1
        newAttack.direction=0
      else
        newAttack.direction=180
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
