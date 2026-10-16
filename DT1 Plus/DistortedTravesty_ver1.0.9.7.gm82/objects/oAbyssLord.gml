#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-35,40,35)
image_speed=0

//Enemy base statistics
eName="Abyss Lord"
maxLife=9000
life=maxLife
expWorth=10000
physicalPower=200
physicalDefense=90
spiritPower=230
spiritDefense=100
FIREresist=-50
WATERresist=30
WINDresist=70
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
laserTime=0
fireballTime=0
specialAttack=0
if global.difficulty=1
{
  laserDelay=210
  fireballDelay=290
  fireballShotTime=25
  fireFreq=7
}
else if global.difficulty=2
{
  laserDelay=180
  fireballDelay=250
  fireballShotTime=30
  fireFreq=6
}
else if global.difficulty=3
{
  laserDelay=150
  fireballDelay=210
  fireballShotTime=35
  fireFreq=5
}
else if global.difficulty=4
{
  laserDelay=140
  fireballDelay=180
  fireballShotTime=45
  fireFreq=4
}
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Fireball"

xCenter=304
yGround=288
roomSpan=240
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="It's got two attacks that you can see coming if you watch his mouth closely. If he opens it a little, he is going to fire his lasers at you from his eyes. If he opens his mouth wide, he's going to fire a volley of fireballs at you. Dodge around to keep away, or summon up a rock and hide in the corner."
    sideText="This is an impressive wave of Dark Energy to be able to work something like this. Seems like The Darkness really wants these Muffins now. I have no doubt that you can stomp this thing's ass in the dirt though, just watch him carefully."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if currentAttack=0
    {
      laserTime+=1
      fireballTime+=1
    }
    image_index=currentAttack
    if laserTime>=laserDelay and currentAttack!=2 //laser attack
    {
      if currentAttack=0
      {
        laserTime=1000
        currentAttack=1
      }
      laserTime+=1
      if laserTime>=1030
      {
        laserAttackR=instance_create(x+9,y+10,oLaserB)
        laserAttackR.spiritPower=spiritPower
        laserAttackR.damageType="SPIRIT"
        laserAttackR.direction=point_direction(x+9,y+10,oPlayer1.x,oPlayer1.y-22)
        laserAttackR.bulletSpeed=6
        laserAttackL=instance_create(x-9,y+10,oLaserB)
        laserAttackL.spiritPower=spiritPower
        laserAttackL.damageType="SPIRIT"
        laserAttackL.direction=point_direction(x-9,y+10,oPlayer1.x,oPlayer1.y-22)
        laserAttackL.bulletSpeed=6
        laserTime=0
        currentAttack=0
      }
    }
    if fireballTime>=fireballDelay and currentAttack!=1 //fireball attack
    {
      if currentAttack=0
      {
        fireballTime=1000
        currentAttack=2
      }
      fireballTime+=1
      if fireballTime>=1030
      {
        if fireballTime mod fireFreq=0
        {
          fireAttack=instance_create(x,y-7,oALfireball)
          fireAttack.spiritPower=spiritPower
          fireAttack.throwSpeed=7
        }
        if fireballTime>=1030+fireballShotTime
        {
          fireballTime=0
          currentAttack=0
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      laserDelay-=4
      fireballDelay-=5
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      laserDelay-=4
      fireballDelay-=5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
      {
        laserDelay-=8
        fireballDelay-=12
        fireballShotTime+=10
      }
      else
      {
        laserDelay-=4
        fireballDelay-=6
        fireballShotTime+=5
      }
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
      {
        fireFreq-=1
        laserDelay-=8
        fireballDelay-=12
      }
      else
      {
        laserDelay-=4
        fireballDelay-=6
      }
      fireballShotTime+=10
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL"
{
  inflictStatus(0)
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if laserTime<laserDelay
    laserTime-=round((stunnedTime/2))
  if fireballTime<fireballDelay
    fireballTime-=round((stunnedTime/2))
}
