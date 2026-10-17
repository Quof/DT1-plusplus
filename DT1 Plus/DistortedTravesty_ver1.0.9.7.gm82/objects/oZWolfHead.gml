#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if x>oPlayer1.x
  image_xscale=-1

//Enemy base statistics
eName="Wolf Head"
maxLife=200
life=maxLife
expWorth=400
physicalPower=480
physicalDefense=100
spiritPower=350
spiritDefense=150
skillResist=50
baseItemChance=30
moneyWorth=130
noMoneyBonus=true
if global.difficulty=1
{
  moveSpd=0.5
  moveSegment=32
}
else if global.difficulty=2
{
  moveSpd=1
  moveSegment=16
}
else if global.difficulty=3
{
  moveSpd=1
  moveSegment=16
}
else if global.difficulty=4
{
  moveSpd=2
  moveSegment=8
}
shootTime=20
moveProgress=0
moveTime=0
difficultyAdjustments(global.difficulty)
combatText="Up - Forward - Down - Forward, repeat. This is ALL these do, oh and don't forget about the annoying amount of projectile spam they send at you. If you don't kill them and stay in one spot for a long time, the amount of crap on screen... try not to put yourself in that situation."
sideText="These along with something called a 'Skull Head' would do this along with a Medusa Head type of thing. I wonder if you are going to run into those types of things here... I suppose the 'Skull Head' would have been used instead of this, but if you remember back in Distortion 3, there was already an enemy with that name."
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
    //movement
    //moveTime+=1
    moveTime+=gDeltaTime //60fps change: counts 30fps ticks
    if moveProgress=0 or moveProgress=2
    {
      //60fps change: per 30fps tick
      if image_xscale=1
        //x+=moveSpd
        x+=moveSpd*gDeltaTime
      else if image_xscale=-1
        //x-=moveSpd
        x-=moveSpd*gDeltaTime

      //if moveTime=moveSegment
      if moveTime>=moveSegment //60fps change: >= so it still shoots if the frame rate changes mid-count (it resets below)
      {
        newAttack=instance_create(x,y+4,oCannonBullet)
        newAttack.sprite_index=sWolfHeadFireball
        newAttack.physicalPower=physicalPower
        newAttack.bulletSpeed=8
        if image_xscale=1
          //newAttack.direction=0
          newAttack._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        else
          //newAttack.direction=180
          newAttack._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
    }
    else if moveProgress=1
      //y+=moveSpd
      y+=moveSpd*gDeltaTime //60fps change: per 30fps tick
    else if moveProgress=3
      //y-=moveSpd
      y-=moveSpd*gDeltaTime //60fps change: per 30fps tick

    if moveTime>=moveSegment
    {
      moveTime=0
      moveProgress+=1
      if moveProgress=4
        moveProgress=0
    }

    if findTargetX>inactiveDist/2
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }
  enemyStepEvent()
}
