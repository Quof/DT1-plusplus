#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
eName="Mini Arrghus"
maxLife=800
life=maxLife
expWorth=500
damageType="SPIRIT"
elementType=4
physicalPower=400
physicalDefense=140
spiritPower=460
spiritDefense=160
FIREresist=-50
WATERresist=-10
WINDresist=90
EARTHresist=100
skillResist=15
if global.difficulty=1
  shootWait=205
else if global.difficulty=2
  shootWait=190
else if global.difficulty=3
  shootWait=175
else if global.difficulty=4
  shootWait=160
shootTime=10
difficultyAdjustments(global.difficulty)
combatText="It just orbits Arrghus. It seems to be providing it with some sort of energy. Perhaps destroying them all will cause something in your favor to happen."
sideText="Is it just me or is this thing's eye kinda drifting off to the side?"
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
  if dieFade=0
  {
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime=shootWait
      effect_create_above(ef_ring,x,y,0,c_silver)
    else if shootTime>=shootWait+15
    {
      var shotDir;
      shotDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
      newBullet=instance_create(x,y,oMMeShot1)
      newBullet.sprite_index=sEbulletDiamond
      newBullet.physicalPower=physicalPower
      newBullet.bulletSpeed=7
      //newBullet.direction=shotDir
      newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newBullet.image_angle=shotDir
      shootTime=0
    }
  }
  enemyStepEvent()
}
