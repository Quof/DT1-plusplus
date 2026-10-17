#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-3,-3,3,3)

//Enemy base statistics
eName="Child Pipi"
maxLife=50
life=maxLife
expWorth=100
physicalPower=240
physicalDefense=100
spiritDefense=100
baseItemChance=30
dropInd=-5
moneyWorth=25
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
{
  flySpeed=3
  searchTime=20
}
else if global.difficulty=2
{
  flySpeed=4
  searchTime=30
}
else if global.difficulty=3
{
  flySpeed=5
  searchTime=50
}
else if global.difficulty=4
{
  flySpeed=6
  searchTime=70
}
difficultyAdjustments(global.difficulty)
combatText="Just tries to fly at you, that's it.#First Appearance: Mega Man 2"
sideText="They come out of the egg capsule thing dropped by the Pipis. Nothing else to really say about them."
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
    //60fps change: _speed/_direction instead of GM's speed/direction (moved by correctSpeedDirection below; oPipiEgg
    //sets _direction), and searchTime counts 30fps ticks
    //if direction>90 and direction<270
    if _direction>90 and _direction<270
      image_xscale=1
    else
      image_xscale=-1

    //speed=flySpeed
    //searchTime-=1
    _speed=flySpeed
    searchTime-=gDeltaTime
    if searchTime>0
      //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
      _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-28)
  }
  else if bActive=false and searchTime<=0
    instance_destroy()
  correctSpeedDirection(id) //60fps change (added): this frame's share of the move GM's speed made
  enemyStepEvent()
}
else
  //speed=0
  _speed=0 //60fps change: see above
