#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1

//Enemy base statistics
eName="Train Turret"
maxLife=650
life=maxLife
expWorth=570
physicalDefense=90
spiritPower=250
spiritDefense=125
WATERresist=-15
WINDresist=90
EARTHresist=-75
skillResist=10
baseItemChance=50
dropInd=-5
moneyWorth=50
bCanDealDamage=false
if global.difficulty=1
{
  reShootTime=85
  multiShotMax=2
}
else if global.difficulty=2
{
  reShootTime=70
  multiShotMax=3
}
else if global.difficulty=3
{
  reShootTime=60
  multiShotMax=4
}
else if global.difficulty=4
{
  reShootTime=55
  multiShotMax=5
}
shootTime=reShootTime-30
multiShot=multiShotMax
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
difficultyAdjustments(global.difficulty)
combatText="This immobile cannon can fire off grenades in a nice wave-like pattern. They are actually spirit based grenades, so be careful there. It has a very high Spirit Defense as well."
sideText="Quite ingenious to put these cannons on the train.#I honestly don't really have anything else to say about these.#Well actually, these train images are taken from an X-Men game."
cripplePointText=">Full Swing#Downward Strike"
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
    //direction
    if x<=oPlayer1.x
      image_xscale=1
    else
      image_xscale=-1
    //shoot
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime>=reShootTime
    {
      //if multiShot>0 and shootTime mod 5=0
      if multiShot>0 and scrModPass(shootTime,5) //60fps change: once each time the count reaches a multiple of it
      {
        var xx;
        if image_xscale=1
          xx=12
        else
          xx=-12
        newAttack=instance_create(x+xx,y-19,oGASGrenade)
        newAttack.sprite_index=sTTurretBomb
        newAttack.spiritPower=spiritPower
        newAttack.damageType="SPIRIT"
        if image_xscale=1
          newAttack.xVel=5-multiShot
        else
          newAttack.xVel=-5+multiShot
        newAttack.yVel=-5.75
        if image_xscale=1
        {
          newAttack.direction=340
          newAttack.image_angle=340
        }
        else
        {
          newAttack.direction=200
          newAttack.image_angle=200
        }
        newAttack.bulletSpeed=8
        multiShot-=1
        if multiShot=0
        {
          shootTime=0
          multiShot=multiShotMax
        }
      }
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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
    inflictStatus(0)
}
