#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-7,-6,7,6)
image_speed=0.4

//Enemy base statistics
eName="Skull Ball"
maxLife=5000
life=maxLife
expWorth=3000
damageType="SPIRIT"
physicalPower=350
physicalDefense=100
spiritPower=450
spiritDefense=150
skillResist=50
baseItemChance=60
moneyWorth=150
detectDistX=320
detectDistY=320
bBounced=0
if global.difficulty=1
{
  xVel=1.4
  yVel=1.4
}
else if global.difficulty=2
{
  xVel=1.8
  yVel=1.8
}
else if global.difficulty=3
{
  xVel=2.2
  yVel=2.2
}
else if global.difficulty=4
{
  xVel=2.8
  yVel=2.8
}
if x>oPlayer1.x
  xVel*=-1
if random(10)>=5
  yVel*=-1
difficultyAdjustments(global.difficulty)
combatText="If you've played Zelda 2, you know all about these things. Just bounces and has a lot of life points. Oh right, they also drain a lot of Spirit Energy. They drain a tiny bit of Elemental Energy as well, but not enough to concern yourself with. The faster ones in the original game were annoying."
sideText="Everytime I stopped to kill one of these, I suddenly found myself thinking about life and my future. Seriously, they take that long to kill where you have time to reflect on your life. Sometimes I would think about the amount of time I was wasting by trying to kill them... Man, my childhood was filled with great wonderous memories."
cripplePointText=">None"
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("spdUp")
{
  xVel*=spdUp
  yVel*=spdUp
  var adjustCurve;
  adjustCurve=spdUp/5
  tempAdjust=expWorth*adjustCurve
  expWorth+=round(tempAdjust)
}
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
    bBounced=0
    if y<0
    {
      yVel*=-1
      bBounced=1
    }
    if y>room_height
    {
      yVel*=-1
      bBounced=1
    }
    if x<0
    {
      xVel*=-1
      bBounced=1
    }
    if x>room_width
    {
      xVel*=-1
      bBounced=1
    }

    //attempt to stay on screen
    if bBounced=0
    {
      if y<view_yview[0]
        yVel*=-1
      if y>view_yview[0]+view_hview[0]
        yVel*=-1
      if x<view_xview[0]
        xVel*=-1
      if x>view_xview[0]+view_wview[0]
        xVel*=-1
    }
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
  oPlayer1.spiritEnergy-=400
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
