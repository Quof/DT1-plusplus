#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-8,-12,8,-1)
image_speed=0
//Enemy base statistics
eName="Met"
maxLife=220
life=maxLife
expWorth=350
physicalPower=240
physicalDefense=100
spiritDefense=100
baseItemChance=60
dropInd=-10
moneyWorth=80
hitSound=global.snd_MMeHit
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
reHitTime=5
if global.difficulty=1
  reShootTime=70
else if global.difficulty=2
  reShootTime=60
else if global.difficulty=3
  reShootTime=50
else if global.difficulty=4
  reShootTime=40
shootTime=20
detectDistX=200
bCanTakeDamage=false
difficultyAdjustments(global.difficulty)
combatText="Here's something you know about. It waits below its helmet before attacking, as it is impervious to all attacks while under the helmet. You'd think that this type of material would be used for everything.#First Appearance: Mega Man"
sideText="Oh Mets. It's a tiny construction robot wearing a disproportionately-sized hard hat with a 'plus' sign marked on it. They appear in nearly every Mega Man and are a flagship enemy of the series. Mets are to Mega Man what Goombas are to Mario. The word 'Met' is actually short for its various forms. (Metall, Metool, Mettenna, and Mettaur.)"
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
  if shootTime<reShootTime-15 and shootTime>15
  {
    image_index=0
    bCanTakeDamage=false
  }
  else
  {
    image_index=1
    bCanTakeDamage=true
  }
  if bActive=true and dieFade=0
  {
    if shootTime<reShootTime-15 and shootTime>3
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    if shootTime>=reShootTime
    {
      var dirOffset;
      if image_xscale=1
        dirOffset=45
      else
        dirOffset=135
      for(i=0;i<3;i+=1)
      {
        newAttack=instance_create(x,y-8,oMMeShot1)
        newAttack.physicalPower=physicalPower
        newAttack.bulletSpeed=4
        //newAttack.direction=dirOffset
        newAttack._direction=dirOffset //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        if dirOffset>90
          dirOffset+=45
        else
          dirOffset-=45
      }
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that shoots counts as a whole tick, as at 30fps (it doesn't count
      //up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    if isCollisionSolid()
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
  }
  enemyStepEvent()
}
