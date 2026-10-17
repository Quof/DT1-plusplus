#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
damageType="SPIRIT"
elementType=2
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //speed=spd
  _speed=spd //60fps change: moved by correctSpeedDirection (end of the step)
  //breakTime-=1
  breakTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if breakTime<=15 and breakTime mod 2=0 //warning flash
  if breakTime<=15 and scrModPassDown(breakTime,2) //warning flash //60fps change: each time the count reaches an even number
  {
    if image_blend=c_white
      image_blend=c_red
    else
      image_blend=c_white
  }
  if breakTime<=0 //break
  {
    dir=0
    for(i=0;i<8;i+=1)
    {
      iceShard=instance_create(x,y,oCASBullet)
      iceShard.damageType="SPIRIT"
      iceShard.elementType=2
      iceShard.spiritPower=spiritPower
      iceShard.sprite_index=sCXfrostShieldShard
      iceShard.bulletSpeed=8
      //iceShard.direction=dir
      iceShard._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      iceShard.image_angle=dir
      dir+=45
    }
    instance_destroy()
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
