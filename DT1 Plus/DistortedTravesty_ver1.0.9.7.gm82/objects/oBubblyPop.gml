#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-11,-27,11,-1)
image_speed=0

//Enemy base statistics
eName="Bubbly Pop"
maxLife=350
life=maxLife
expWorth=280
physicalPower=190
physicalDefense=40
spiritPower=210
spiritDefense=60
FIREresist=-60
WATERresist=80
WINDresist=75
EARTHresist=-30
detectDistX=304
baseItemChance=65
moneyWorth=35
hopTime=20+round(random(30))
weight=80
if global.difficulty=1
  popTime=155
else if global.difficulty=2
  popTime=140
else if global.difficulty=3
  popTime=125
else if global.difficulty=4
  popTime=90
difficultyAdjustments(global.difficulty)
combatText="Another weird one, it will bounce up and down and then suddenly it goes POP!! When it does this, is will rain down bullets as well. You could probably just run past them or let them pop."
sideText="These make me giggle. Just something funny about seeing and hearing them pop. It's probably not as funny to you, but from my perspective, this is quite humorous."
cripplePointText=">Fire Fused Full Swing"
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
    if yVel=0
    {
      //hopTime-=1
      hopTime-=gDeltaTime //60fps change: counts 30fps ticks
      image_speed=0
    }
    else
      image_speed=0.3
    if hopTime<=0
    {
      y-=8
      yVel=-7
      hopTime=20+round(random(30))
    }
    //popTime-=1
    popTime-=gDeltaTime //60fps change: counts 30fps ticks
    if popTime<=0 and yVel>=2 and yVel<=5
    {
      effect=instance_create(x,y-sprite_height,oEffect)
      effect.sprite_index=sDustCloud
      dirEff=360
      for (i=0;i<=4;i+=1)
      {
        newBullet=instance_create(x,y-sprite_height,oBubblyBullet)
        newBullet.spiritPower=spiritPower
        //newBullet.direction=dirEff
        newBullet._direction=dirEff //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        dirEff-=45
      }
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if isCollisionSolid()
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
if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=1
{
  inflictStatus(0)
}
