#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-9,-7,9,8)
y+=8

//Enemy base statistics
eName="Shotzo"
maxLife=750
life=maxLife
expWorth=550
physicalPower=200
physicalDefense=100
spiritDefense=90
WINDresist=90
EARTHresist=-90
skillResist=10
baseItemChance=70
moneyWorth=24
dieEffect=sRobotExplosion
dieSound=global.snd_CASdie
bCanDealDamage=false
if global.difficulty=1
  reShootTime=140
else if global.difficulty=2
  reShootTime=120
else if global.difficulty=3
  reShootTime=100
else if global.difficulty=4
  reShootTime=70
shootTime=reShootTime-30
maxShootDist=6
difficultyAdjustments(global.difficulty)
combatText="If you've seen these in their original state, they do not work the same as you've come to know them. Instead of firing in a straight line in your general direction, they arc their cannon shots in your direction. I know that if you get really close to them, their shot will actually go around you. I really suggest just avoiding these."
sideText="Gah, I hate cannons when I'm not the one using them. These give a lot of Experience when defeated, but it is really worth it? I suppose crippling would be the way to go, but still. Oh well, do what you want with these."
cripplePointText=">Rock Smash"
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
    if x>oCharacter.x
      image_angle=findTargetX/8+90
    else
      image_angle=-findTargetX/8+90
    if shootTime>=reShootTime
    {
      if x>oCharacter.x
        offsetShotX=-1
      else
        offsetShotX=1
      newAttack=instance_create(x+offsetShotX,y,oShotzoBullet)
      newAttack.physicalPower=physicalPower
      newAttack.yVel=-5.75
      //find arc
      tempDist=findTargetX
      tempDist/=64
      if tempDist>maxShootDist
        tempDist=maxShootDist
      newAttack.xVel=tempDist
      if x>oCharacter.x
        newAttack.xVel*=-1
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

    if y>room_height+30
      instance_destroy()
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="ROCK SMASH"
{
  inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_sprite(sShotzoBase,-1,x,y+8)
