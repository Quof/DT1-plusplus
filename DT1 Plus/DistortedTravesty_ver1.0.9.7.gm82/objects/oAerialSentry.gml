#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-14,-28,14,-1)
baseColor=make_color_rgb(200,255,200)
image_blend=baseColor
image_speed=0.25

//Enemy base statistics
eName="Aerial Sentry"
maxLife=1080
life=maxLife
expWorth=3200
physicalPower=500
physicalDefense=180
spiritPower=300
spiritDefense=220
FIREresist=20
WATERresist=70
WINDresist=-75
EARTHresist=60
baseItemChance=65
dropInd=-10
moneyWorth=195
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
runAcc=2
maxProximity=144
if global.difficulty=1
{
  reShootTime=75
  missileWait=220
}
else if global.difficulty=2
{
  reShootTime=65
  missileWait=215
}
else if global.difficulty=3
{
  reShootTime=60
  missileWait=210
}
else if global.difficulty=4
{
  reShootTime=50
  missileWait=200
}
shootTime=reShootTime-15
missileTime=30
multiShot=0
shotAmount=-1
difficultyAdjustments(global.difficulty)
combatText="The aerial unit. It's job is to support every other unit and give out alerts. It specifically supports the Static Sentry and Data Bomb Launcher. It's weapon works much like the Mobile Sentry except it can fire directly at you. When you see it create a ring, it is going to fire a high power missile at crazy speeds. Get out of the way, it has a Data Bomb effect."
sideText="Like the Mobile Sentry, if you get too close to the Static Sentry, it will fire twice as fast. If you get too close to the Data Bomb Launcher, it will fire bullets in a wave like form. This stacks with it's burst fire, which just creates are large cluster of bullets. Another issue with these, if there are no Static Sentries or Data Bomb Launchers around, it fires its missile much more frequently."
cripplePointText=">Full Swing#>Upward Strike"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if multiShot!=5 and shootTime<reShootTime-10 //keep enemy shooting in one direction during a rapid shot
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }

    //distance check
    distCheck=instance_nearest(x,y,oStaticSentry)
    if instance_exists(distCheck)
    {
      if point_distance(oPlayer1.x,0,distCheck.x,0)<128
        maxProximity=72
      else
        maxProximity=144
    }
    else
      maxProximity=144

    if point_distance(x,0,oPlayer1.x,0)>maxProximity*1.4
    {
      if x>oPlayer1.x //go left
        xVel=-runAcc*2
      else //go right
        xVel=runAcc*2

      //fly smoke effect
      if x>oCharacter.x
        offsetShotX=11
      else
        offsetShotX=-11
      if gDeltaDoTicks //60fps change (added): the smoke once per 30fps tick
        effect_create_above(ef_smoke,x+offsetShotX,y-10,0,c_gray)
    }
    else if point_distance(x,0,oPlayer1.x,0)>maxProximity and point_distance(x,0,oPlayer1.x,0)<maxProximity*1.4
    {
      if x>oPlayer1.x //go left
        xVel=-runAcc
      else //go right
        xVel=runAcc
    }
    else
    {
      if collision_circle(x,y,512,oAerialSentry,0,1)
      {
        if x>oPlayer1.x //go right (away from player)
          xVel=runAcc/2
        else //go left (away from player)
          xVel=-runAcc/2
      }
      else
      {
        if x>oPlayer1.x //go right (away from player)
          xVel=runAcc*1.25
        else //go left (away from player)
          xVel=-runAcc*1.25
      }
    }
    if point_distance(x,0,oPlayer1.x,0)>maxProximity-3 and point_distance(x,0,oPlayer1.x,0)<maxProximity+3
      xVel=0

    if shootTime<reShootTime-11
    {
      var idCheck;
      idCheck=instance_nearest(x,y,oStaticSentry)
      if instance_exists(idCheck)
      {
        if point_distance(oPlayer1.x,0,idCheck.x,0)<80
          //shootTime+=1
          shootTime+=gDeltaTime //60fps change: counts 30fps ticks
      }
    }
    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if shootTime=reShootTime-10 //ready bullets
    if scrCountPass(shootTime,reShootTime-10) //ready bullets //60fps change: once, when the count reaches it
    {
      if x>oCharacter.x
        offsetShotX=-14
      else
        offsetShotX=14
      bulletDir=point_direction(x+offsetShotX,y-4,oPlayer1.x,oPlayer1.y-26)
      if multiShot=4
        effect_create_above(ef_spark,x+offsetShotX,y-4,2,c_fuchsia)
      else
        effect_create_above(ef_spark,x+offsetShotX,y-4,1,c_fuchsia)
    }
    if shootTime>=reShootTime //fire at player
    {
      playSound(global.snd_CASgun,0,0.85)
      newAttack=instance_create(x+offsetShotX,y-4,oCASBullet)
      newAttack.physicalPower=physicalPower
      newAttack.bulletSpeed=8
      //newAttack.direction=bulletDir
      newAttack._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      var idCheck;
      idCheck=instance_nearest(x,y,oDataBombLauncher)
      if instance_exists(idCheck)
      {
        if point_distance(oPlayer1.x,0,idCheck.x,0)<96
        {
          newAttack=instance_create(x+offsetShotX,y-4,oCASBullet)
          newAttack.physicalPower=physicalPower
          newAttack.bulletSpeed=7.5
          //newAttack.direction=bulletDir+6
          newAttack._direction=bulletDir+6 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          if shotAmount>5 //burst fire spray
          {
            burstFire=round(random(16)-8)
            //newAttack.direction+=burstFire
            newAttack._direction+=burstFire //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          newAttack=instance_create(x+offsetShotX,y-4,oCASBullet)
          newAttack.physicalPower=physicalPower
          newAttack.bulletSpeed=7.5
          //newAttack.direction=bulletDir-6
          newAttack._direction=bulletDir-6 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          if shotAmount>5 //burst fire spray
          {
            burstFire=round(random(16)-8)
            //newAttack.direction+=burstFire
            newAttack._direction+=burstFire //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
        }
      }

      if shotAmount>5 //burst fire spray
      {
        burstFire=round(random(16)-8)
        //newAttack.direction+=burstFire
        newAttack._direction+=burstFire //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
      //rapid shot
      if multiShot<4
      {
        var idCheck;
        idCheck=instance_nearest(x,y,oStaticSentry)
        if instance_exists(idCheck)
        {
          if point_distance(oPlayer1.x,0,idCheck.x,0)<40
            multiShot+=1
        }
      }
      multiShot+=1
      if multiShot=5
      {
        reShootTime=1
        shotAmount=round(random(3)+2+multiShot)
      }
      else if multiShot=shotAmount
      {
        shootTime=-20
        reShootTime=55
        multiShot=0
        shotAmount=-1
      }
      shootTime=0
    }
    //----- missile attack -----
    //60fps change: counts 30fps ticks (each +=1 is +=gDeltaTime)
    missileTime+=gDeltaTime
    dblCheck=instance_nearest(x,y,oDataBombLauncher)
    if instance_exists(dblCheck)
    {
      if point_distance(x,0,dblCheck.x,0)>512
        missileTime+=gDeltaTime
    }
    else
      missileTime+=gDeltaTime
    if missileTime<=missileWait-12
    {
      ssCheck=instance_nearest(x,y,oStaticSentry)
      if instance_exists(ssCheck)
      {
        if point_distance(x,0,ssCheck.x,0)>512
          missileTime+=gDeltaTime
      }
      else
        missileTime+=gDeltaTime
    }
    //if missileTime>=missileWait-12 and missileTime<=missileWait //ready missile
    if missileTime>=missileWait-12 and missileTime<=missileWait and gDeltaDoTicks //ready missile //60fps change: the effect once per 30fps tick
      effect_create_above(ef_ring,x,y,0,c_aqua)
    if missileTime>=missileWait //fire missile
    {
      if x>oCharacter.x
        offsetShotX=-14
      else
        offsetShotX=14
      missileDir=point_direction(x+offsetShotX,y-4,oPlayer1.x,oPlayer1.y-26)
      playSound(global.snd_GASlaunch,0,0.9)
      effect_create_above(ef_ring,x,y,1,c_aqua)
      newAttack=instance_create(x+offsetShotX,y-4,oBTurretShot)
      newAttack.physicalPower=physicalPower
      newAttack.sprite_index=sSubMissile
      newAttack.bulletSpeed=10
      //newAttack.direction=missileDir
      newAttack._direction=missileDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      newAttack.image_angle=missileDir
      missileTime=0
    }

    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2

    if y>room_height+30
      instance_destroy()
  }
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
    inflictStatus(0)
}
