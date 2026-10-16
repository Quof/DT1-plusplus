#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-10,-21,10,-1)
image_speed=0.15

//Enemy base statistics
eName="Puffstool"
maxLife=700
life=maxLife
expWorth=1800
physicalPower=420
physicalDefense=130
spiritPower=460
spiritDefense=185
FIREresist=-75
WATERresist=75
WINDresist=20
EARTHresist=35
baseItemChance=65
moneyWorth=140
dropInd=-20
bInflictPoison=true
initDir=0
if global.difficulty=1
{
  runAcc=0.8
  poisonWait=90
}
else if global.difficulty=2
{
  runAcc=1.1
  poisonWait=80
}
else if global.difficulty=3
{
  runAcc=1.4
  poisonWait=75
}
else if global.difficulty=4
{
  runAcc=1.8
  poisonWait=65
}
poisonTime=15
difficultyAdjustments(global.difficulty)
combatText="These are slow, but are poisonous to the touch. That pollen they emit is also poisonous and can be used just as they fade away, watch out."
sideText="These work pretty well for a side scrolling game, don't you think?"
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
  if bActive=true and stunnedTime=0
  {
    if poisonTime<poisonWait-14
    {
      if x>oCharacter.x
        xVel=-runAcc
      else
        xVel=runAcc
    }
    //shoot
    poisonTime+=1
    if poisonTime>poisonWait-15
    {
      image_blend=c_green
      xVel=0
    }
    if poisonTime>=poisonWait
    {
      image_blend=baseColor
      var xPoison;
      xPoison=-12
      for(i=0;i<2;i+=1)
      {
        poisonSmoke=instance_create(x+xPoison,y-8,oGASGExplosion)
        poisonSmoke.spiritPower=spiritPower
        poisonSmoke.damageType="SPIRIT"
        poisonSmoke.sprite_index=sDR_SporeSmoke
        poisonSmoke.bInflictPoison=true
        poisonSmoke.image_speed=0.4
        poisonSmoke.image_xscale=1.25
        poisonSmoke.image_yscale=1.25
        xPoison+=24
      }
      poisonSmoke=instance_create(x,y-20,oGASGExplosion)
      poisonSmoke.spiritPower=spiritPower
      poisonSmoke.damageType="SPIRIT"
      poisonSmoke.sprite_index=sDR_SporeSmoke
      poisonSmoke.bInflictPoison=true
      poisonSmoke.image_speed=0.4
      poisonSmoke.image_xscale=1.25
      poisonSmoke.image_yscale=1.25
      poisonTime=0
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=1
    if y>room_height+30
      instance_destroy()
  }
  enemyStepEvent()
}
