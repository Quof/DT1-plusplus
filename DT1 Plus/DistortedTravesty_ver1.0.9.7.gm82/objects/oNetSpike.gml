#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-6,1,6,27)
//direction=270
_direction=270 //60fps change: _direction stands in for direction (see correctSpeedDirection)

//Enemy base statistics
damageType="SPIRIT"
elementType=4
dropSpeed=0
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
dupCount=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if amount>0
  {
    //dupCount+=1
    dupCount+=gDeltaTime //60fps change: counts 30fps ticks
    //if dupCount=6
    if scrCountPass(dupCount,6) //60fps change: once, when the count reaches 6
    {
      amount-=1
      spikeAttack=instance_create(random(448)+128,64,oNetSpike)
      spikeAttack.spiritPower=spiritPower
      spikeAttack.amount=amount
    }
  }
  if dropSpeed<10
    //dropSpeed+=0.25
    dropSpeed=min(10,scrGravAcc(dropSpeed,0.25,1)) //60fps change: speeds up per 30fps tick, following the 30fps fall (the same at 30fps)
  //speed=dropSpeed
  _speed=dropSpeed //60fps change: moved by correctSpeedDirection (end of the step)

  if isCollisionBottom(1)
    instance_destroy()
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
