#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.1

//Enemy base statistics
eName="Medusa Head"
maxLife=210
life=maxLife
expWorth=50
damageType="SPIRIT"
physicalDefense=20
spiritPower=170
spiritDefense=50
FIREresist=-50
WINDresist=-5
EARTHresist=5
skillResist=5
noMoneyBonus=true
baseItemChance=35
if global.difficulty=1
{
  runAcc=2.5
  bobAmount=3.5
}
else if global.difficulty=2
{
  runAcc=2.7
  bobAmount=3.8
}
else if global.difficulty=3
{
  runAcc=2.9
  bobAmount=4.1
}
else if global.difficulty=4
{
  runAcc=3.25
  bobAmount=4.5
}
runAcc+=random(0.4)
bobTime=0
difficultyAdjustments(global.difficulty)
if x>oPlayer1.x
  runAcc*=-1
xVel=runAcc
if xVel>0
  image_xscale=1
else
  image_xscale=-1
inactiveDist*=2
combatText="These are like the Vampire Bats. They just fly in one direction, but faster and more annoyingly. The biggest annoyance is they constantly appear and will most likely knock you off the platform you're on or make you miss a jump."
sideText="How does something like this even survive? I know its already dead...or is it? These just make no sense to me, that and they annoy everyone they come across. Definitely one of the more memorable enemies from the Castlevania games."
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

    //60fps change: bobTime counts 30fps ticks in fractions; tick n's frames have values above n-1 up to n, so the
    //ranges' ">=n" lower bounds are ">n-1" (each covers the same ticks as at 30fps); the moves are per 30fps tick
    //bobTime+=1
    //if bobTime>=1 and bobTime<=20
    //  y+=bobAmount
    //else if bobTime>=28 and bobTime<=47
    //  y-=bobAmount
    bobTime+=gDeltaTime
    if bobTime>0 and bobTime<=20
      y+=bobAmount*gDeltaTime
    else if bobTime>27 and bobTime<=47
      y-=bobAmount*gDeltaTime
    else if bobTime>=55
      bobTime=0
    //x+=xVel
    x+=xVel*gDeltaTime

    if findTargetX>inactiveDist/2 //destroy if it gets too far off screen
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
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
