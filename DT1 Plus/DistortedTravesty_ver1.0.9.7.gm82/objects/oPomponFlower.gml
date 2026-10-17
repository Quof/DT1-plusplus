#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-7,-15,7,-1)

//Enemy base statistics
eName="Pompon Flower"
maxLife=100
life=maxLife
expWorth=600
physicalPower=410
physicalDefense=100
spiritDefense=150
skillResist=100
baseItemChance=40
moneyWorth=120
if global.difficulty=1
{
  runAcc=0.15
  image_speed=0.05
}
else if global.difficulty=2
{
  runAcc=0.2
  image_speed=0.075
}
else if global.difficulty=3
{
  runAcc=0.25
  image_speed=0.1
}
else if global.difficulty=4
{
  runAcc=0.3
  image_speed=0.15
}
bShot=false
difficultyAdjustments(global.difficulty)
combatText="What can I say about this, it moves incredibly slow and spits fireball bullet things constantly out of it's mouth."
sideText="This is so not what they did in Super Mario Land. The Darkness did this just to piss me off. It must know how much everyone loves this game and did this to mock everything. Ass."
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
    if x>oCharacter.x
      xVel=-runAcc
    else
      xVel=runAcc
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc

    if image_index>=1 and image_index<=1.2
    {
      if bShot=false
      {
        newAttack=instance_create(x,y-8,oShotzoBullet)
        newAttack.sprite_index=sD3Bullet
        newAttack.physicalPower=physicalPower
        newAttack.yVel=-4.25-random(2)
        newAttack.xVel=random(10)-5
        bShot=true
      }
    }
    else
      bShot=false

    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel*=-1
    if isCollisionRight(1)
      xVel*=-1
    if isCollisionSolid()
      y-=2

    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
