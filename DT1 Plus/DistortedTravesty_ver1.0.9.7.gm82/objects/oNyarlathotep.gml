#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-12,-32,12,-1)
y+=1
image_speed=0
frameCount=0

//Enemy base statistics
eName="Nyarlathotep"
maxLife=620
life=maxLife
expWorth=1200
physicalPower=250
physicalDefense=95
spiritPower=265
spiritDefense=100
FIREresist=-15
WATERresist=75
EARTHresist=-55
baseItemChance=50
dropInd=-10
moneyWorth=100
bInflictPoison=true
if global.difficulty=1
{
  reShootTime=85
  fireMax=3
}
else if global.difficulty=2
{
  reShootTime=70
  fireMax=5
}
else if global.difficulty=3
{
  reShootTime=60
  fireMax=7
}
else if global.difficulty=4
{
  reShootTime=50
  fireMax=8
}
shootTime=reShootTime-30
currentFire=0
difficultyAdjustments(global.difficulty)
combatText="All it does is slither... or something, extremely slow in your direction and toss out fireballs. It can also inject poison into those it touches."
sideText="These are really gross looking... What?#That's all I have to say about it."
cripplePointText=">Full Swing#>Downward Strike"
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
      xVel=-0.1
    else
      xVel=0.1
    //shoot
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if shootTime>=reShootTime and shootTime mod 4=0
    if shootTime>=reShootTime and scrModPass(shootTime,4) //60fps change: once each time the count reaches a multiple of it
    {
      newAttack=instance_create(x,y-14,oShotzoBullet)
      newAttack.sprite_index=sALfireball
      newAttack.damageType="SPIRIT"
      newAttack.spiritPower=spiritPower
      newAttack.elementType=1
      newAttack.image_xscale=0.6
      newAttack.image_yscale=0.6
      newAttack.yVel=random_range(-7,-3.25)
      newAttack.xVel=random_range(-3,3)
      currentFire+=1
      if currentFire>=fireMax
      {
        currentFire=0
        shootTime=0
      }
    }

    //animation
    //frameCount+=1
    frameCount+=gDeltaTime //60fps change: counts 30fps ticks
    //if frameCount mod 6=0
    if scrModPass(frameCount,6) //60fps change: once each time the count reaches a multiple of it
    {
      image_index+=1
      if image_index=3
        image_index=0
    }

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
    inflictStatus(0)
}
