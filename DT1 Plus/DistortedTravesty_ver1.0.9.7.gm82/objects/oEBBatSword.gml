#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
size=2
progress=0
if global.difficulty=1
{
  idleWait=25
  bulletSpawnWait=20-oEnflamedBlazingBat.swordFire
}
else if global.difficulty=2
{
  idleWait=15
  bulletSpawnWait=16-oEnflamedBlazingBat.swordFire
}
else if global.difficulty=3
{
  idleWait=10
  bulletSpawnWait=12-oEnflamedBlazingBat.swordFire
}
else if global.difficulty=4
{
  idleWait=5
  bulletSpawnWait=8-oEnflamedBlazingBat.swordFire
}
idleTime=0
bulletSpawnTime=0
e=0
xMove=choose(-1.5,0,1.5)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if progress=0
  {
    //image_angle+=15
    image_angle+=15*gDeltaTime //60fps change: per 30fps tick
    if y>128
    {
      //y-=2
      y-=2*gDeltaTime //60fps change: per 30fps tick
      //x+=xMove
      x+=xMove*gDeltaTime //60fps change: per 30fps tick
    }
    else
    {
      //bulletSpawnTime+=1
      bulletSpawnTime+=gDeltaTime //60fps change: counts 30fps ticks
      if bulletSpawnTime>=20
      {
        effect_create_above(ef_ring,x,y,1,c_red)
        //direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        _direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26) //60fps change: _direction stands in for direction (see correctSpeedDirection)
        //image_angle=direction
        image_angle=_direction //60fps change: see above
        progress=1
      }
    }
  }
  else if progress=1
  {
    //idleTime+=1
    idleTime+=gDeltaTime //60fps change: counts 30fps ticks
    if idleTime>=idleWait
      progress=2
  }
  else if progress=2
  {
    //speed=3.5
    _speed=3.5 //60fps change: moved by correctSpeedDirection (end of the step)
    //bulletSpawnTime+=1
    bulletSpawnTime+=gDeltaTime //60fps change: counts 30fps ticks
    if bulletSpawnTime>=bulletSpawnWait
    {
      swordFlameL[e]=instance_create(x,y,oCannonBullet)
      swordFlameL[e].sprite_index=sALfireball
      swordFlameL[e].spiritPower=spiritPower
      swordFlameL[e].damageType="SPIRIT"
      swordFlameL[e].elementType=1
      swordFlameL[e].size=2
      swordFlameL[e].bulletSpeed=0
      //swordFlameL[e].direction=direction
      swordFlameL[e]._direction=_direction //60fps change: see above
      swordFlameR[e]=instance_create(x,y,oCannonBullet)
      swordFlameR[e].sprite_index=sALfireball
      swordFlameR[e].spiritPower=spiritPower
      swordFlameR[e].damageType="SPIRIT"
      swordFlameR[e].elementType=1
      swordFlameR[e].size=2
      swordFlameR[e].bulletSpeed=0
      //swordFlameR[e].direction=direction
      swordFlameR[e]._direction=_direction //60fps change: see above
      e+=1
      bulletSpawnTime=0
    }
  }
  else if progress=3
  {
    //bulletSpawnTime+=1
    bulletSpawnTime+=gDeltaTime //60fps change: counts 30fps ticks
    if bulletSpawnTime>=30
    {
      for(i=0;i<e;i+=1)
      {
        if instance_exists(swordFlameL[i])
        {
          //swordFlameL[i].direction+=90
          swordFlameL[i]._direction+=90 //60fps change: see above
          swordFlameL[i].size=1
          swordFlameL[i].bulletSpeed=4
        }
        if instance_exists(swordFlameR[i])
        {
          //swordFlameR[i].direction-=90
          swordFlameR[i]._direction-=90 //60fps change: see above
          swordFlameR[i].size=1
          swordFlameR[i].bulletSpeed=4
        }
      }
      instance_destroy()
    }
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
if progress=2
{
  visible=false
  bulletSpawnTime=0
  progress=3
}
