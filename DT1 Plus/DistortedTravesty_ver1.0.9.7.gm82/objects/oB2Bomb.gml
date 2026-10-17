#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-3,-4,3,4)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
effectDelay=0
weight=50
bBlownUp=false
grav=1.25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//60fps change: _speed/_direction instead of GM's speed/direction (moved by correctSpeedDirection at the end; oB2SpiritPlane
//sets _direction); the turn, the fall and the smoke are per 30fps tick
if global.gamePaused=false
{
  //speed=bulletSpeed
  _speed=bulletSpeed
  //if effectDelay=0
  if effectDelay<=0
  {
    effect_create_above(ef_smoke,x,y,0,c_gray)
    //effectDelay=2
    effectDelay=3-gDeltaTime //(a puff every 3 30fps ticks: this frame counts as a whole tick, as at 30fps)
  }
  else
    //effectDelay-=1
    effectDelay-=gDeltaTime

  //if direction>270
  if _direction>270
  {
    //if direction>290
    //  direction-=2
    if _direction>290
      _direction-=2*gDeltaTime
  }
  else
  {
    //if direction<250
    //  direction+=2
    if _direction<250
      _direction+=2*gDeltaTime
  }
  //y+=grav
  //image_angle=direction
  y+=grav*gDeltaTime
  image_angle=_direction
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
    explosion=instance_create(x,y+6,oGASGExplosion)
    if damageType="PHYSICAL"
      explosion.physicalPower=physicalPower
    else if damageType="SPIRIT"
    {
      explosion.spiritPower=spiritPower
      explosion.damageType="SPIRIT"
    }
    explosion.sprite_index=sALfirePillar
    explosion.image_speed=0.75
    playSound(global.snd_CASdie,0,1)
    instance_destroy()
  }
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime)

  if y>room_height+32
    instance_destroy()
}
else
  //speed=0
  _speed=0
correctSpeedDirection(id) //60fps change (added): this frame's share of the move GM's speed made
