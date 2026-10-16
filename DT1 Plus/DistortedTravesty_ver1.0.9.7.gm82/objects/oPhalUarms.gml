#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0

//Enemy base statistics
physicalPower=450
spiritPower=490
bCanTakeDamage=false
activateBoss=0
if global.difficulty=1
{
  guardWait=250
  shieldWait=30
  energyWaveWait=360
  eWaveLength=60
  eWaveFreq=14
}
else if global.difficulty=2
{
  guardWait=240
  shieldWait=40
  energyWaveWait=340
  eWaveLength=65
  eWaveFreq=12
}
else if global.difficulty=3
{
  guardWait=230
  shieldWait=50
  energyWaveWait=310
  eWaveLength=70
  eWaveFreq=10
}
else if global.difficulty=4
{
  guardWait=220
  shieldWait=60
  energyWaveWait=280
  eWaveLength=75
  eWaveFreq=8
}
guardTime=0
energyWaveTime=100
energyWaveDelay=0
difficultyAdjustments(global.difficulty)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    //guard with arms
    guardTime+=1
    if guardTime>=guardWait
    {
      if guardTime=guardWait
        sprite_index=sPhalUarmsBlock
      else if guardTime=guardWait+5
        image_index=1
      else if guardTime=guardWait+10
        image_index=2
      else if guardTime=guardWait+shieldWait
        image_index=1
      else if guardTime=guardWait+shieldWait+5
        image_index=0
      else if guardTime=guardWait+shieldWait+10
      {
        sprite_index=sPhalUarmsIdle
        guardTime=0
      }
    }
    //energy wave attack
    energyWaveTime+=1
    if energyWaveDelay=0
    {
      if energyWaveTime>=energyWaveWait
      {
        energyWaveDelay=energyWaveWait
        energyWaveTime=energyWaveWait
      }
    }
    if energyWaveTime>=energyWaveDelay and energyWaveDelay!=0
    {
      if energyWaveTime=energyWaveDelay
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.sprite_index=sprite_index
        afterImage.image_index=image_index
        afterImage.imageFade=0.08
        afterImage.xScalingSet=0.15
        afterImage.yScalingSet=0.15
      }
      if energyWaveTime>=energyWaveDelay+20 and energyWaveTime mod eWaveFreq=0
      {
        var x1,y1,pDir;
        if sprite_index=sPhalUarmsIdle
        {
          x1=-66
          y1=-6
        }
        else if sprite_index=sPhalUarmsBlock
        {
          x1=-60
          y1=38
        }
        pDir=point_direction(x+x1,y+y1,oPlayer1.x,oPlayer1.y-26)
        eWaveAtk=instance_create(x+x1,y+y1,oLaserB)
        eWaveAtk.sprite_index=sPhalEnergyWave
        eWaveAtk.damageType="SPIRIT"
        eWaveAtk.elementType=3
        eWaveAtk.spiritPower=spiritPower
        eWaveAtk.bulletSpeed=6
        eWaveAtk.direction=pDir
      }
      if energyWaveTime>=energyWaveDelay+75
        energyWaveTime=0
    }
  }
  enemyStepEvent()
}
#define Collision_oTechClose
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other
  instance_destroy()
if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
{
  oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
  oPlayer1.attackState=0
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other
  instance_destroy()
#define Collision_oTechFar
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other
  instance_destroy()
if oPlayer1.attackState=oPlayer1.TECH_WAVE_OF_AWESOME
{
  oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
  oPlayer1.attackState=0
}
