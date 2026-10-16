#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
objectUse=oTrapProjectile
shootTime=1000
shootDelay=90
damageType="PHYSICAL"
physicalPower=0
spiritPower=0
elementType=0
spriteUse=0
dir=0
bulletSpeed=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("objectUseN")
  objectUse=objectUseN
if variable_local_exists("spriteUseN")
  spriteUse=spriteUseN
if variable_local_exists("shootDelayN")
  shootDelay=shootDelayN
if variable_local_exists("damageTypeN")
  damageType=damageTypeN
if variable_local_exists("physicalPowerN")
  physicalPower=physicalPowerN
if variable_local_exists("spiritPowerN")
  spiritPower=spiritPowerN
if variable_local_exists("elementTypeN")
  elementType=elementTypeN
if variable_local_exists("dirN")
  dir=dirN
if variable_local_exists("bulletSpeedN")
  bulletSpeed=bulletSpeedN

if global.difficulty=1
  shootDelay+=5
else if global.difficulty=3
  shootDelay-=5
else if global.difficulty=4
  shootDelay-=10

if shootDelay<2
  shootDelay=2

difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  shootTime+=1
  if shootTime>=shootDelay
  {
    newAttack=instance_create(x+8,y+8,objectUse)
    newAttack.sprite_index=spriteUse
    newAttack.damageType=damageType
    newAttack.physicalPower=physicalPower
    newAttack.spiritPower=spiritPower
    newAttack.elementType=elementType
    newAttack.bulletSpeed=bulletSpeed
    newAttack.direction=dir
    shootTime=0
  }
}
