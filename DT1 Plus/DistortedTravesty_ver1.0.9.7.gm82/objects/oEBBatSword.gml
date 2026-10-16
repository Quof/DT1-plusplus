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
    image_angle+=15
    if y>128
    {
      y-=2
      x+=xMove
    }
    else
    {
      bulletSpawnTime+=1
      if bulletSpawnTime>=20
      {
        effect_create_above(ef_ring,x,y,1,c_red)
        direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        image_angle=direction
        progress=1
      }
    }
  }
  else if progress=1
  {
    idleTime+=1
    if idleTime>=idleWait
      progress=2
  }
  else if progress=2
  {
    speed=3.5
    bulletSpawnTime+=1
    if bulletSpawnTime>=bulletSpawnWait
    {
      swordFlameL[e]=instance_create(x,y,oCannonBullet)
      swordFlameL[e].sprite_index=sALfireball
      swordFlameL[e].spiritPower=spiritPower
      swordFlameL[e].damageType="SPIRIT"
      swordFlameL[e].elementType=1
      swordFlameL[e].size=2
      swordFlameL[e].bulletSpeed=0
      swordFlameL[e].direction=direction
      swordFlameR[e]=instance_create(x,y,oCannonBullet)
      swordFlameR[e].sprite_index=sALfireball
      swordFlameR[e].spiritPower=spiritPower
      swordFlameR[e].damageType="SPIRIT"
      swordFlameR[e].elementType=1
      swordFlameR[e].size=2
      swordFlameR[e].bulletSpeed=0
      swordFlameR[e].direction=direction
      e+=1
      bulletSpawnTime=0
    }
  }
  else if progress=3
  {
    bulletSpawnTime+=1
    if bulletSpawnTime>=30
    {
      for(i=0;i<e;i+=1)
      {
        if instance_exists(swordFlameL[i])
        {
          swordFlameL[i].direction+=90
          swordFlameL[i].size=1
          swordFlameL[i].bulletSpeed=4
        }
        if instance_exists(swordFlameR[i])
        {
          swordFlameR[i].direction-=90
          swordFlameR[i].size=1
          swordFlameR[i].bulletSpeed=4
        }
      }
      instance_destroy()
    }
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
if progress=2
{
  visible=false
  bulletSpawnTime=0
  progress=3
}
