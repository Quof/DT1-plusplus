#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.3

//Enemy base statistics
eName="Weird Ass Electric Thing"
maxLife=540
life=maxLife
expWorth=670
physicalPower=205
physicalDefense=70
spiritPower=245
spiritDefense=90
damageType="SPIRIT"
elementType=3
WATERresist=60
WINDresist=-50
baseItemChance=70
dropInd=-10
moneyWorth=75
initDir=0
dirChangeTime=0
dirChangeTimeMax=143
weight=100
if global.difficulty=1
{
  runAcc=0.5
  reShootTime=180
}
else if global.difficulty=2
{
  runAcc=0.6
  reShootTime=150
}
else if global.difficulty=3
{
  runAcc=0.7
  reShootTime=130
}
else if global.difficulty=4
{
  runAcc=0.9
  reShootTime=100
}
shootTime=reShootTime-30
runAcc+=random(0.1)
difficultyAdjustments(global.difficulty)
colorChangeTime=0
inactiveDist=detectDistX*2
combatText="All this weird flying thing does is fly back and forth and shoot lasers at you. Really, THAT'S all it does!"
sideText="I don't really know what this is to be honest. It's just so weird looking and... why lasers and not lightning bolts or something else that would actually make sense?"
cripplePointText=">Full Swing#>Upward Strike"
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
    if initDir=false
    {
      xVel=runAcc
      if x>oPlayer1.x
        xVel*=-1
      initDir=true
    }
    if xVel>0
      image_xscale=1
    else
      image_xscale=-1
    //x+=xVel
    x+=xVel*gDeltaTime //60fps change: per 30fps tick

    //dirChangeTime+=1
    dirChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if dirChangeTime>=dirChangeTimeMax
    {
      xVel*=-1
      dirChangeTime=0
    }

    if shootTime>=reShootTime-20
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
    }
    if shootTime>=reShootTime
    {
      image_blend=c_white
      colorChangeTime=0
      newAttack=instance_create(x,y,oLaserB)
      newAttack.spiritPower=spiritPower
      newAttack.damageType="SPIRIT"
      //newAttack.direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      newAttack._direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newAttack.bulletSpeed=5
      //shootTime=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
      shootTime=gDeltaTime-1
    }
    else
      //shootTime+=1
      shootTime+=gDeltaTime //60fps change: see above
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
    inflictStatus(0)
}
