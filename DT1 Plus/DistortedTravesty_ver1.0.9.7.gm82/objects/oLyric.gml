#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0.26
//Enemy base statistics
eName="Lyric"
maxLife=120
life=maxLife
expWorth=300
physicalPower=245
physicalDefense=100
spiritDefense=100
FIREresist=20
WATERresist=10
WINDresist=90
EARTHresist=-50
baseItemChance=60
dropInd=-10
moneyWorth=75
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
  moveSpeed=1.2
else if global.difficulty=2
  moveSpeed=1.5
else if global.difficulty=3
  moveSpeed=1.8
else if global.difficulty=4
  moveSpeed=2.2
difficultyAdjustments(global.difficulty)
combatText="It uses a radar to track intruders, which means it just floats slowly toward you.#First Appearance: Mega Man 5"
sideText="You know, there sure are a lot of tracking type enemies from the Mega Man games... as well as stand and either shoot at you or in 1 or 2 directions. I guess AI protocols had to be simple. That or Dr. Wily is a terrible designer."
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and dieFade=0
  {
    direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
    speed=moveSpeed
  }
  enemyStepEvent()
}
else
  speed=0
