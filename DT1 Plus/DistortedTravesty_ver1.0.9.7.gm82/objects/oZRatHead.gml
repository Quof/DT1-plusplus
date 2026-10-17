#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-31,7,-1)
image_speed=0.17

//Enemy base statistics
eName="Rat Head"
maxLife=100
life=maxLife
expWorth=300
physicalPower=450
physicalDefense=100
spiritPower=350
spiritDefense=150
skillResist=50
baseItemChance=25
dropInd=-15
moneyWorth=110
if global.difficulty=1
  runAcc=3.2
else if global.difficulty=2
  runAcc=3.7
else if global.difficulty=3
  runAcc=4.2
else if global.difficulty=4
  runAcc=4.9
runAcc+=random(1)
init=0
difficultyAdjustments(global.difficulty)
combatText="All they do is run straight in one directionn ,nothing else. They also drain a little bit of Spirit and Elemental Energy if they hit you."
sideText="These could be bad when used in the right areas. For some reason, these along with the Iron Knuckles were very memorable enemies."
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
    if init=0
    {
      if x>oCharacter.x
        xVel=-runAcc
      else
        xVel=runAcc
      init=1
    }
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
      y-=2

    if y>room_height+30
      instance_destroy()
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
  oPlayer1.spiritEnergy-=50
  oPlayer1.fireEnergy-=50
  oPlayer1.waterEnergy-=50
  oPlayer1.windEnergy-=50
  oPlayer1.earthEnergy-=50
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
