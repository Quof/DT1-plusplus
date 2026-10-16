#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.17

//Enemy base statistics
eName="Flying Demon"
maxLife=800
life=maxLife
expWorth=2500
physicalPower=420
physicalDefense=150
spiritPower=470
spiritDefense=200
WATERresist=50
WINDresist=100
EARTHresist=-55
baseItemChance=70
moneyWorth=170
initDir=0
if global.difficulty=1
{
  runAcc=2.3
  shootWait=65
  multiShotMax=4
  shotFreq=11
}
else if global.difficulty=2
{
  runAcc=2.4
  shootWait=55
  multiShotMax=5
  shotFreq=10
}
else if global.difficulty=3
{
  runAcc=2.5
  shootWait=50
  multiShotMax=6
  shotFreq=9
}
else if global.difficulty=4
{
  runAcc=2.6
  shootWait=45
  multiShotMax=6
  shotFreq=8
}
shootTime=shootWait-25
multiShot=multiShotMax
difficultyAdjustments(global.difficulty)
combatText="It is a flying demon with decent defense. It's Spirit Defense is quite high, so physical attacks are the way to go. It only flys in one direction, periodically gliding and dropping... poop? That's my assumption on this one, observe it for yourself. It's probably best to let these fly by."
sideText="These always appeared in the areas where it was required to use the flying form. They only took one shot to kill, so they weren't too bad. I still to this day, say they are pooping on you."
cripplePointText=">Water Fused Full Swing#>Water Fused Upward Strike"
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
    //----- movement -----
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
      {
        xVel*=-1
        image_xscale=-1
      }
      initDir=true
    }
    x+=xVel
    //----- shoot -----
    shootTime+=1
    if shootTime>=shootWait
    {
      y+=1
      sprite_index=sFlyingDemonGlide
      if multiShot>0 and shootTime mod shotFreq=0
      {
        var x1;
        if image_xscale=1
          x1=-5
        else
          x1=5

        newAttack=instance_create(x+x1,y+3,oCannonBullet)
        newAttack.sprite_index=sFlyingDemonPoop
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.direction=270
        newAttack.bulletSpeed=8
        multiShot-=1
        if multiShot=0
        {
          sprite_index=sFlyingDemonFly
          shootTime=0
          multiShot=multiShotMax
        }
      }
    }
    else
      y-=1

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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=2
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=2
    inflictStatus(0)
}
