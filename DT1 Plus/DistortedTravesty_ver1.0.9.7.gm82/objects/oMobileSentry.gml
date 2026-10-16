#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-14,-28,14,-1)
image_speed=0.25
baseColor=make_color_rgb(255,200,200)
image_blend=baseColor

//Enemy base statistics
eName="Mobile Sentry"
maxLife=1220
life=maxLife
expWorth=3000
physicalPower=500
physicalDefense=190
spiritPower=300
spiritDefense=210
FIREresist=-60
WATERresist=40
WINDresist=60
EARTHresist=20
skillResist=5
baseItemChance=65
dropInd=-10
moneyWorth=185
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
runAcc=3
runTime=0
changeTime=round(random(20)+15)
bTooFar=false
bReadyToShoot=false
if global.difficulty=1
  reShootTime=75
else if global.difficulty=2
  reShootTime=70
else if global.difficulty=3
  reShootTime=60
else if global.difficulty=4
  reShootTime=55
shootTime=reShootTime-15
multiShot=0
shotAmount=-1
difficultyAdjustments(global.difficulty)
combatText="This is the mobile ground unit. It's job is to seek and destroy a target. It has a basic gun that isn't too threatening on it's own, but it also has a burst fire function. Luckily when it uses that, it has to cool down longer."
sideText="It is linked to the Static ground unit. Getting too close to a Static unit will cause these to fire at twice their normal speed as well as use their burst fire more often."
cripplePointText=">Thrust Attack#>Downward Strike"
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

    if findTargetX>detectDistX*2 //force enemy to run after the player if they get too far
    {
      bReadyToShoot=false
      bTooFar=true
    }
    if bTooFar=true //move closer to player if they run too far
    {
      runTime=changeTime-2
      if findTargetX<detectDistX/1.25 //stop when enemy gets close enough
        bTooFar=false
    }
    if multiShot!=5
      runTime+=1
    if runTime>=changeTime //start run
    {
      if bReadyToShoot=false
      {
        changeTime=round(random(240)+120)
        bReadyToShoot=true
      }
      else
      {
        changeTime=round(random(20)+15)
        bReadyToShoot=false
      }
      runTime=0
    }
    if bReadyToShoot=false //run to player if not ready to fire
    {
      if x>oCharacter.x
        xVel=-runAcc
      else
        xVel=runAcc
    }
    else //fire at player
    {
      xVel=0
      if shootTime<reShootTime-11 //check distance to Static Sentry
      {
        var idCheck;
        idCheck=instance_nearest(x,y,oStaticSentry)
        if instance_exists(idCheck)
        {
          if point_distance(oPlayer1.x,0,idCheck.x,0)<80
            shootTime+=1
        }
      }
      shootTime+=1
      if shootTime=reShootTime-10 //load bullets
      {
        if x>oCharacter.x
          offsetShotX=-20
        else
          offsetShotX=20
        bulletDir=point_direction(x+offsetShotX,y-27,oPlayer1.x,oPlayer1.y-26)
        if multiShot=4
          effect_create_above(ef_spark,x+offsetShotX,y-27,2,c_fuchsia)
        else
          effect_create_above(ef_spark,x+offsetShotX,y-27,1,c_fuchsia)
      }
      if shootTime>=reShootTime //fire bullets
      {
        playSound(global.snd_CASgun,0,0.85)
        newAttack=instance_create(x+offsetShotX,y-27,oCASBullet)
        newAttack.physicalPower=physicalPower
        newAttack.bulletSpeed=8
        if offsetShotX=20 //facing right
        {
          if bulletDir>5 and bulletDir<179
            bulletDir=5
          if bulletDir<355 and bulletDir>181
            bulletDir=355
        }
        else //facing left
        {
          if bulletDir>185 and bulletDir<359
            bulletDir=185
          if bulletDir<175 and bulletDir>1
            bulletDir=175
        }
        newAttack.direction=bulletDir
        if shotAmount>5 //burst fire spray
        {
          burstFire=round(random(14)-7)
          newAttack.direction+=burstFire
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
    }

    yVel+=0.2
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
    {
      xVel=0
      if x>oPlayer1.x and yVel=0 //rocket effects
      {
        effect_create_above(ef_flare,x-6,y,0,make_color_rgb(50,50,150))
        effect_create_above(ef_flare,x+6,y,0,make_color_rgb(50,50,150))
        changeTime=round(random(20)+5)
        y-=4
        yVel=-4
      }
    }
    if isCollisionRight(1)
    {
      xVel=0
      if x<oPlayer1.x and yVel=0 //rocket effects
      {
        effect_create_above(ef_flare,x-6,y,0,make_color_rgb(50,50,150))
        effect_create_above(ef_flare,x+6,y,0,make_color_rgb(50,50,150))
        changeTime=round(random(20)+5)
        y-=4
        yVel=-4
      }
    }
    moveTo(xVel,yVel)
    if isCollisionSolid()
      y-=2

    if bReadyToShoot=false //set correct animation frames
    {
      if xVel=0
        sprite_index=sMobileS_Idle
      else
        sprite_index=sMobileS_Run
    }
    else
      sprite_index=sMobileS_Shoot

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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
    inflictStatus(0)
}
