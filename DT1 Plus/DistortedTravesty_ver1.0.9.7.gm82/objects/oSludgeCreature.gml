#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-24,13,-1)
image_speed=0.17

//Enemy base statistics
eName="Sludge Creature"
maxLife=1050
life=maxLife
expWorth=1200
physicalPower=480
physicalDefense=230
spiritPower=420
spiritDefense=280
FIREresist=-55
WATERresist=100
WINDresist=50
baseItemChance=140
dropInd=-5
moneyWorth=140
bInflictPoison=true
if global.difficulty=1
{
  runAcc=1.8
  shootWait=90
  fireMax=2
  duplicateWait=520
}
else if global.difficulty=2
{
  runAcc=2
  shootWait=80
  fireMax=3
  duplicateWait=490
}
else if global.difficulty=3
{
  runAcc=2.2
  shootWait=75
  fireMax=3
  duplicateWait=470
}
else if global.difficulty=4
{
  runAcc=2.4
  shootWait=70
  fireMax=4
  duplicateWait=450
}
shootTime=shootWait-30
duplicateTime=120
spawnWait=0
difficultyAdjustments(global.difficulty)
combatText="Sprays gravity based fireballs periodically, it will give a warning as usual. If you don't kill it fast enough, it will replicate itself. The copies can also replicate and so on. When the new one is spawned, it cannot perform any actions for 1 second. Another thing to watch out for is it's very high defenses. You should definitely cripple these."
sideText="I've honestly forgotten where these appeared in Demon's Crest. I know they were there somewhere. I don't remember if they had any abilities. I'm pretty sure they just moved around."
cripplePointText=">Downward Strike#>Downward Strike"
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("dup")
{
  duplicateTime=-150
  spawnWait=30
  xVel=random_range(-2,2)
  yVel=random_range(-6,-2)
  if expWorth>700
    expWorth-=200
}
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
    //new spawn wait
    //spawnWait-=1
    spawnWait-=gDeltaTime //60fps change: counts 30fps ticks
    if spawnWait<=0
    {
      if x>oCharacter.x
        xVel=-runAcc
      else
        xVel=runAcc
      //shoot
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if shootTime=shootWait-16
      if scrCountPass(shootTime,shootWait-16) //60fps change: once, when the count reaches it
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.sprite_index=sprite_index
        afterImage.image_index=image_index
        afterImage.imageFade=0.06
        afterImage.xScalingSet=0.15
        afterImage.yScalingSet=0.15
      }
      if shootTime>=shootWait
      {
        for(i=0;i<fireMax;i+=1)
        {
          newAttack=instance_create(x,y-12,oShotzoBullet)
          newAttack.sprite_index=sALfireball
          newAttack.damageType="SPIRIT"
          newAttack.spiritPower=spiritPower
          newAttack.elementType=1
          newAttack.image_xscale=0.6
          newAttack.image_yscale=0.6
          newAttack.yVel=-5.5
          newAttack.xVel=i*2
          if i!=0
          {
            newAttack=instance_create(x,y-12,oShotzoBullet)
            newAttack.sprite_index=sALfireball
            newAttack.damageType="SPIRIT"
            newAttack.spiritPower=spiritPower
            newAttack.elementType=1
            newAttack.image_xscale=0.6
            newAttack.image_yscale=0.6
            newAttack.yVel=-5.5
            newAttack.xVel=-i*2
          }
        }
        shootTime=0
      }
      //duplicate
      //duplicateTime+=1
      duplicateTime+=gDeltaTime //60fps change: counts 30fps ticks
      if duplicateTime>=duplicateWait
      {
        newSlime=instance_create(x,y-12,oSludgeCreature)
        newSlime.dup=1
        duplicateTime=0
      }
    }

    //yVel+=0.3
    yVel=scrGravAcc(yVel,0.3,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      yVel=0
      if spawnWait>0
        xVel=0
    }
    if isCollisionLeft(1)
      xVel=1
    if isCollisionRight(1)
      xVel=-1
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
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
