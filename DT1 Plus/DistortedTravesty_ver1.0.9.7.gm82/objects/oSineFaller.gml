#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-11,-24,11,-1)
image_speed=0.5
bCanDealDamage=false
visible=false
bFlyDown=false
flyPicY=y

//Enemy base statistics
eName="Sine Faller"
maxLife=260
life=maxLife
expWorth=35
physicalPower=130
physicalDefense=20
FIREresist=-20
WATERresist=-10
WINDresist=60
EARTHresist=-40
baseItemChance=50
dropInd=-30
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
  runAcc=0.8
else if global.difficulty=2
  runAcc=1
else if global.difficulty=3
  runAcc=1.2
else if global.difficulty=4
  runAcc=1.6
difficultyAdjustments(global.difficulty)
combatText="That's some pretty cheap hardware they're using for this thing. The programmers were also lazy in it's design. There are two model types for this. One which only bludgeons it's target and the other which does that and on top of it can fire off concussive shells. It's pretty standard, nothing you can't easily handle. Hit it with something hard to break it easier."
sideText="I kinda understand the name, but kinda don't. It uses both Sine and Cosine functions in it's base programming to assist in target finding. Whatever, I guess the developers of it couldn't think of anything better. Though I think Sine Flyer sounds better."
cripplePointText=">Earth Fused Upward Strike"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and bFlyDown=false
  {
    if visible=false
    {
      visible=true
      y-=384
    }
    y+=8
    if y>=flyPicY
    {
      bCanDealDamage=true
      bFlyDown=true
    }
  }
  if bActive=true and stunnedTime=0 and dieFade=0 and bFlyDown=true
  {
    if instance_exists(oCharacter)
    {
      dir=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      moveTo(runAcc*cos(degtorad(dir)),-runAcc*sin(degtorad(dir)))
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=4
{
  inflictStatus(0)
}
