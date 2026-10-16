#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-6,1,6,27)
direction=270

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
    dupCount+=1
    if dupCount=6
    {
      amount-=1
      spikeAttack=instance_create(random(448)+128,64,oNetSpike)
      spikeAttack.spiritPower=spiritPower
      spikeAttack.amount=amount
    }
  }
  if dropSpeed<10
    dropSpeed+=0.25
  speed=dropSpeed

  if isCollisionBottom(1)
    instance_destroy()
}
else
  speed=0
