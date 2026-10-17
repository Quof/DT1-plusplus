#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-7,-7,7,7)
image_speed=0
bCanDealDamage=false
bCanTakeDamage=false

//Enemy base statistics
eName="Boo"
maxLife=360
life=maxLife
expWorth=135
damageType="SPIRIT"
physicalDefense=20
spiritPower=160
spiritDefense=70
FIREresist=-40
WINDresist=40
skillResist=10
baseItemChance=40
dropInd=-10
moneyWorth=7
lookingAt=false
if global.difficulty=1
  runAcc=1.1
else if global.difficulty=2
  runAcc=1.4
else if global.difficulty=3
  runAcc=1.7
else if global.difficulty=4
  runAcc=2
difficultyAdjustments(global.difficulty)
combatText="What to say about Boos. Nothing really, you know everything you need to from previous experiences with them. I have noticed a slightly odd behavior with these though. They don't shy away as quickly as normal Boos, which gives you enough time to kick some ass."
sideText="They are not as scary as I thought. It's ironic that they get scared when you look at them when they are supposed to be doing the scaring. I guess that's why I find it ironic. It's so untrue that Yoshis are afraid of these."
cripplePointText=">Fire Fused Full Swing"
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

    if x>oPlayer1.x
    {
      if oPlayer1.image_xscale=1
        lookingAt=true
      else if oPlayer1.image_xscale=-1 and findTargetX>32
        lookingAt=false
    }
    else
    {
      if oPlayer1.image_xscale=1 and findTargetX>32
        lookingAt=false
      else if oPlayer1.image_xscale=-1
        lookingAt=true
    }
    if instance_exists(oCharacter) and lookingAt=false
    {
      bCanDealDamage=true
      bCanTakeDamage=true
      image_alpha=1
      image_index=1
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      //moveTo(runAcc*cos(degtorad(dir)),-runAcc*sin(degtorad(dir)))
      moveTo(runAcc*cos(degtorad(dir))*gDeltaTime,-runAcc*sin(degtorad(dir))*gDeltaTime) //60fps change: this frame's share of a 30fps tick
      if dir>90 and dir<270
        image_xscale=-1
      else
        image_xscale=1
    }
    else
    {
      bCanDealDamage=false
      bCanTakeDamage=false
      image_alpha=0.7
      image_index=0
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=1
{
  inflictStatus(0)
}
