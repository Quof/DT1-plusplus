#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
image_speed=0.25

//Enemy base statistics
eName="Gear Disk Rider"
maxLife=660
life=maxLife
expWorth=690
physicalPower=210
physicalDefense=95
spiritPower=220
spiritDefense=100
FIREresist=50
WATERresist=-65
WINDresist=30
EARTHresist=90
skillResist=5
baseItemChance=70
moneyWorth=80
initDir=0
weight=90
if global.difficulty=1
{
  runAcc=0.7
  reShootTime=105
}
else if global.difficulty=2
{
  runAcc=1
  reShootTime=90
}
else if global.difficulty=3
{
  runAcc=1.3
  reShootTime=75
}
else if global.difficulty=4
{
  runAcc=1.6
  reShootTime=55
}
runAcc+=random(0.25)
shootTime=reShootTime-30
turnTime=0
difficultyAdjustments(global.difficulty)
combatText="These things can pose a threat when they are really high up. They just try to track you, slowly, but they do try. They'll hover in the air and try to drop the bomb on you."
sideText="Its really weird to see this thing running in place while in a hovering gear. I mean, don't get me wrong, its really cool and I think the aero-dynamics behind it are brilliant, but its just weird."
cripplePointText=">Any Wind Fused Physical Attack"
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
    //x+=xVel
    x+=xVel*gDeltaTime //60fps change: per 30fps tick

    //60fps change: counts 30fps ticks
    if x>oCharacter.x and image_xscale=1
      //turnTime+=1
      turnTime+=gDeltaTime
    else if x<oCharacter.x and image_xscale=-1
      //turnTime+=1
      turnTime+=gDeltaTime
    if turnTime>=50
    {
      xVel*=-1
      turnTime=0
    }

    if shootTime>=reShootTime
    {
      newAttack=instance_create(x,y-2,oGASGrenade)
      newAttack.spiritPower=spiritPower
      newAttack.damageType="SPIRIT"
      newAttack.sprite_index=sGreenYoshiEgg
      newAttack.direction=270
      newAttack.bulletSpeed=5
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that shoots counts as a whole tick, as at 30fps (it doesn't count
      //up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above
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
if damageTime=flashTime and dieFade=0 and other.elementType=3
{
  inflictStatus(0)
}
