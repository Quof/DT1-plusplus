#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-9,-7,9,7)
image_speed=0.1
bCanDealDamage=false
bCanTakeDamage=false
visible=false

//Enemy base statistics
eName="Ghost"
maxLife=410
life=maxLife
expWorth=170
damageType="SPIRIT"
physicalDefense=20
spiritPower=170
spiritDefense=75
FIREresist=-50
WATERresist=-40
WINDresist=60
EARTHresist=90
baseItemChance=55
moneyWorth=10
fadeInTime=0
if global.difficulty=1
  runAcc=0.85
else if global.difficulty=2
  runAcc=1.1
else if global.difficulty=3
  runAcc=1.35
else if global.difficulty=4
  runAcc=1.7
difficultyAdjustments(global.difficulty)
detectDistX=192
detectDistY=132
inactiveDist=detectDistX*4
combatText="Just a ghost, they really aren't that big of a threat. The only issue is they don't appear until you are somewhat close to them. Still not too big of a threat, they move at a decent speed though."
sideText="You're not afraid of ghosts are you? I doubt it, these aren't even all that scary looking. I've heard ghost stories at band camp that were scarier than these. Which reminds me...nevermind, we better not go there."
cripplePointText=">Fireball"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and fadeInTime<20
  {
    if fadeInTime=0
    {
      effect=instance_create(x,y,oEffect)
      effect.sprite_index=sDustCloud
      effect.image_xscale=0.6
      effect.image_yscale=0.6
    }
    fadeInTime+=1
    if fadeInTime>=14
    {
      visible=true
      bCanDealDamage=true
      bCanTakeDamage=true
      fadeInTime=30
    }
  }
  if bActive=true and stunnedTime=0 and dieFade=0 and fadeInTime>20
  {
    if x>oCharacter.x
      image_xscale=-1
    else
      image_xscale=1
    if instance_exists(oCharacter)
    {
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      moveTo(runAcc*cos(degtorad(dir)),-runAcc*sin(degtorad(dir)))
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
