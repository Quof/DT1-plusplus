#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.difficulty=1
  laserAtkDelay=500
else if global.difficulty=2
  laserAtkDelay=470
else if global.difficulty=3
  laserAtkDelay=440
else if global.difficulty=4
  laserAtkDelay=410
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //laserAtkTime+=1
  laserAtkTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if laserAtkTime>=laserAtkDelay and laserAtkTime<=laserAtkDelay+39
  if laserAtkTime>=laserAtkDelay and laserAtkTime<=laserAtkDelay+39 and gDeltaDoTicks //60fps change: the effect once per 30fps tick
    effect_create_above(ef_ring,x,y,0,c_maroon)
  else if laserAtkTime>=laserAtkDelay+40
  {
    var bulletDir;
    bulletDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
    for(i=0;i<5;i+=1)
    {
      newBullet=instance_create(x,y,oMMeShot1)
      newBullet.sprite_index=sEbulletLarge
      newBullet.damageType="SPIRIT"
      newBullet.spiritPower=oMitra.spiritPower
      newBullet.bulletSpeed=4
      //newBullet.direction=bulletDir
      newBullet._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      bulletDir+=360/5
    }
    laserAtkTime=0
  }
}
