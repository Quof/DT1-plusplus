#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-11,-23,11,-1)
image_speed=0.18
//Enemy base statistics
eName="Dompan"
maxLife=180
life=maxLife
expWorth=300
physicalPower=280
physicalDefense=100
spiritDefense=100
baseItemChance=40
dropInd=-10
moneyWorth=60
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
  walkSpeed=2.2
else if global.difficulty=2
  walkSpeed=2.6
else if global.difficulty=3
  walkSpeed=3
else if global.difficulty=4
  walkSpeed=3.4
frameCount=0
init=0
difficultyAdjustments(global.difficulty)
combatText="Usually seen with the 100 Watton. If a 100 Watton is destroyed, destroying one of these will turn the lights back on.#First Appearance: Mega Man 4"
sideText="Why did he create this thing here. You have a brilliant idea to stop Mega Man. I mean seriously, he blindly shots at everything so of course he'll knock the lights out. But then you make this thing here to turn the lights back on. You can't tell me that he wouldn't navigate this place with night vision goggles on. Really, who even goes to these places other than Mega Man to go pew pew at everything."
cripplePointText=">None"
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if life<=0
  oWattLight.changeType=0
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
        walkSpeed*=-1
      init=1
      xVel=walkSpeed
    }
    if xVel>0
      image_xscale=1
    else if xVel<0
      image_xscale=-1

    frameCount+=1
    if frameCount=8
      image_index=1
    else if frameCount=16
      image_index=2
    else if frameCount=24
      image_index=1
    else if frameCount=32
    {
      image_index=0
      frameCount=0
    }

    yVel+=0.3
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
