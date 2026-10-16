#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-15,-15,15,15)

//Enemy base statistics
eName="IE Icon"
maxLife=800
life=maxLife
expWorth=1300
damageType="SPIRIT"
physicalDefense=90
spiritPower=235
spiritDefense=70
FIREresist=-100
WATERresist=100
WINDresist=100
EARTHresist=100
baseItemChance=65
moneyWorth=135
if global.difficulty=1
{
  runAcc=0.8
  reShootTime=150
  maxVirus=5
}
else if global.difficulty=2
{
  runAcc=1
  reShootTime=130
  maxVirus=6
}
else if global.difficulty=3
{
  runAcc=1.2
  reShootTime=110
  maxVirus=7
}
else if global.difficulty=4
{
  runAcc=1.4
  reShootTime=90
  maxVirus=9
}
if directory_exists("C:\Program Files\Mozilla Firefox")=1
  ffExists=1
else
  ffExists=0
currentVshot=0
shootTime=reShootTime/2
difficultyAdjustments(global.difficulty)
combatText="The dreaded IE. I won't say the full name due to copyright issues. It floats about, trying to get over to you, I'm not sure what's going on with it, but it seems to have trouble tracking you properly. Could be due to lazy programming. Oh SNAP! Did you see what I did there? Periodically it will shoot off viruses. Your best bet is to be under it or wait till it shoots them off then go in for the kill. Fire is it's natural enemy."
sideText="Virus infestations, security loopholes, the works. Don't touch this thing, it can have other side effects on you. I can keep the viruses themselves out, but touching it directly... I doubt even I could prevent the horrors that may come upon you."
cripplePointText=">None#>Well... Firefox exists"
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
    if instance_exists(oCharacter)
    {
      ran1=-60+random(30)
      ran2=-60+random(30)
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      dir1=dir+ran1
      dir2=dir+ran2
      moveTo(runAcc*cos(degtorad(dir1)),-runAcc*sin(degtorad(dir2)))
    }
    shootTime+=1
    if shootTime>=reShootTime and shootTime mod 3=0
    {
      newAttack=instance_create(x,y,oShotzoBullet)
      newAttack.sprite_index=sDrMarioVirusRed
      newAttack.image_speed=0.15
      newAttack.damageType="SPIRIT"
      newAttack.spiritPower=spiritPower
      newAttack.yVel=-4.25-random(2)
      newAttack.xVel=random(10)-5
      currentVshot+=1
      if currentVshot>=maxVirus
      {
        currentVshot=0
        shootTime=0
      }
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and ffExists=1
{
  inflictStatus(0)
}
