#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-8,-14,8,-1)
image_speed=0.26
//Enemy base statistics
eName="Pipi"
maxLife=180
life=maxLife
expWorth=500
physicalPower=250
physicalDefense=100
spiritDefense=100
FIREresist=20
WATERresist=10
WINDresist=90
EARTHresist=-50
baseItemChance=65
dropInd=-10
moneyWorth=115
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
weight=20
if global.difficulty=1
  flySpeed=4
else if global.difficulty=2
  flySpeed=5
else if global.difficulty=3
  flySpeed=6
else if global.difficulty=4
  flySpeed=7
bHasEgg=true
init=0
difficultyAdjustments(global.difficulty)
combatText="A robotic bird that drops egg shaped capsules filled with Child Pipis.#First Appearance: Mega Man 2"
sideText="I don't see the purpose of these things! Why were they built? Maybe as transports, but they can't carry much so that's out the window. They are just useless."
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
    if init=0
    {
      if x>oCharacter.x
      {
        flySpeed*=-1
        image_xscale=-1
      }
      else
        image_xscale=1
      init=1
    }
    //x+=flySpeed
    x+=flySpeed*gDeltaTime //60fps change: per 30fps tick
    if bHasEgg=true
    {
      xDist=point_distance(x,0,oPlayer1.x,0)
      if xDist<96
      {
        egg=instance_create(x,y,oPipiEgg)
        egg.yVel=-2
        bHasEgg=false
      }
    }
  }
  else if bActive=false and init=1
    instance_destroy()
  enemyStepEvent()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if bHasEgg=true
  draw_sprite_ext(sPipiEgg,-1,x,y,image_xscale,1,0,c_white,1)
