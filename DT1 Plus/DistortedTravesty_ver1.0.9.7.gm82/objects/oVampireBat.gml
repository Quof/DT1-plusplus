#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.1

//Enemy base statistics
eName="Vampire Bat"
maxLife=270
life=maxLife
expWorth=140
physicalPower=160
physicalDefense=30
spiritDefense=30
WINDresist=-60
EARTHresist=30
baseItemChance=40
moneyWorth=3
bobTime=0
detectDistY=192
initDir=0
if global.difficulty=1
  runAcc=1.6
else if global.difficulty=2
  runAcc=1.9
else if global.difficulty=3
  runAcc=2.2
else if global.difficulty=4
  runAcc=2.65
runAcc+=random(0.6)
difficultyAdjustments(global.difficulty)
inactiveDist*=2
combatText="What can I really say about these things? They just fly in one direction. The speed between each one seems to be a little different, but really there isn't any major threat. I suppose if there were a bunch of them, then you would have a problem, but even so, you have just the right spell to take care of that."
sideText="I find it rather odd that these things can fly through walls. That always annoyed me when I thought I was safe then WHAM! I also never understood why they only fly in one direction. Why not come back or come after you. Oh well, in your case, its a good thing."
cripplePointText=">Any Water Fused Physical Attack"
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //60fps change: bobTime counts 30fps ticks in fractions; tick n's frames have values above n-1 up to n, so the
    //ranges' ">=n" lower bounds are ">n-1" (each covers the same ticks as at 30fps); the moves are per 30fps tick
    //bobTime+=1
    //if bobTime>=1 and bobTime<=20
    //  y+=0.7
    //else if bobTime>=21 and bobTime<=40
    bobTime+=gDeltaTime
    if bobTime>0 and bobTime<=20
      y+=0.7*gDeltaTime
    else if bobTime>20 and bobTime<=40
    {
      //y-=0.7
      y-=0.7*gDeltaTime
      //if bobTime=40
      if bobTime>=40 //60fps change: (it counts in fractions)
        bobTime=0
    }
    //x+=xVel
    x+=xVel*gDeltaTime
    if findTargetX>inactiveDist/2
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
if damageTime=flashTime and dieFade=0 and other.elementType=2
{
  inflictStatus(0)
}
