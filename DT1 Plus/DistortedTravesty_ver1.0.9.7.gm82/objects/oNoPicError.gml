#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//Enemy base statistics
eName="No Pic Error"
maxLife=900
life=maxLife
expWorth=1300
damageType="SPIRIT"
physicalDefense=110
spiritPower=220
spiritDefense=100
FIREresist=100
WATERresist=100
WINDresist=100
EARTHresist=-100
baseItemChance=55
moneyWorth=130
if global.difficulty=1
  reShootTime=160
else if global.difficulty=2
  reShootTime=140
else if global.difficulty=3
  reShootTime=120
else if global.difficulty=4
  reShootTime=95
if directory_exists("C:\Program Files\Adobe")=1
  adobeExists=1
else
  adobeExists=0
shootTime=reShootTime/2
colorChangeTime=0
inactiveDist=detectDistX*2
difficultyAdjustments(global.difficulty)
combatText="These remain stationary, like a solid wall. They can be annoying because they hurt you on contact and also shoot these annoying wave beam things that really have nothing to do with a no pic error. So... yeah idk wtf these are suppose to really be doing here other than annoying you. And yes I did just use an acronym, I figured considering the theme here, it would be alright. :P"
sideText="I've never liked these, I'd love it if you would promptly get rid of all of them. Eh, but some are in weird corners, so I don't blame you if you don't get rid of them all. Seriously, I hate these things, nothing is worse than when you are trying to view a pic and suddenly it's not there and then you're presented with this ass-annoying thing. >:|"
cripplePointText=">None#Well... Adobe exists"
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
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
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
      newAttack.sprite_index=sPinkWave
      newAttack.spiritPower=spiritPower
      newAttack.damageType="SPIRIT"
      //newAttack.direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22)
      newAttack._direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-22) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newAttack.bulletSpeed=6
      shootTime=0
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and adobeExists=1
{
  inflictStatus(0)
}
