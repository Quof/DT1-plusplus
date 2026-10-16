#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-8,-19,9,-1)
image_speed=0.75

//Enemy base statistics
eName="Wisp"
maxLife=50
life=maxLife
expWorth=1000
physicalPower=450
physicalDefense=100
spiritPower=450
spiritDefense=150
FIREresist=100
WATERresist=-100
WINDresist=-50
bCanTakeDamage=false
baseItemChance=75
moneyWorth=150
detectDistX=320
detectDistY=320
if global.difficulty=1
{
  xVel=1.8
  yVel=1.8
}
else if global.difficulty=2
{
  xVel=2
  yVel=2
}
else if global.difficulty=3
{
  xVel=2.7
  yVel=2.7
}
else if global.difficulty=4
{
  xVel=3.5
  yVel=3.5
}
if x>oPlayer1.x
  xVel*=-1
if random(10)>=5
  yVel*=-1
difficultyAdjustments(global.difficulty)
combatText="Nothing seems to damage these things. All they do is bounce around the room and are just annoying. They also syphon some Spirit and Elemental Energy."
sideText="These are annoying enough in the top-down Zelda games, but here I imagine they're even worse."
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
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if isCollisionBottom(1)
      yVel*=-1
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionTop(1)
      yVel*=-1

    //keep inside room
    if y<0
      yVel*=-1
    if y>room_height
      yVel*=-1
    if x<0
      xVel*=-1
    if x>room_width
      xVel*=-1
    moveTo(xVel,yVel)
  }
  enemyStepEvent()
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oPlayer1.bCanTakeHit=true and oPlayer1.dashInvulnerabilityTime=0 and oPlayer1.jumpSlashPower<=49 and oPlayer1.bRaveActive=false and stunnedTime=0 and dieFade=0
{
  oPlayer1.spiritEnergy-=200
  oPlayer1.fireEnergy-=100
  oPlayer1.waterEnergy-=100
  oPlayer1.windEnergy-=100
  oPlayer1.earthEnergy-=100
  if oPlayer1.spiritEnergy<0
    oPlayer1.spiritEnergy=0
  if oPlayer1.fireEnergy<0
    oPlayer1.fireEnergy=0
  if oPlayer1.waterEnergy<0
    oPlayer1.waterEnergy=0
  if oPlayer1.windEnergy<0
    oPlayer1.windEnergy=0
  if oPlayer1.earthEnergy<0
    oPlayer1.earthEnergy=0
}
event_inherited()
