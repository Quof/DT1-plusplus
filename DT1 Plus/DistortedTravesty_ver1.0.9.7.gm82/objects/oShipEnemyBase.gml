#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
maxLife=100
life=maxLife
pointValue=1000
bDestroyIfOffScreen=0
bBoss=false
bossLives=1
bullet_Time=0
bHitWithBomb=0
timeout=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if life<=0 //----- ENEMY DEATH -----
  {
    if timeout=0
    {
      if bBoss=true
        pointValue+=(oPlayerShip.life*6000)+(oPlayerShip.bomb*2000)
      oPlayerShip.shooterCurrentScore+=pointValue
      if bBoss=true
        pointValue-=(oPlayerShip.life*6000)+(oPlayerShip.bomb*2000)
      for(i=0;i<pointItemAmt;i+=1) //point items
      {
        var dist,ang,xSpawn,ySpawn;
        dist=random(16)+4
        ang=random(360)
        xSpawn=x+lengthdir_x(dist,ang)
        ySpawn=y+lengthdir_y(dist,ang)
        instance_create(xSpawn,ySpawn,oShipPointItem)
      }
    }

    if bBoss=true //boss death
    {
      if bHitWithBomb=1
      {
        if pointItemAmt>1
          pointItemAmt=round(pointItemAmt*2)
        pointValue=round(pointValue*2)
        bHitWithBomb=0
      }
      if timeout=0
      {
        with oShipEnemyProjBase
          instance_change(oShipBossPointItem,true)
      }
      else
      {
        with oShipEnemyProjBase
        {
          effect_create_above(ef_ring,x,y,0,c_white)
          instance_destroy()
        }
      }
    }
    else
      playSound(global.snd_ShipShot,0,0.7,se_flanger)

    bossLives-=1
    if bossLives<=0
    {
      effect_create_above(ef_ring,x,y,0,c_white)
      instance_destroy()
    }
    else
    {
      effect_create_above(ef_ring,x,y,2,c_white)
      bullet_Time=0
      timeout=0
      maxLife=livesLife[bossLives]
      bossTimer.timeLeft=bossTime[bossLives]
      life=maxLife
    }
  }

  //enemy hit flash
  if image_blend=c_red
    image_blend=c_white

  //delete if off screen
  if bDestroyIfOffScreen=1
  {
    if x<-sprite_width-4
      instance_destroy()
    else if x>view_shooter_x+sprite_width+4
      instance_destroy()
    else if y<-sprite_height-4
      instance_destroy()
    else if y>room_height+sprite_height+4
      instance_destroy()
  }
}
#define Collision_oPlayerShip
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oPlayerShip.bCanTakeDamage=true and !instance_exists(oPlayerBomb)
{
  effect_create_above(ef_ring,x,y,2,c_red)
  oPlayerShip.damageTime=45
  oPlayerShip.bCanTakeDamage=false
  oPlayerShip.life-=1
  with oShipEnemyProjBase
  {
    effect_create_above(ef_ring,x,y,0,c_red)
    instance_destroy()
  }
}
#define Collision_oPlayerShooterShot
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_red
life-=100
oPlayerShip.shooterCurrentScore+=10
with other
  instance_destroy()
#define Collision_oPlayerBomb
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_red
life-=120
if bHitWithBomb=0
{
  if pointItemAmt>1
    pointItemAmt=round(pointItemAmt/2)
  pointValue=round(pointValue/2)
  bHitWithBomb=1
}
#define Collision_oPlayerShooterHomingShot
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=c_red
life-=50
oPlayerShip.shooterCurrentScore+=10
with other
  instance_destroy()
