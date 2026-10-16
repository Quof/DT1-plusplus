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
    changeTime+=1
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
    transformTime+=1
    if transformTime=1
    {
      xVel=0
      yVel=-4
      sprite_index=sShroudTransform
      image_speed=0
      image_index=0
    }
    else if transformTime=3
      image_index=1
    else if transformTime=5
      image_index=2
    else if transformTime=7
      image_index=3
    else if transformTime=9
      image_index=4
    else if transformTime=11
      image_index=5
    else if transformTime=13
      image_index=6
    else if transformTime=15
      image_index=5
    else if transformTime=17
      image_index=4
    else if transformTime=19
      image_index=3
    else if transformTime=21
      image_index=2
    else if transformTime=23
      image_index=7
    else if transformTime=25
      image_index=8
    else if transformTime=27
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
    transformTime+=1
    if transformTime=1
    {
      xVel=0
      sprite_index=sShroudDive1
      image_speed=0
      image_index=0
    }
    else if transformTime=3
      image_index=1
    else if transformTime=5
      image_index=2
    else if transformTime=7
      image_index=3
    else if transformTime=9
      image_index=4
    else if transformTime=11
      image_index=5
    else if transformTime=13
      image_index=6
    else if transformTime=15
    {
      transformTime=0
      bCanDealDamage=true
      attackMode=TYPE_DIVE
    }
  }
  else if attackMode=TYPE_DIVE //********** DIVE FORM **********
  {
    if transformTime>=2
      transformTime+=1
    if transformTime=0
    {
      if image_xscale=1 //go right
        xVel=3
      else //go left
        xVel=-3
      yVel=9
      transformTime=1
    }
    else if transformTime=3
    {
      xVel=0
      sprite_index=sShroudDive2
      image_index=0
    }
    else if transformTime=5
      image_index=1
    else if transformTime=7
      image_index=2
    else if transformTime=9
      image_index=3
    else if transformTime=11
      image_index=4
    else if transformTime=13
      image_index=5
    else if transformTime=15
    {
      sprite_index=sShroudTransform
      image_index=6
    }
    else if transformTime=17
      image_index=5
    else if transformTime=19
      image_index=4
    else if transformTime=21
      image_index=3
    else if transformTime=23
      image_index=2
    else if transformTime=25
      image_index=1
    else if transformTime=27
      image_index=0
    else if transformTime=29
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
      lungeTime+=1
    if lungeTime>=lungeWait
    {
      if lungeTime=lungeWait
      {
        xVel=0
        sprite_index=sShroudCrawlerIdle
        image_speed=0
        image_index=0
      }
      else if lungeTime=lungeWait+15 //start lunge
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
      else if lungeTime=lungeWait+30 //stop lunge
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
      diamondTime+=1
    if diamondTime>=diamondWait
    {
      if diamondTime=diamondWait
      {
        xVel=0
        image_speed=0
        image_index=3
      }
      else if diamondTime=diamondWait+15 //shoot diamond
      {
        image_index=2
        sDiamond=instance_create(x,y-32,oNpcSDiamond)
        sDiamond.damageType="SPIRIT"
        sDiamond.spiritPower=spiritPower
        sDiamond.cSize=2
        sDiamond.bulletSpeed=1
        eDistCheck=instance_nearest(x,y,oEnemyBase)
        if instance_exists(eDistCheck)
          sDiamond.direction=point_direction(x,y-32,eDistCheck.x,eDistCheck.y)
        else
          sDiamond.direction=random(360)
      }
      else if diamondTime=diamondWait+25 //revert to normal fly
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
    yVel+=0.4
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
  moveTo(xVel,yVel)
  if isCollisionSolid()
    y+=2

  if y>room_height+2
  {
    changeTime=irandom(20)
    y-=4
    attackMode=TYPE_FORM_AIR
  }
}
