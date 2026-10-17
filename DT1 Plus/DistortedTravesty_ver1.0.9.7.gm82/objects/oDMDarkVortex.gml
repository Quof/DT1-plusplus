#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
damageType="SPIRIT"
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
init=0
decayTime=0
throwDelay=0
if global.difficulty=1
{
  decayTimeMax=200
  throwDelayMax=99
}
else if global.difficulty=2
{
  decayTimeMax=250
  throwDelayMax=90
}
else if global.difficulty=3
{
  decayTimeMax=300
  throwDelayMax=81
}
else if global.difficulty=4
{
  decayTimeMax=700
  throwDelayMax=69
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //image_angle+=5
  image_angle+=5*gDeltaTime //60fps change: per 30fps tick
  //throwDelay+=1
  throwDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if throwDelay>=throwDelayMax
  {
    if round(random(4))>=2
    {
      ballAttack[0]=instance_create(x,y,oDMDarkBall)
      ballAttack[0].spiritPower=spiritPower
      ballAttack[0].type=5
      //ballAttack[0].direction=270
      ballAttack[0]._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      ballAttack[1]=instance_create(x,y,oDMDarkBall)
      ballAttack[1].spiritPower=spiritPower
      ballAttack[1].type=5
      //ballAttack[1].direction=315
      ballAttack[1]._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      ballAttack[2]=instance_create(x,y,oDMDarkBall)
      ballAttack[2].spiritPower=spiritPower
      ballAttack[2].type=5
      //ballAttack[2].direction=225
      ballAttack[2]._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
    }
    else
    {
      ballAttack[0]=instance_create(x,y,oDMDarkBall)
      ballAttack[0].spiritPower=spiritPower
      ballAttack[0].type=4
      ballAttack[0].dir=1
      ballAttack[1]=instance_create(x,y,oDMDarkBall)
      ballAttack[1].spiritPower=spiritPower
      ballAttack[1].type=4
      ballAttack[1].dir=2
    }
    throwDelay=0
  }
  //decayTime+=1
  decayTime+=gDeltaTime //60fps change: counts 30fps ticks
  if decayTime>=decayTimeMax
    instance_destroy()
}
