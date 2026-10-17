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
eName="Mole"
maxLife=620
life=maxLife
expWorth=150
physicalPower=250
physicalDefense=100
spiritDefense=100
noMoneyBonus=true
baseItemChance=20
dropInd=-5
moneyWorth=10
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  startSpeed=3.5
  minSpeed=0.8
}
else if global.difficulty=2
{
  startSpeed=4
  minSpeed=1
}
else if global.difficulty=3
{
  startSpeed=4.5
  minSpeed=1.2
}
else if global.difficulty=4
{
  startSpeed=5
  minSpeed=1.3
}
ranSpeedDown=random(0.075)+0.025
shootTime=25
difficultyAdjustments(global.difficulty)
combatText="All it does is come from either the floor or ceiling in great quantity.#First Appearance: Mega Man 2"
sideText="It's used as a digger and... that's it. Well it's also used to annoy you too."
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
    //60fps change: _speed/_direction instead of GM's speed/direction (moved by correctSpeedDirection below; whoever
    //makes it sets _direction), and it slows down per 30fps tick
    //speed=startSpeed
    _speed=startSpeed
    if startSpeed>minSpeed
      //startSpeed-=ranSpeedDown
      startSpeed-=ranSpeedDown*gDeltaTime
    //if direction=90 and y<-32 //up
    if _direction=90 and y<-32 //up
      instance_destroy()
    //else if direction=270 and y>room_height+32 //down
    else if _direction=270 and y>room_height+32 //down
      instance_destroy()
  }
  if bActive=false
    instance_destroy()
  correctSpeedDirection(id) //60fps change (added): this frame's share of the move GM's speed made
  enemyStepEvent()
}
else
  //speed=0
  _speed=0 //60fps change: see above
