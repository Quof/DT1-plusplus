#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-13,-22,13,-1)

//Enemy base statistics
eName="Shell Crawler"
maxLife=650
life=maxLife
expWorth=425
physicalPower=210
physicalDefense=80
spiritDefense=10
FIREresist=-10
WINDresist=65
EARTHresist=-50
baseItemChance=70
moneyWorth=54
bCanDealDamage=false
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
{
  runAcc=0.3
  reShootTime=75
}
else if global.difficulty=2
{
  runAcc=0.4
  reShootTime=65
}
else if global.difficulty=3
{
  runAcc=0.5
  reShootTime=55
}
else if global.difficulty=4
{
  runAcc=0.75
  reShootTime=40
}
shootTime=20
difficultyAdjustments(global.difficulty)
combatText="A small highly armored mobile tank bot. Incredibly slow moving, but can fire off a high powered cannon blast. It will stop moving before it fires."
sideText="I don't quite get why it's in this place, but we'll just blame it on the Distortion Effect."
cripplePointText=">Earth Fused Downward Strike"
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
    if shootTime<reShootTime-15 and shootTime>6
    {
      if x>oCharacter.x
      {
        image_xscale=-1
        xVel=-runAcc
      }
      else
      {
        image_xscale=1
        xVel=runAcc
      }
    }

    if shootTime>=reShootTime-15
      xVel=0

    if shootTime>=reShootTime
    {
      if image_xscale=1
        offsetShotX=12
      else
        offsetShotX=-12
      newAttack=instance_create(x+offsetShotX,y-14,oCannonBullet)
      newAttack.physicalPower=physicalPower
      newAttack.sprite_index=sSCBlast
      newAttack.bulletSpeed=6
      if image_xscale=1
        //newAttack.direction=0
        newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      else
      {
        //newAttack.direction=180
        newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newAttack.image_xscale=-1
      }
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that shoots counts as a whole tick, as at 30fps (it doesn't count
      //up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2

    if y>room_height+30
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=4
{
  inflictStatus(0)
}
