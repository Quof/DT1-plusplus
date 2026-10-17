#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-8,-22,8,-1)
image_speed=0.33
global.recSummonsUsed+=1
summonRotate=0
summonCircle=0.1

init=0
lifeTime=900
skillPower=0
bSummoning=true
summonTime=25
oPlayer1.bCanTakeDamage=false
fallTime=24 //how long to fall when summoned
attackTime=90 //time till next attack
attacking=-1 //time in attack pose, keeps the summon from moving when attacking
//global.VDportals[3]=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bSummoning=true
  {
    if summonCircle<0.6
      //summonCircle+=0.05
      summonCircle+=0.05*gDeltaTime //60fps change: per 30fps tick
    //summonRotate+=5
    summonRotate+=5*gDeltaTime //60fps change: per 30fps tick
    //summonTime-=1
    summonTime-=gDeltaTime //60fps change: counts 30fps ticks
    if summonTime<=0
    {
      x=oPlayer1.x
      y=oPlayer1.y-96
      sprite_index=sMuuguruFall
      bSummoning=false
      oPlayer1.bCanTakeDamage=true
      //return the character to a non-attack state
      oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
      oPlayer1.attackState=0
    }
  }
  else
  {
    if init=0 //-------------------- fall --------------------
    {
      //y+=4
      y+=4*gDeltaTime //60fps change: per 30fps tick
      //fallTime-=1
      fallTime-=gDeltaTime //60fps change: counts 30fps ticks
      if fallTime<=0
      {
        init=1
        image_speed=0.2
        sprite_index=sMuuguruFlip
        image_index=0
      }
    }
    else if init=1 //-------------------- flip --------------------
    {
      //if image_index=4
      if image_index>=4 //60fps change: the animation steps are smaller above 30fps and may not land exactly on 4
      {
        image_speed=0
        init=2
      }
    }
    else if init=2 //-------------------- pose --------------------
    {
      //fallTime+=1
      fallTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if fallTime=8
      if scrCountPass(fallTime,8) //60fps change: once, when the count reaches it
      {
        effect_create_below(ef_ring,x,y-12,1,c_blue)
        sprite_index=sMuuguruAttack
        var wSparkDir;
        wSparkDir=0
        for(i=0;i<8;i+=1)
        {
          newSpark=instance_create(x,y-12,oMuuguruWaterSpark)
          newSpark.bulletSpeed=9
          //newSpark.direction=wSparkDir
          newSpark._direction=wSparkDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          wSparkDir+=45
        }
      }
      else if fallTime>=20
      {
        image_speed=0.33
        sprite_index=sMuuguruIdle
        init=3
      }
    }
    else if init=3 //-------------------- normal actions --------------------
    {
      //attackTime-=1
      attackTime-=gDeltaTime //60fps change: counts 30fps ticks
      if attackTime<=0 and yVel=0 //attacking
      {
        if attacking=-1
        {
          if instance_exists(oEnemyBase)
          {
            xVel=0
            sprite_index=sMuuguruAttack
            var enemyCheck;
            enemyCheck=instance_nearest(x,y-12,oEnemyBase)
            newSpark=instance_create(x,y-12,oMuuguruWaterSpark)
            newSpark.bulletSpeed=7
            //newSpark.direction=point_direction(x,y-12,enemyCheck.x,enemyCheck.y)
            newSpark._direction=point_direction(x,y-12,enemyCheck.x,enemyCheck.y) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            attacking=15
          }
          else
          {
            attacking=-1
            attackTime=90
          }
        }

        //if attacking=0
        if scrCountPassDown(attacking,0) //60fps change: once, when the count (down) reaches 0 (-1 means not attacking)
        {
          attacking=-1
          attackTime=90
        }
        else if attacking>0
          //attacking-=1
          attacking-=gDeltaTime //60fps change: counts 30fps ticks
      }

      if attacking=-1
      {
        distX=point_distance(x,0,oPlayer1.x,0)
        //distY=point_distance(0,y,0,oPlayer1.y)
        if distX>48
        {
          if x<oPlayer1.x //left of player
          {
            sprite_index=sMuuguruRun
            image_xscale=1
            xVel=5
          }
          else
          {
            sprite_index=sMuuguruRun
            image_xscale=-1
            xVel=-5
          }
        }
        else
        {
          sprite_index=sMuuguruIdle
          xVel=0
        }

        if yVel<0
        {
          sprite_index=sMuuguruFlip
          image_speed=0
          image_index=1
        }
        else if yVel>0
        {
          sprite_index=sMuuguruFall
          image_speed=0.33
        }
      }

      //yVel+=0.201
      yVel=scrGravAcc(yVel,0.201,1) //60fps change: gravity per 30fps tick, following the 30fps arc
      if isCollisionBottom(1)
        yVel=0
      if isCollisionLeft(1)
      {
        xVel=0
        if x>oPlayer1.x and yVel=0 and attacking=-1
        {
          y-=4
          yVel=-6
        }
      }
      if isCollisionRight(1)
      {
        xVel=0
        if x<oPlayer1.x and yVel=0 and attacking=-1
        {
          y-=4
          yVel=-6
        }
      }
      //moveTo(xVel,yVel)
      moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

      //lifeTime-=1
      lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
      if lifeTime<=0
        instance_destroy()

      if y>room_height+24
      {
        x=oPlayer1.x
        y=oPlayer1.y-24
        yVel=2
        effect_create_below(ef_ring,x,y-12,0,c_blue)
      }
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bSummoning=true
{
  draw_set_blend_mode(bm_add)
  draw_sprite_ext(sShipFocusEffect,-1,oPlayer1.x,oPlayer1.y-26,summonCircle,summonCircle,summonRotate,c_white,0.25)
  draw_set_blend_mode(bm_normal)
}
else
  draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,image_angle,image_blend,image_alpha)
