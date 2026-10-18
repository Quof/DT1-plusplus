#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-28,-27,28,-1)
image_speed=0

//Enemy base statistics
eName="Laser Turtle"
maxLife=800
life=maxLife
expWorth=1000
physicalPower=240
physicalDefense=110
spiritDefense=80
FIREresist=20
WINDresist=90
EARTHresist=-50
skillResist=5
baseItemChance=75
dropInd=-10
moneyWorth=115
dieEffect=sMMExplosion
dieSound=global.snd_CASdie
if global.difficulty=1
  reShootTime=95
else if global.difficulty=2
  reShootTime=85
else if global.difficulty=3
  reShootTime=75
else if global.difficulty=4
  reShootTime=60
shootTime=35
bCanDealDamage=false
newAttack=0
difficultyAdjustments(global.difficulty)
combatText="This thing is immobile, but it has some nifty firepower. When you see it open it's mouth, it's going to fire 3 missiles toward you. They have a decently sized explosion, so watch out for that."
sideText="The material used to make these isn't all that bad. These actually have another model, but instead of missiles, it fires a laser. This model here is usually set up on bridges to make better use of it's laser."
cripplePointText=">Earth Fused Thrust Attack#Earth Fused Downward Strike"
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
  else
    image_index=1
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
      var dirOffset,facing;
      if image_xscale=1
      {
        offsetShotX=25
        facing=1
      }
      else
      {
        offsetShotX=-25
        facing=0
      }
      while(!collision_point(x+offsetShotX,y-9,oSolid,true,true))
      {
        newAttack=instance_create(x+offsetShotX,y-9,oLTlaser)
        newAttack.physicalPower=physicalPower
        if facing=0
          offsetShotX-=16
        else
          offsetShotX+=16
        if x+offsetShotX>room_width or x+offsetShotX<0
          break;
      }
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB and other.elementType=4
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH and other.elementType=4
    inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if instance_exists(newAttack)
{
  if image_xscale=1
    xLoffset=22
  else
    xLoffset=-22
  draw_sprite_ext(sFirinMaLaser,-1,x+xLoffset,y-9,image_xscale,1,0,c_white,1)
}
