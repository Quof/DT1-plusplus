#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
bCanDealDamage=false
y+=1
makeActive()
setCollisionBounds(-24,-42,24,-1)
animSpeed=0.26
image_speed=animSpeed
currentSpell="NPC"

physicalPower=410+(round(oPlayer1.level*2))
spiritPower=390+(round(oPlayer1.level*1.5))

runAcc=3
lungeWait=50
diamondWait=65
diveBombs=5

changeWait=270
lungeTime=irandom(30)
diamondTime=irandom(30)
changeTime=irandom(20)
transformTime=0

TYPE_GROUND=1
TYPE_AIR=2
TYPE_DIVE=3
TYPE_FORM_GROUND=4
TYPE_FORM_AIR=5
attackMode=TYPE_GROUND

maxProximity=96
if room=rPrimaryMemory4
  maxXDist=10000
else if room=rPrimaryMemory6 or room=rBR_MechaGuardian
  maxXDist=1712
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if spawnCount>0
{
  spawnCount-=1
  sBuddy[spawnCount]=instance_create(x+64,y,oNpcShroud)
  sBuddy[spawnCount].spawnCount=spawnCount
  sBuddy[spawnCount].changeTime=changeWait-70+irandom(60)
  sBuddy[spawnCount].spawnerId=id
}
else
  playSound(global.snd_DemonLaugh,0,1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if diamondTime<diamondWait
    //changeTime+=1
    changeTime+=gDeltaTime //60fps change: counts 30fps ticks
  if changeTime>=changeWait //change
  {
    if attackMode=TYPE_GROUND and lungeTime<lungeWait-2 and lungeTime>4
    {
      changeTime=irandom(20)
      y-=4
      attackMode=TYPE_FORM_AIR
    }
    else if attackMode=TYPE_AIR and diamondTime<diamondWait-2 and diamondTime>4
    {
      changeTime=irandom(20)
      attackMode=TYPE_FORM_GROUND
    }
  }

  if attackMode=TYPE_FORM_AIR //********** CHANGE INTO AIR FORM **********
  {
    //transformTime+=1
    transformTime+=gDeltaTime //60fps change: counts 30fps ticks
    if transformTime=1
    {
      xVel=0
      yVel=-4
      sprite_index=sShroudTransform
      image_speed=0
      image_index=0
    }
    //else if transformTime=3
    else if scrCountPass(transformTime,3) //60fps change: once, when the count reaches it
      image_index=1
    //else if transformTime=5
    else if scrCountPass(transformTime,5) //60fps change: once, when the count reaches it
      image_index=2
    //else if transformTime=7
    else if scrCountPass(transformTime,7) //60fps change: once, when the count reaches it
      image_index=3
    //else if transformTime=9
    else if scrCountPass(transformTime,9) //60fps change: once, when the count reaches it
      image_index=4
    //else if transformTime=11
    else if scrCountPass(transformTime,11) //60fps change: once, when the count reaches it
      image_index=5
    //else if transformTime=13
    else if scrCountPass(transformTime,13) //60fps change: once, when the count reaches it
      image_index=6
    //else if transformTime=15
    else if scrCountPass(transformTime,15) //60fps change: once, when the count reaches it
      image_index=5
    //else if transformTime=17
    else if scrCountPass(transformTime,17) //60fps change: once, when the count reaches it
      image_index=4
    //else if transformTime=19
    else if scrCountPass(transformTime,19) //60fps change: once, when the count reaches it
      image_index=3
    //else if transformTime=21
    else if scrCountPass(transformTime,21) //60fps change: once, when the count reaches it
      image_index=2
    //else if transformTime=23
    else if scrCountPass(transformTime,23) //60fps change: once, when the count reaches it
      image_index=7
    //else if transformTime=25
    else if scrCountPass(transformTime,25) //60fps change: once, when the count reaches it
      image_index=8
    //else if transformTime=27
    else if scrCountPass(transformTime,27) //60fps change: once, when the count reaches it
    {
      image_index=0
      image_speed=animSpeed
      transformTime=0
      yVel=0
      sprite_index=sShroudFlyerIdle
      attackMode=TYPE_AIR
    }
  }
  else if attackMode=TYPE_FORM_GROUND //********** CHANGE INTO GROUND FORM **********
  {
    //transformTime+=1
    transformTime+=gDeltaTime //60fps change: counts 30fps ticks
    if transformTime=1
    {
      xVel=0
      sprite_index=sShroudDive1
      image_speed=0
      image_index=0
    }
    //else if transformTime=3
    else if scrCountPass(transformTime,3) //60fps change: once, when the count reaches it
      image_index=1
    //else if transformTime=5
    else if scrCountPass(transformTime,5) //60fps change: once, when the count reaches it
      image_index=2
    //else if transformTime=7
    else if scrCountPass(transformTime,7) //60fps change: once, when the count reaches it
      image_index=3
    //else if transformTime=9
    else if scrCountPass(transformTime,9) //60fps change: once, when the count reaches it
      image_index=4
    //else if transformTime=11
    else if scrCountPass(transformTime,11) //60fps change: once, when the count reaches it
      image_index=5
    //else if transformTime=13
    else if scrCountPass(transformTime,13) //60fps change: once, when the count reaches it
      image_index=6
    //else if transformTime=15
    else if scrCountPass(transformTime,15) //60fps change: once, when the count reaches it
    {
      transformTime=0
      bCanDealDamage=true
      attackMode=TYPE_DIVE
    }
  }
  else if attackMode=TYPE_DIVE //********** DIVE FORM **********
  {
    if transformTime>=2
      //transformTime+=1
      transformTime+=gDeltaTime //60fps change: counts 30fps ticks
    if transformTime=0
    {
      if image_xscale=1 //go right
        xVel=3
      else //go left
        xVel=-3
      yVel=9
      transformTime=1
    }
    //else if transformTime=3
    else if scrCountPass(transformTime,3) //60fps change: once, when the count reaches it
    {
      xVel=0
      sprite_index=sShroudDive2
      image_index=0
    }
    //else if transformTime=5
    else if scrCountPass(transformTime,5) //60fps change: once, when the count reaches it
      image_index=1
    //else if transformTime=7
    else if scrCountPass(transformTime,7) //60fps change: once, when the count reaches it
      image_index=2
    //else if transformTime=9
    else if scrCountPass(transformTime,9) //60fps change: once, when the count reaches it
      image_index=3
    //else if transformTime=11
    else if scrCountPass(transformTime,11) //60fps change: once, when the count reaches it
      image_index=4
    //else if transformTime=13
    else if scrCountPass(transformTime,13) //60fps change: once, when the count reaches it
      image_index=5
    //else if transformTime=15
    else if scrCountPass(transformTime,15) //60fps change: once, when the count reaches it
    {
      sprite_index=sShroudTransform
      image_index=6
    }
    //else if transformTime=17
    else if scrCountPass(transformTime,17) //60fps change: once, when the count reaches it
      image_index=5
    //else if transformTime=19
    else if scrCountPass(transformTime,19) //60fps change: once, when the count reaches it
      image_index=4
    //else if transformTime=21
    else if scrCountPass(transformTime,21) //60fps change: once, when the count reaches it
      image_index=3
    //else if transformTime=23
    else if scrCountPass(transformTime,23) //60fps change: once, when the count reaches it
      image_index=2
    //else if transformTime=25
    else if scrCountPass(transformTime,25) //60fps change: once, when the count reaches it
      image_index=1
    //else if transformTime=27
    else if scrCountPass(transformTime,27) //60fps change: once, when the count reaches it
      image_index=0
    //else if transformTime=29
    else if scrCountPass(transformTime,29) //60fps change: once, when the count reaches it
    {
      image_index=0
      image_speed=animSpeed
      transformTime=0
      sprite_index=sShroudCrawlerIdle
      bCanDealDamage=false
      attackMode=TYPE_GROUND
    }
  }
  else if attackMode=TYPE_GROUND //********** GROUND FORM **********
  {
    if instance_exists(oEnemyBase) or lungeTime>=lungeWait
      //lungeTime+=1
      lungeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if lungeTime>=lungeWait
    {
      //if lungeTime=lungeWait
      if scrCountPass(lungeTime,lungeWait) //60fps change: once, when the count reaches it
      {
        xVel=0
        sprite_index=sShroudCrawlerIdle
        image_speed=0
        image_index=0
      }
      //else if lungeTime=lungeWait+15 //start lunge
      else if scrCountPass(lungeTime,lungeWait+15) //start lunge //60fps change: once, when the count reaches it
      {
        bCanDealDamage=true
        sprite_index=sShroudCrawlerAttack
        y-=2
        yVel=-2
        if image_xscale=1 //go right
          xVel=runAcc*3
        else //go left
          xVel=-runAcc*3
      }
      //else if lungeTime=lungeWait+30 //stop lunge
      else if lungeTime>=lungeWait+30 //stop lunge //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
      {
        bCanDealDamage=false
        xVel=0
        lungeTime=irandom(10)
        image_speed=animSpeed
      }
    }
    else //not lunging
    {
      if xVel=0
        sprite_index=sShroudCrawlerIdle
      else
        sprite_index=sShroudCrawlerWalk

      eDistCheck=instance_nearest(x,y,oEnemyBase)
      if instance_exists(eDistCheck)
      {
        if point_distance(x,0,eDistCheck.x,0)<maxProximity*3 //enemy close by
        {
          if x>eDistCheck.x //face left
          {
            xVel=-runAcc
            image_xscale=-1
          }
          else //face right
          {
            xVel=runAcc
            image_xscale=1
          }
        }
        else //no enemies around
        {
          if point_distance(x,0,oPlayer1.x,0)>maxProximity
          {
            if x>oPlayer1.x //face left
            {
              xVel=-runAcc
              image_xscale=-1
            }
            else //face right
            {
              xVel=runAcc
              image_xscale=1
            }
          }
          else
            xVel=0
        }
      }
      else
      {
        if point_distance(x,0,oPlayer1.x,0)>maxProximity
        {
          if x>oPlayer1.x //face left
          {
            xVel=-runAcc
            image_xscale=-1
          }
          else //face right
          {
            xVel=runAcc
            image_xscale=1
          }
        }
        else
          xVel=0
      }
    }
  }
  else if attackMode=TYPE_AIR //********** AIR FORM **********
  {
    if instance_exists(oEnemyBase) or diamondTime>=diamondWait
      //diamondTime+=1
      diamondTime+=gDeltaTime //60fps change: counts 30fps ticks
    if diamondTime>=diamondWait
    {
      //if diamondTime=diamondWait
      if scrCountPass(diamondTime,diamondWait) //60fps change: once, when the count reaches it
      {
        xVel=0
        image_speed=0
        image_index=3
      }
      //else if diamondTime=diamondWait+15 //shoot diamond
      else if scrCountPass(diamondTime,diamondWait+15) //shoot diamond //60fps change: once, when the count reaches it
      {
        image_index=2
        sDiamond=instance_create(x,y-32,oNpcSDiamond)
        sDiamond.damageType="SPIRIT"
        sDiamond.spiritPower=spiritPower
        sDiamond.cSize=2
        sDiamond.bulletSpeed=1
        eDistCheck=instance_nearest(x,y,oEnemyBase)
        if instance_exists(eDistCheck)
          //sDiamond.direction=point_direction(x,y-32,eDistCheck.x,eDistCheck.y)
          sDiamond._direction=point_direction(x,y-32,eDistCheck.x,eDistCheck.y) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        else
          //sDiamond.direction=random(360)
          sDiamond._direction=random(360) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
      //else if diamondTime=diamondWait+25 //revert to normal fly
      else if diamondTime>=diamondWait+25 //revert to normal fly //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
      {
        diamondTime=irandom(10)
        image_speed=animSpeed
      }
    }
    else //not firing diamond
    {
      eDistCheck=instance_nearest(x,y,oEnemyBase)
      if instance_exists(eDistCheck)
      {
        if point_distance(x,0,eDistCheck.x,0)<maxProximity*3 //enemy close by
        {
          if x>eDistCheck.x //face left
          {
            xVel=-runAcc/1.8
            image_xscale=-1
          }
          else //face right
          {
            xVel=runAcc/1.8
            image_xscale=1
          }
        }
        else //no enemies around
        {
          if point_distance(x,0,oPlayer1.x,0)>maxProximity
          {
            if x>oPlayer1.x //face left
            {
              xVel=-runAcc/1.2
              image_xscale=-1
            }
            else //face right
            {
              xVel=runAcc/1.2
              image_xscale=1
            }
          }
          else
            xVel=0
        }
      }
      else
      {
        if point_distance(x,0,oPlayer1.x,0)>maxProximity
        {
          if x>oPlayer1.x //face left
          {
            xVel=-runAcc/1.2
            image_xscale=-1
          }
          else //face right
          {
            xVel=runAcc/1.2
            image_xscale=1
          }
        }
        else
          xVel=0
      }
    }
  }

  if attackMode=TYPE_GROUND or attackMode=TYPE_DIVE
    //yVel+=0.4
    yVel=scrGravAcc(yVel,0.4,1) //60fps change: gravity per 30fps tick, following the 30fps arc
  if isCollisionTop(1)
  {
    if attackMode!=TYPE_DIVE
      yVel=0
  }
  if isCollisionBottom(1)
  {
    yVel=0
    if attackMode=TYPE_DIVE and transformTime=1
    {
      var xShoot,yShoot;
      xShoot=1
      yShoot=-4
      for(i=0;i<diveBombs;i+=1)
      {
        newAttack=instance_create(x,y-8,oNpcSBomb)
        newAttack.image_blend=c_purple
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.xVel=xShoot
        newAttack.yVel=yShoot
        newAttack=instance_create(x,y-8,oNpcSBomb)
        newAttack.image_blend=c_purple
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.xVel=-xShoot
        newAttack.yVel=yShoot
        xShoot+=0.65
        yShoot-=1.1
      }
      transformTime=2
      xVel=0
    }
  }
  if isCollisionLeft(1)
    xVel=runAcc
  if isCollisionRight(1) or x>maxXDist
    xVel=-runAcc
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  //if isCollisionSolid()
  if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
    y+=2

  if y>room_height+2
  {
    changeTime=irandom(20)
    y-=4
    attackMode=TYPE_FORM_AIR
  }
}
