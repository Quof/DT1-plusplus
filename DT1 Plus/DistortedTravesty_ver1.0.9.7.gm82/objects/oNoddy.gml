#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-10,-15,10,-1)
image_speed=0.1

//Enemy base statistics
eName="Noddy"
maxLife=80
life=maxLife
expWorth=20
physicalPower=100
physicalDefense=10
spiritDefense=10
noMoneyBonus=true
baseItemChance=20
dropInd=-5
inactiveDist=detectDistX*2
difficultyAdjustments(global.difficulty)
combatText="Is this a joke? These do absolutely nothing, seriously, even if they do manage to survive an attack, they won't wake up. They will hurt you if you touch them though. Not sure why, I guess the designer wanted to be evil or something."
sideText="In the original, they would at least move around. If Kirby ate one, he would suffer from periodic narcoleptic attacks. Definitely the worst thing when you are trying to fight a miniboss or fly over a bottomless pit."
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
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  }
  enemyStepEvent()
}
