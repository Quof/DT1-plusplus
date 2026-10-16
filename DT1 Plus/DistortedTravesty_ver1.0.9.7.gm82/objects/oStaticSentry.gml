#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-14,-28,14,-1)
image_speed=0.25
baseColor=make_color_rgb(255,225,200)
image_blend=baseColor

//Enemy base statistics
eName="Static Sentry"
maxLife=1400
life=maxLife
expWorth=3400
physicalPower=520
physicalDefense=220
spiritPower=300
spiritDefense=240
FIREresist=40
WATERresist=20
WINDresist=70
EARTHresist=-60
skillResist=10
baseItemChance=70
dropInd=-10
moneyWorth=195
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
if global.difficulty=1
  reShootTime=95
else if global.difficulty=2
  reShootTime=85
else if global.difficulty=3
  reShootTime=75
else if global.difficulty=4
  reShootTime=70
shootTime=reShootTime-5
maxShootDist=8
tripleShot=0
difficultyAdjustments(global.difficulty)
combatText="The static ground unit. It's job is to support the mobile units by limiting the target's available movement space. It can launch grenades with extreme accuracy. Periodically it will fire off a lot of grenades in a row. When it does this, it must wait a bit longer to charge up."
sideText="If the mobile units it is supporting are too far away, it will fire 2 grenades at one time, but not directly at you, it will fire them around you to pin you in. Keep in mind that farther away you are from the static unit, the faster it will fire grenades."
cripplePointText=">Full Swing#>Thrust Attack"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if shootTime>5
    image_index=5
  else if shootTime=0
    image_index=0
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if tripleShot!=6
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }

    if shootTime<reShootTime
      if distance_to_object(oPlayer1)>240
        shootTime+=1
    if shootTime<reShootTime
      if distance_to_object(oPlayer1)>400
        shootTime+=1
    if shootTime<reShootTime
      if distance_to_object(oPlayer1)>560
        shootTime+=1
    shootTime+=1
    if shootTime>=reShootTime
    {
      if x>oCharacter.x
        offsetShotX=-20
      else
        offsetShotX=20
      playSound(global.snd_GASlaunch,0,0.85)
      newAttack[0]=instance_create(x+offsetShotX,y-30,oGASGrenade)
      newAttack[0].physicalPower=physicalPower
      newAttack[0].yVel=-5.75
      //find arc
      tempDist=findTargetX
      tempDist/=64
      if tempDist>maxShootDist
        tempDist=maxShootDist
      newAttack[0].xVel=tempDist
      if distance_to_object(oMobileSentry)>192
      {
        if distance_to_object(oMobileSentry)>512 or !instance_exists(oMobileSentry)
        {
          newAttack[0].xVel+=0.75
          newAttack[1]=instance_create(x+offsetShotX,y-30,oGASGrenade)
          newAttack[1].physicalPower=physicalPower
          newAttack[1].yVel=-5.75
          newAttack[1].xVel=tempDist-0.75
        }
        else
        {
          newAttack[0].xVel+=1.5
          newAttack[1]=instance_create(x+offsetShotX,y-30,oGASGrenade)
          newAttack[1].physicalPower=physicalPower
          newAttack[1].yVel=-5.75
          newAttack[1].xVel=tempDist-1.5
        }
        if x>oCharacter.x
          newAttack[1].xVel*=-1
      }
      if x>oCharacter.x
        newAttack[0].xVel*=-1
      tripleShot+=1
      shootTime=0
      if tripleShot=3
        reShootTime=6
      else if tripleShot=6
      {
        shootTime=-30
        reShootTime=70
        tripleShot=0
      }
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    if isCollisionSolid()
      y-=2
    moveTo(xVel,yVel)

    if y>room_height+30
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
    inflictStatus(0)
}
