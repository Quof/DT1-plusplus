#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-11,-16,11,-1)
image_speed=0.25

//Enemy base statistics
eName="Slide Cannon"
maxLife=300
life=maxLife
expWorth=55
physicalPower=150
physicalDefense=25
FIREresist=-25
WATERresist=-15
WINDresist=70
EARTHresist=-70
skillResist=5
baseItemChance=60
dropInd=-40
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
  reShootTime=85
else if global.difficulty=2
  reShootTime=75
else if global.difficulty=3
  reShootTime=65
else if global.difficulty=4
  reShootTime=45
shootTime=15
bCanDealDamage=false
difficultyAdjustments(global.difficulty)
combatText="An immobile cannon. Just like the rest of the garbage in this place, it's made of very cheap material. These can fire off slow moving cannon shells. It's easy to see when it is about to fire due to the barrel moving outward a bit to fire."
sideText="When set up right, these things can actually be quite nasty. I'm sure you remember that infiltration mission you had to do where you set off the alarm on purpose. It was quite amusing to see you running from the ocean of bullets flying towards you."
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
  if shootTime<reShootTime-15
    image_index=0
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if shootTime<reShootTime-15 and shootTime>6
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    if shootTime>=reShootTime
    {
      if image_xscale=1
        offsetShotX=12
      else
        offsetShotX=-12
      newAttack=instance_create(x+offsetShotX,y-9,oCannonBullet)
      newAttack.physicalPower=physicalPower
      newAttack.bulletSpeed=6
      if image_xscale=1
        //newAttack.direction=0
        newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      else
        //newAttack.direction=180
        newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
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
      xVel=0
    if isCollisionRight(1)
      xVel=0
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+24
      instance_destroy()
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
