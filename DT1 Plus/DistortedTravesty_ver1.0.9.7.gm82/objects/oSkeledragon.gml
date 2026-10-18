#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-12,-42,12,-1)

//Enemy base statistics
eName="Skeledragon"
maxLife=550
life=maxLife
expWorth=180
physicalPower=150
physicalDefense=60
spiritPower=200
spiritDefense=70
WINDresist=90
EARTHresist=-60
skillResist=10
baseItemChance=65
dropInd=-30
moneyWorth=12
detectDistY=176
if global.difficulty=1
  reShootTime=80
else if global.difficulty=2
  reShootTime=70
else if global.difficulty=3
  reShootTime=60
else if global.difficulty=4
  reShootTime=45
shootTime=10
initShot=false
colorChangeTime=0
difficultyAdjustments(global.difficulty)
combatText="Nothing really too special with these things. You just gotta watch when they flash, because that's when they are going to blast fire at you. Their defenses are insane, I recommend crippling them or you'll be wailing on them for awhile."
sideText="When these things are in the right spot, they can be incredibly annoying. I hate it when they are placed next to bottomless pits and they shoot just as you land after a jump. I can't tell you how many times I've died because of that stuff. Man, these things tick me off and they aren't even that bad of an enemy."
cripplePointText=">Jump Strike"
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
    if shootTime>=reShootTime-15
    {
      //colorChangeTime+=1
      colorChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
      if colorChangeTime=1
        image_blend=c_silver
      //else if colorChangeTime=4
      else if colorChangeTime>=4 //60fps change: >= so the cycle still ends if the frame rate changes mid-count
      {
        image_blend=c_white
        colorChangeTime=0
      }
      if initShot=false
      {
        if image_xscale=1
        {
          if x>=oPlayer1.x
          {
            offsetShotY=33
            shotDir=180
          }
          else
          {
            offsetShotY=14
            shotDir=0
          }
        }
        else
        {
          if x>=oPlayer1.x
          {
            offsetShotY=14
            shotDir=180
          }
          else
          {
            offsetShotY=33
            shotDir=0
          }
        }
        initShot=true
      }
    }
    if shootTime>=reShootTime
    {
      image_blend=c_white
      colorChangeTime=0
      initShot=false
      newAttack=instance_create(x,y-offsetShotY,oSkeleFire)
      newAttack.spiritPower=spiritPower
      newAttack.bulletSpeed=6
      //newAttack.direction=shotDir
      newAttack._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_JUMP_SLASH_2
{
  inflictStatus(0)
}
