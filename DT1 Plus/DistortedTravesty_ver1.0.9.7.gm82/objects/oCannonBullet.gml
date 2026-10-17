#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-4,-2,4,2)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bBlownUp=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //image_angle=direction
  image_angle=_direction //60fps change: _direction stands in for direction (see correctSpeedDirection)
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  if isCollisionTop(1)
    bBlownUp=true
  if isCollisionBottom(1)
    bBlownUp=true
  if isCollisionLeft(1)
    bBlownUp=true
  if isCollisionRight(1)
    bBlownUp=true
  if bBlownUp=true
  {
    if sprite_index=sGTmissile
    {
      explosion=instance_create(x,y,oGASGExplosion)
      explosion.physicalPower=physicalPower
      if global.location="Veiled Detritus"
      {
        explosion.image_xscale=2.5
        explosion.image_yscale=2.5
      }
      else
      {
        explosion.image_xscale=1.75
        explosion.image_yscale=1.75
      }
      playSound(global.snd_CASdie,0,1)
    }
    instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
