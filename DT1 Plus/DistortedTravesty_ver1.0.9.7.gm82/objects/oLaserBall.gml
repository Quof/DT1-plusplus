#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Laser Ball"
maxLife=450
life=maxLife
expWorth=230
physicalPower=180
physicalDefense=45
spiritPower=180
spiritDefense=70
FIREresist=60
EARTHresist=-40
baseItemChance=60
moneyWorth=18
initDir=0
if global.difficulty=1
{
  runAcc=0.3
  reShootTime=180
}
else if global.difficulty=2
{
  runAcc=0.4
  reShootTime=155
}
else if global.difficulty=3
{
  runAcc=0.5
  reShootTime=130
}
else if global.difficulty=4
{
  runAcc=0.7
  reShootTime=95
}
shootTime=reShootTime-30
runAcc+=random(0.1)
difficultyAdjustments(global.difficulty)
colorChangeTime=0
inactiveDist=detectDistX*2
combatText="All they do is float in one direction and fire a laser. You can see when they're chargin their laser when they start to flash."
sideText="Who thought up a ball that fires lasers...No seriously, why a ball that fires lasers? Why not an awesome laser cannon that flys and has pirate skulls and a sign that says -You Best Get Out The Way Bitch-. THAT would be awesome!"
cripplePointText=">Any Fire Fused Physical Attack"
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
    x+=xVel

    if shootTime>=reShootTime-20
    {
      colorChangeTime+=1
      if colorChangeTime=1
        image_blend=c_silver
      else if colorChangeTime=4
      {
        image_blend=c_white
        colorChangeTime=0
      }
    }
    if shootTime>=reShootTime
    {
      image_blend=c_white
      colorChangeTime=0
      var dir;
      dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      newAttack=instance_create(x,y,oLaserB)
      newAttack.spiritPower=spiritPower
      newAttack.damageType="SPIRIT"
      newAttack.direction=dir
      newAttack.image_angle=dir
      newAttack.bulletSpeed=4
      shootTime=0
    }
    else
      shootTime+=1
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
if damageTime=flashTime and dieFade=0 and other.elementType=1
{
  inflictStatus(0)
}
