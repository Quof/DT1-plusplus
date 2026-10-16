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
  guardWait=350
  shieldWait=40
  energyBallWait=120
}
else if global.difficulty=2
{
  guardWait=340
  shieldWait=50
  energyBallWait=105
}
else if global.difficulty=3
{
  guardWait=330
  shieldWait=60
  energyBallWait=90
}
else if global.difficulty=4
{
  guardWait=310
  shieldWait=70
  energyBallWait=70
}
guardTime=0
energyBallTime=energyBallWait-25
energyBallDelay=0
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
        sprite_index=sPhalLarmsBlock
      else if guardTime=guardWait+5
        image_index=1
      else if guardTime=guardWait+shieldWait
        image_index=0
      else if guardTime=guardWait+shieldWait+5
      {
        sprite_index=sPhalLarmsIdle
        guardTime=0
      }
    }
    //energy ball
    energyBallTime+=1
    if energyBallDelay=0
    {
      if energyBallTime>=energyBallWait
      {
        energyBallDelay=energyBallWait
        energyBallTime=energyBallWait
      }
    }
    if energyBallTime=energyBallDelay and energyBallDelay!=0
    {
      var x1,y1;
      if sprite_index=sPhalLarmsIdle
      {
        x1=-41
        y1=58
      }
      else if sprite_index=sPhalLarmsBlock
      {
        x1=-62
        y1=10
      }
      effect=instance_create(x+x1,y+y1,oEffect)
      effect.sprite_index=sPhalEnergyCharge
      effect.image_speed=0.5

      energyBallAtk=instance_create(x+x1,y+y1,oPhalEnergyBall)
      energyBallAtk.damageType="SPIRIT"
      energyBallAtk.elementType=2
      energyBallAtk.spiritPower=spiritPower
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
