#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0
frameCount=0

//Enemy base statistics
eName="Thunder Dragon"
maxLife=780
life=maxLife
expWorth=1400
physicalPower=250
physicalDefense=100
spiritPower=290
spiritDefense=105
WATERresist=-55
WINDresist=75
baseItemChance=75
moneyWorth=120
initDir=0
if global.difficulty=1
{
  runAcc=2.7
  reShootTime=70
  multiShotMax=1
  turnAroundTimeMax=45
}
else if global.difficulty=2
{
  runAcc=2.8
  reShootTime=60
  multiShotMax=2
  turnAroundTimeMax=35
}
else if global.difficulty=3
{
  runAcc=2.9
  reShootTime=55
  multiShotMax=3
  turnAroundTimeMax=25
}
else if global.difficulty=4
{
  runAcc=3
  reShootTime=45
  multiShotMax=3
  turnAroundTimeMax=15
}
shootTime=10
multiShot=multiShotMax
turnAroundTime=0
difficultyAdjustments(global.difficulty)
combatText="It fires a lightning bolt in at a downward angle. When this lightning bolt hits the ground, it splits into 4 smaller bolts.*A little tip: If you stay under it, it has trouble."
sideText="A dragon from the Popful Mail game. That was quite a fun game to play and one of the more obscure games."
cripplePointText=">Water Fused Full Swing#>Water Fused Upward Strike"
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
    x+=xVel
    //turn delay around if player is behind it
    if image_xscale=1 and x>oPlayer1.x //right
      turnAroundTime+=1
    else if image_xscale=-1 and x<oPlayer1.x //left
      turnAroundTime+=1
    else if (image_xscale=1 and x<oPlayer1.x) or (image_xscale=-1 and x>oPlayer1.x)
      turnAroundTime=0
    if turnAroundTime>=turnAroundTimeMax
    {
      turnAroundTime=0
      image_xscale*=-1
      xVel*=-1
      shootTime=reShootTime-turnAroundTimeMax-5
      multiShot=multiShotMax
    }
    //shoot
    shootTime+=1
    if shootTime>=reShootTime
    {
      if multiShot>0 and shootTime mod 20=0
      {
        var x1;
        if image_xscale=1
          x1=33
        else
          x1=-33
        effect=instance_create(x+x1,y,oEffect)
        effect.sprite_index=sEnergyRip1
        effect.image_speed=0.75
        effect.image_xscale=0.35
        effect.image_yscale=0.35
        effect.newBlend=1
        effect.followID=id
        effect.xFollow=x1
        effect.yFollow=4

        newAttack=instance_create(x+x1,y+4,oTDlightning)
        newAttack.spiritPower=spiritPower
        newAttack.image_speed=0.6
        if image_xscale=1
        {
          newAttack.direction=320
          newAttack.image_angle=320
        }
        else
        {
          newAttack.direction=220
          newAttack.image_angle=220
        }
        newAttack.bulletSpeed=8
        multiShot-=1
        if multiShot=0
        {
          shootTime=0
          multiShot=multiShotMax
        }
      }
    }
    //animation
    frameCount+=1
    if frameCount=6
      image_index=1
    else if frameCount=12
      image_index=2
    else if frameCount=18
      image_index=3
    else if frameCount=24
      image_index=2
    else if frameCount=30
      image_index=1
    else if frameCount=36
    {
      image_index=0
      frameCount=0
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=2
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH and other.elementType=2
    inflictStatus(0)
}
