#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-7,-7,7,7)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
damageType="SPIRIT"
elementType=3
bBreak=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  speed=bulletSpeed
  if isCollisionTop(1)
    bBreak=true
  if isCollisionBottom(1)
    bBreak=true
  if isCollisionLeft(1)
    bBreak=true
  if isCollisionRight(1)
    bBreak=true
  if bBreak=true
  {
    dir=45
    effect=instance_create(x,y,oEffect)
    effect.sprite_index=sEnergyRip1
    effect.image_speed=0.75
    effect.image_xscale=0.3
    effect.image_yscale=0.3
    effect.newBlend=1
    for(i=0;i<4;i+=1)
    {
      newAttack=instance_create(x,y,oMMeShot1)
      newAttack.sprite_index=sThunderDragonBlast
      newAttack.damageType="SPIRIT"
      newAttack.spiritPower=spiritPower-30
      newAttack.elementType=3
      newAttack.image_speed=0.6
      newAttack.image_xscale=0.45
      newAttack.image_yscale=0.45
      newAttack.direction=dir
      newAttack.image_angle=dir
      newAttack.bulletSpeed=8
      dir+=90
    }
    instance_destroy()
  }
}
else
  speed=0
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
