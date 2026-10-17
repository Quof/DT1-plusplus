#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-35,40,35)
image_speed=0.14
sLordMoveTime=0
sLordMove=0

//Enemy base statistics
eName="Shroud Lord"
maxLife=50000
life=maxLife
expWorth=250000
physicalPower=470
physicalDefense=200
spiritPower=550
spiritDefense=250
FIREresist=100
WATERresist=-65
WINDresist=-30
bIsBoss=true
barAmount=4
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
maxAttack=0
specialAttack=0
bSpecialActive=0
controlType=0 //0: normal AI, 1: event scripted
if global.difficulty=1
{
  lHandRecoveryDelay=2400
  rHandRecoveryDelay=2400
  darkEnergyWait=360
  shroudLaserWait=320
  shroudLaserIdle=60
  shroudLaserAmt=2
  groundBlastWait=140
  headLaserWait=500
  headLaserIdle=35
  gravityBombWait=490
  gravityBombAmt=1
}
else if global.difficulty=2
{
  lHandRecoveryDelay=2300
  rHandRecoveryDelay=2300
  darkEnergyWait=340
  shroudLaserWait=300
  shroudLaserIdle=70
  shroudLaserAmt=3
  groundBlastWait=120
  headLaserWait=480
  headLaserIdle=40
  gravityBombWait=460
  gravityBombAmt=2
}
else if global.difficulty=3
{
  lHandRecoveryDelay=2200
  rHandRecoveryDelay=2200
  darkEnergyWait=330
  shroudLaserWait=290
  shroudLaserIdle=75
  shroudLaserAmt=3
  groundBlastWait=110
  headLaserWait=460
  headLaserIdle=45
  gravityBombWait=440
  gravityBombAmt=2
}
else if global.difficulty=4
{
  lHandRecoveryDelay=2100
  rHandRecoveryDelay=2100
  darkEnergyWait=310
  shroudLaserWait=270
  shroudLaserIdle=80
  shroudLaserAmt=4
  groundBlastWait=100
  headLaserWait=440
  headLaserIdle=50
  gravityBombWait=420
  gravityBombAmt=3
}
currSpd=0
maxSpd=5
maxYDist=104
maxHandAtk=0

specialAttackTime=0
lHandRecoveryTime=0
rHandRecoveryTime=0
darkEnergyTime=100
darkEnergyDelay=0
shroudLaserTime=50
groundBlastTime=10
groundBlastDelay=0
groundBlastYScale=0.75
headLaserTime=80
gravityBombTime=50
gravityBombDelay=0

finalPhaseLaserA=0
finalPhaseLaserB=0

pDistX=0
pDistOrigX=0
gbX1=0
gbX2=0
gbSize=0

bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Any attack while mouth is open#>Full Swing"

xCenter=256
yGround=320
roomSpan=192
setPDefense=physicalDefense
setSDefense=spiritDefense

bossSL_Rhand=instance_create(x+88,y-18,oShroudLordArmLv2)
bossSL_Rhand.type=1
bossSL_Lhand=instance_create(x-88,y-18,oShroudLordArmLv2)
bossSL_Lhand.type=2
bossSL_Lhand.image_xscale=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="It has a lot of abilities and I can't analyze them all. But what I do know is that you NEED to dodge that dark energy that it fires. If you're hit by it, it will syphon a lot of life back to itself. Another attack is it's ground blast, you'll see the indicator with the red beams from it's mouth, when you do, get off the ground fast! The only other attack I can see are the laser beams. One beam will target you, the others will appear in other areas. I can't see it's other attacks, just remember, fight smarter, not harder. I know you can do this."
    sideText="This battle is for the freedom of mankind. Kinda funny how a bunch of gaming nerds are saving the world. Kinda poetic isn't it?#... No I guess not, but it's still pretty cool in a weird nerdy way. Anyway, the fight isn't over yet, but I know you can win. One other thing I noticed, it can be damaged while the hands are active, however, it will never die unless you take the hands out first. You will need to destroy them before you take the final shot."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //defense change
    if bSpecialActive=1
    {
      physicalDefense=round(setPDefense*1.5)
      spiritDefense=round(setSDefense*1.5)
    }
    else
    {
      if lifePercent<=0.049
      {
        if instance_exists(oShroudLordArmLv2)
        {
          physicalDefense=round(setPDefense*100)
          spiritDefense=round(setSDefense*100)
        }
        else
        {
          physicalDefense=setPDefense
          spiritDefense=setSDefense
        }
      }
      else
      {
        physicalDefense=setPDefense
        spiritDefense=setSDefense
      }
    }
    //movement **********************************************************************
    if controlType=0
    {
      pDistOrigX=point_distance(x,0,oPlayer1.x,0)
      pDistX=pDistOrigX/25
      if x>oPlayer1.x //go left
      {
        if currSpd>=0
        {
          //currSpd-=pDistX/5
          currSpd-=pDistX/5*gDeltaTime //60fps change: per 30fps tick
          if pDistOrigX<16 and currSpd<3
            currSpd=0
        }
        else
          //currSpd-=pDistX/10
          currSpd-=pDistX/10*gDeltaTime //60fps change: per 30fps tick
      }
      else //go right
      {
        if currSpd<=0
        {
          //currSpd+=pDistX/5
          currSpd+=pDistX/5*gDeltaTime //60fps change: per 30fps tick
          if pDistOrigX<16 and currSpd>-3
            currSpd=0
        }
        else
          //currSpd+=pDistX/10
          currSpd+=pDistX/10*gDeltaTime //60fps change: per 30fps tick
      }

      if currSpd>maxSpd
        currSpd=maxSpd
      else if currSpd<-maxSpd
        currSpd=-maxSpd
      //x+=currSpd
      x+=currSpd*gDeltaTime //60fps change: per 30fps tick

      if y>oPlayer1.y+16
        //y-=1
        y-=1*gDeltaTime //60fps change: per 30fps tick
      if y<oPlayer1.y-maxYDist
        //y+=1
        y+=1*gDeltaTime //60fps change: per 30fps tick
    }
    //attacks **********************************************************************
    if bSpecialActive=0
    {
      if currentAttack=0 //---------- Normal Attack: Dark Energy ----------
      {
        //darkEnergyTime+=1
        darkEnergyTime+=gDeltaTime //60fps change: counts 30fps ticks
        if darkEnergyDelay=0
        {
          if darkEnergyTime>=darkEnergyWait
          {
            darkEnergyDelay=darkEnergyWait
            darkEnergyTime=darkEnergyWait
          }
        }
        if darkEnergyTime>=darkEnergyDelay and darkEnergyDelay!=0
        {
          //if darkEnergyTime=darkEnergyDelay+1 //open mouth
          if scrCountPass(darkEnergyTime,darkEnergyDelay+1) //open mouth //60fps change: once, when the count reaches it
            sprite_index=sShroudLHeadM
          //else if darkEnergyTime=darkEnergyDelay+35 //create fire
          else if scrCountPass(darkEnergyTime,darkEnergyDelay+35) //create fire //60fps change: once, when the count reaches it
          {
            darkBall=instance_create(x,y-19,oShroudLFire)
            darkBall.throwSpeed=6
            darkBall.ownerID=id
            sprite_index=sShroudLHead
            darkEnergyTime=0
            darkEnergyDelay=0
            if maxAttack>0
              currentAttack+=1
          }
        }
      }
      else if currentAttack=1 //---------- Normal Attack: Ground Blast ----------
      {
        //groundBlastTime+=1
        groundBlastTime+=gDeltaTime //60fps change: counts 30fps ticks
        if groundBlastDelay=0
        {
          if groundBlastTime>=groundBlastWait
          {
            groundBlastDelay=groundBlastWait
            groundBlastTime=groundBlastWait
          }
        }
        if groundBlastTime>=groundBlastDelay and groundBlastDelay!=0
        {
          //if groundBlastTime=groundBlastDelay+1 //open mouth
          if scrCountPass(groundBlastTime,groundBlastDelay+1) //open mouth //60fps change: once, when the count reaches it
          {
            sprite_index=sShroudLHeadM
            afterImage=instance_create(x,y,oEnemyAfterImage)
            afterImage.sprite_index=sprite_index
            afterImage.image_index=image_index
            afterImage.imageFade=0.05
            afterImage.xScalingSet=0.075
            afterImage.yScalingSet=0.075
            gbX1=96
            gbX2=416
            gbSize=32
          }
          //else if groundBlastTime>=groundBlastDelay+21 and groundBlastTime<=groundBlastDelay+36 //show ground wave
          else if groundBlastTime>groundBlastDelay+20 and groundBlastTime<=groundBlastDelay+36 //show ground wave //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            //gbX1+=24
            gbX1+=24*gDeltaTime //60fps change: per 30fps tick
            //gbX2-=24
            gbX2-=24*gDeltaTime //60fps change: per 30fps tick
          }
          //else if groundBlastTime=groundBlastDelay+51 //create attack
          else if scrCountPass(groundBlastTime,groundBlastDelay+51) //create attack //60fps change: once, when the count reaches it
          {
            playSound(global.snd_Shock,0,0.75)
            playSound(global.snd_CASdie,0,1)
            flashScreen=instance_create(0,0,oScreenFlash)
            flashScreen.image_alpha=0.9
            flashScreen.image_blend=c_red
            flashScreen.fadeSpeed=0.1
            var tempX;
            tempX=72
            for(i=0;i<24;i+=1)
            {
              gbWave=instance_create(tempX,320,oGASGExplosion)
              gbWave.sprite_index=sKMfirePillar
              gbWave.damageType="SPIRIT"
              gbWave.spiritPower=spiritPower
              gbWave.image_yscale=groundBlastYScale
              tempX+=16
            }
            sprite_index=sShroudLHead
            groundBlastTime=0
            groundBlastDelay=0
            if maxAttack>1
              currentAttack+=1
            else
              currentAttack=0
          }

          //size up and down wave
          //if groundBlastTime>=groundBlastDelay+21 and groundBlastTime<=groundBlastDelay+28
          if groundBlastTime>groundBlastDelay+20 and groundBlastTime<=groundBlastDelay+28 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
            //gbSize+=8
            gbSize+=8*gDeltaTime //60fps change: per 30fps tick
          //if groundBlastTime>=groundBlastDelay+29 and groundBlastTime<=groundBlastDelay+36
          if groundBlastTime>groundBlastDelay+28 and groundBlastTime<=groundBlastDelay+36 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
            //gbSize-=8
            gbSize-=8*gDeltaTime //60fps change: per 30fps tick
        }
      }
    }

    if specialAttack!=5 and specialAttack!=8
    {
      //---------- Extra Attack: Shroud Laser ----------
      //shroudLaserTime+=1
      shroudLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
      if shroudLaserTime>=shroudLaserWait
      {
        for(i=0;i<shroudLaserAmt;i+=1)
        {
          if i=0
            newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
          else
            newLaser=instance_create((xCenter-roomSpan)+random(roomSpan*2),yGround,oSLLaser)
          newLaser.spiritPower=spiritPower
          newLaser.idleTime=shroudLaserIdle
          if i=0
            newLaser.bShake=1
          else
            newLaser.bShake=0
        }
        shroudLaserTime=0
      }
      //---------- Extra Attack: Head Laser ----------
      if bossProgress>=10 and bossProgress<=14
      {
        //headLaserTime+=1
        headLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
        if headLaserTime>=headLaserWait
        {
          laserHeadR=instance_create(xCenter-roomSpan-24,oPlayer1.y-26,oHeadLaserSpewer)
          laserHeadR.type=1
          laserHeadR.spiritPower=spiritPower
          laserHeadR.idleTime=headLaserIdle
          laserHeadL=instance_create(xCenter+roomSpan+24,oPlayer1.y-26,oHeadLaserSpewer)
          laserHeadL.type=2
          laserHeadL.image_xscale=-1
          laserHeadL.spiritPower=spiritPower
          laserHeadL.idleTime=headLaserIdle
          headLaserTime=0
        }
      }
      //---------- Extra Attack: Gravity Bomb ----------
      if bossProgress>=15
      {
        //gravityBombTime+=1
        gravityBombTime+=gDeltaTime //60fps change: counts 30fps ticks
        if groundBlastDelay=0
        {
          if gravityBombTime>=gravityBombWait
          {
            groundBlastDelay=gravityBombWait
            gravityBombTime=gravityBombWait
          }
        }
        if gravityBombTime>=groundBlastDelay and groundBlastDelay!=0
        {
          //if gravityBombTime mod 5=0 //afterimage
          if scrModPass(gravityBombTime,5) //afterimage //60fps change: once each time the count reaches a multiple of it
          {
            afterImage=instance_create(x,y,oEnemyAfterImage)
            afterImage.sprite_index=sprite_index
            afterImage.image_index=image_index
            afterImage.imageFade=0.05
            afterImage.xScalingSet=0.1
            afterImage.yScalingSet=0.1
          }
          if gravityBombTime>=gravityBombWait+33 //fire gravity bomb
          {
            playSound(global.snd_GASlaunch,0,0.92)
            effect=instance_create(x,y-30,oEffect)
            effect.sprite_index=sGrenadeExplosion
            for(i=0;i<gravityBombAmt;i+=1)
            {
              gravityBomb=instance_create(x,y-30,oSLGravityBomb)
              gravityBomb.physicalPower=physicalPower
              gravityBomb.xVel=random_range(-3,3)
              gravityBomb.yVel=-random(2)-4
            }
            gravityBombTime=0
          }
        }
      }
    }

    if specialAttack=1 or specialAttack=4 or specialAttack=7 //ready special attack
    {
      flashScreen=instance_create(0,0,oScreenFlash)
      flashScreen.image_alpha=1
      flashScreen.image_blend=c_red
      flashScreen.fadeSpeed=0.2

      with oHeadLaserSpewer
        instance_destroy()
      with oSLLaser
        instance_destroy()

      sprite_index=sShroudLHead
      lHandRecoveryTime=0
      rHandRecoveryTime=0
      darkEnergyTime-=30
      if darkEnergyTime<0
        darkEnergyTime=0
      else if darkEnergyTime>darkEnergyWait
        darkEnergyTime=darkEnergyWait-30
      darkEnergyDelay=0
      groundBlastTime-=30
      if groundBlastTime<0
        groundBlastTime=0
      else if groundBlastTime>groundBlastWait
        groundBlastTime=groundBlastWait-40
      groundBlastDelay=0
      shroudLaserTime-=30
      if shroudLaserTime<0
        shroudLaserTime=0

      bSpecialActive=1
      specialAttackTime=0
      specialAttack+=1
    }
    if specialAttack=2 //---------- Special Attack: Spiral Laser ----------
    {
      if lifePercent<=0.55
      {
        physicalDefense=round(setPDefense*100)
        spiritDefense=round(setSDefense*100)
      }

      //specialAttackTime+=1
      specialAttackTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if specialAttackTime=1 //create heads
      if scrCountPass(specialAttackTime,1) //create heads //60fps change: once, when the count reaches it
      {
        fakeHeadR=instance_create(x+72,y-32,oSLFakeHead)
        fakeHeadR.type=1
        fakeHeadR.spiritPower=spiritPower
        fakeHeadL=instance_create(x-72,y-32,oSLFakeHead)
        fakeHeadL.type=2
        fakeHeadL.image_xscale=-1
        fakeHeadL.spiritPower=spiritPower
      }
      else if specialAttackTime>=2 //end attack
      {
        if !instance_exists(fakeHeadR)
        {
          specialAttack+=1
          lHandRecoveryTime=lHandRecoveryDelay-1200
          rHandRecoveryTime=rHandRecoveryDelay-1200
          bSpecialActive=0
        }
      }
    }
    else if specialAttack=5 //---------- Special Attack: Bullet Hell ----------
    {
      if lifePercent<=0.3
      {
        physicalDefense=round(setPDefense*100)
        spiritDefense=round(setSDefense*100)
      }

      //specialAttackTime+=1
      specialAttackTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if specialAttackTime=1 //create side lasers
      if scrCountPass(specialAttackTime,1) //create side lasers //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(80,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=850
        newLaser.bShake=1
        newLaser=instance_create(112,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=850
        newLaser.bShake=0
        newLaser=instance_create(400,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=850
        newLaser.bShake=0
        newLaser=instance_create(432,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=850
        newLaser.bShake=0
      }
      //else if specialAttackTime=40 //wave 1
      else if scrCountPass(specialAttackTime,40) //wave 1 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter-96,128,oSLUltimateBH)
        ultimateBH.dirChange=2
        ultimateBH.shotFreq=6
        ultimateBH.decayTime=210
        ultimateBH=instance_create(xCenter+96,128,oSLUltimateBH)
        ultimateBH.dirChange=-2
        ultimateBH.shotFreq=6
        ultimateBH.decayTime=210
      }
      //else if specialAttackTime=120 //wave 2
      else if scrCountPass(specialAttackTime,120) //wave 2 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter-96,160,oSLUltimateBH)
        ultimateBH.dirChange=-3
        ultimateBH.shotFreq=5
        ultimateBH.decayTime=210
        ultimateBH=instance_create(xCenter+96,160,oSLUltimateBH)
        ultimateBH.dirChange=3
        ultimateBH.shotFreq=5
        ultimateBH.decayTime=210
      }
      //else if specialAttackTime=220 //wave 3
      else if scrCountPass(specialAttackTime,220) //wave 3 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter,160,oSLUltimateBH)
        ultimateBH.dirChange=5
        ultimateBH.shotFreq=4
        ultimateBH.decayTime=150
        ultimateBH=instance_create(xCenter,160,oSLUltimateBH)
        ultimateBH.dirChange=-5
        ultimateBH.shotFreq=4
        ultimateBH.decayTime=150
      }
      //else if specialAttackTime=360 //wave 4
      else if scrCountPass(specialAttackTime,360) //wave 4 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter,128,oSLUltimateBH)
        ultimateBH.dirChange=5
        ultimateBH.shotFreq=2
        ultimateBH.decayTime=210
        ultimateBH=instance_create(xCenter,128,oSLUltimateBH)
        ultimateBH.dirChange=-5
        ultimateBH.shotFreq=2
        ultimateBH.decayTime=210
      }
      //else if specialAttackTime=500 //wave 5
      else if scrCountPass(specialAttackTime,500) //wave 5 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter-96,128,oSLUltimateBH)
        ultimateBH.dirChange=4
        ultimateBH.shotFreq=4
        ultimateBH.decayTime=210
        ultimateBH=instance_create(xCenter+96,128,oSLUltimateBH)
        ultimateBH.dirChange=4
        ultimateBH.shotFreq=4
        ultimateBH.decayTime=210
      }
      //else if specialAttackTime=650 //wave 6
      else if scrCountPass(specialAttackTime,650) //wave 6 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter+96,96,oSLUltimateBH)
        ultimateBH.dirChange=5
        ultimateBH.shotFreq=7
        ultimateBH.decayTime=150
        ultimateBH=instance_create(xCenter+96,96,oSLUltimateBH)
        ultimateBH.dirChange=5
        ultimateBH.shotFreq=7
        ultimateBH.decayTime=150
        ultimateBH.image_angle=90
        ultimateBH=instance_create(xCenter-96,96,oSLUltimateBH)
        ultimateBH.dirChange=-5
        ultimateBH.shotFreq=7
        ultimateBH.decayTime=150
        ultimateBH=instance_create(xCenter-96,96,oSLUltimateBH)
        ultimateBH.dirChange=-5
        ultimateBH.shotFreq=7
        ultimateBH.decayTime=150
        ultimateBH.image_angle=90
      }
      //else if specialAttackTime=770 //wave 7
      else if scrCountPass(specialAttackTime,770) //wave 7 //60fps change: once, when the count reaches it
      {
        ultimateBH=instance_create(xCenter,128,oSLUltimateBH)
        ultimateBH.dirChange=5
        ultimateBH.shotFreq=1
        ultimateBH.decayTime=100
        ultimateBH=instance_create(xCenter,128,oSLUltimateBH)
        ultimateBH.dirChange=-5
        ultimateBH.shotFreq=1
        ultimateBH.decayTime=100
      }
      //else if specialAttackTime=891 //end attack
      else if scrCountPass(specialAttackTime,891) //end attack //60fps change: once, when the count reaches it
      {
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_red
        flashScreen.fadeSpeed=0.2

        leftPlatform=instance_create(64,128,oMovingPlatform)
        leftPlatform.sprite_index=sInvisibleSolidMask
        leftPlatform.xDir=0
        leftPlatform.yDir=1
        leftPlatform.shiftChange=112
        leftPlatform.spriteChange=13
        leftPlatform.image_xscale=4
        rightPlatform=instance_create(384,240,oMovingPlatform)
        rightPlatform.sprite_index=sInvisibleSolidMask
        rightPlatform.xDir=0
        rightPlatform.yDir=-1
        rightPlatform.shiftChange=112
        rightPlatform.spriteChange=13
        rightPlatform.image_xscale=4
        cCrystal=instance_create(xCenter,128,oLatchCrystal)
        groundBlastYScale+=0.8
        with oSLUltimateBH
          instance_destroy()
        lHandRecoveryTime=lHandRecoveryDelay-900
        rHandRecoveryTime=rHandRecoveryDelay-900
        specialAttack+=1
        bSpecialActive=0
      }
    }
    else if specialAttack=8 //---------- Special Attack: Laser Grid ----------
    {
      if lifePercent<=0.05
      {
        physicalDefense=round(setPDefense*100)
        spiritDefense=round(setSDefense*100)
      }

      //specialAttackTime+=1
      specialAttackTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if specialAttackTime=1
      if scrCountPass(specialAttackTime,1) //60fps change: once, when the count reaches it
      {
        with oHeadLaserSpewer {idleTime=2}
        lHandRecoveryTime=0
        rHandRecoveryTime=0

        newLaser=instance_create(144,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=150
        newLaser.bShake=1
        newLaser=instance_create(368,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=150
        newLaser.bShake=0
        newLaser=instance_create(xCenter,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=300
        newLaser.bShake=0
        laserHeadR=instance_create(xCenter-roomSpan-24,80,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower/1.1
        laserHeadR.idleTime=135
        laserHeadL=instance_create(xCenter+roomSpan+24,80,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower/1.1
        laserHeadL.idleTime=135
        laserHeadR=instance_create(xCenter-roomSpan-24,304,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower/1.1
        laserHeadR.idleTime=135
        laserHeadL=instance_create(xCenter+roomSpan+24,304,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower/1.1
        laserHeadL.idleTime=135
      }
      //else if specialAttackTime=120
      else if scrCountPass(specialAttackTime,120) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(192,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=140
        newLaser.bShake=1
        newLaser=instance_create(320,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=140
        newLaser.bShake=0
      }
      //else if specialAttackTime=210
      else if scrCountPass(specialAttackTime,210) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(192,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=135
        newLaser.bShake=1
        newLaser=instance_create(320,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=135
        newLaser.bShake=0
        laserHeadR=instance_create(xCenter-roomSpan-24,200,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower/1.1
        laserHeadR.idleTime=135
        laserHeadL=instance_create(xCenter+roomSpan+24,200,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower/1.1
        laserHeadL.idleTime=135
      }
      //else if specialAttackTime=300
      else if scrCountPass(specialAttackTime,300) //60fps change: once, when the count reaches it
      {
        laserHead[0]=instance_create(xCenter,192,oHeadLaserSpewer)
        laserHead[0].type=1
        laserHead[0].spiritPower=spiritPower/1.1
        laserHead[0].idleTime=270
        laserHead[1]=instance_create(xCenter,192,oHeadLaserSpewer)
        laserHead[1].type=1
        laserHead[1].image_angle=90
        laserHead[1].spiritPower=spiritPower/1.1
        laserHead[1].idleTime=270
        laserHead[2]=instance_create(xCenter,192,oHeadLaserSpewer)
        laserHead[2].type=1
        laserHead[2].image_angle=180
        laserHead[2].spiritPower=spiritPower/1.1
        laserHead[2].idleTime=270
        laserHead[3]=instance_create(xCenter,192,oHeadLaserSpewer)
        laserHead[3].type=1
        laserHead[3].image_angle=270
        laserHead[3].spiritPower=spiritPower/1.1
        laserHead[3].idleTime=270
      }
      //else if specialAttackTime=420
      else if scrCountPass(specialAttackTime,420) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(80,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=70
        newLaser.bShake=1
        newLaser=instance_create(112,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=70
        newLaser.bShake=0
        newLaser=instance_create(400,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=70
        newLaser.bShake=0
        newLaser=instance_create(432,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=70
        newLaser.bShake=0
      }
      //else if specialAttackTime=500
      else if scrCountPass(specialAttackTime,500) //60fps change: once, when the count reaches it
      {
        laserHeadR=instance_create(xCenter-roomSpan-24,272,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower/1.1
        laserHeadR.idleTime=70
        laserHeadL=instance_create(xCenter+roomSpan+24,272,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower/1.1
        laserHeadL.idleTime=70
        laserHeadR=instance_create(xCenter-roomSpan-24,304,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower/1.1
        laserHeadR.idleTime=70
        laserHeadL=instance_create(xCenter+roomSpan+24,304,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower/1.1
        laserHeadL.idleTime=70
      }
      //else if specialAttackTime=600
      else if scrCountPass(specialAttackTime,600) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(80,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
        newLaser=instance_create(432,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=0
        var laserGridX;
        laserGridX=96
        for(i=0;i<6;i+=1)
        {
          newLaser=instance_create(laserGridX,yGround,oSLLaser)
          newLaser.spiritPower=spiritPower/1.1
          newLaser.idleTime=400
          newLaser.bShake=0
          laserGridX+=64
        }
      }
      //else if specialAttackTime=690
      else if scrCountPass(specialAttackTime,690) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
      }
      //else if specialAttackTime=730
      else if scrCountPass(specialAttackTime,730) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
      }
      //else if specialAttackTime=770
      else if scrCountPass(specialAttackTime,770) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
      }
      //else if specialAttackTime=810
      else if scrCountPass(specialAttackTime,810) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
      }
      //else if specialAttackTime=850
      else if scrCountPass(specialAttackTime,850) //60fps change: once, when the count reaches it
      {
        newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower/1.1
        newLaser.idleTime=400
        newLaser.bShake=1
      }
      //else if specialAttackTime=950 //end attack
      else if scrCountPass(specialAttackTime,950) //end attack //60fps change: once, when the count reaches it
      {
        with oLatchCrystal
          instance_destroy()
        with oMovingPlatform
          instance_destroy()
        with oSLLaser
          instance_destroy()
        lHandRecoveryTime=lHandRecoveryDelay
        rHandRecoveryTime=rHandRecoveryDelay
        specialAttack+=1
        bSpecialActive=0
      }

      //if specialAttackTime>=301 and specialAttackTime<=619 //rotate heads
      if specialAttackTime>300 and specialAttackTime<=619 //rotate heads //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        for(i=0;i<4;i+=1)
          //laserHead[i].image_angle-=1
          laserHead[i].image_angle-=1*gDeltaTime //60fps change: per 30fps tick
      }
    }

    //hand recovery **********************************************************************
    if specialAttack!=8
    {
      if !instance_exists(bossSL_Lhand) //left hand recovery
      {
        if darkEnergyTime<darkEnergyWait
        {
          //darkEnergyTime+=0.25
          darkEnergyTime+=0.25*gDeltaTime //60fps change: per 30fps tick
          if darkEnergyTime>darkEnergyWait
            darkEnergyTime=darkEnergyWait
        }
        //lHandRecoveryTime+=1
        lHandRecoveryTime+=gDeltaTime //60fps change: counts 30fps ticks
        if lHandRecoveryTime>=lHandRecoveryDelay
        {
          effect_create_above(ef_smoke,x-88,y-18,2,c_black)
          bossSL_Lhand=instance_create(x-88,y-18,oShroudLordArmLv2)
          bossSL_Lhand.type=2
          bossSL_Lhand.image_xscale=-1
          bossSL_Lhand.activateBoss=1
          lHandRecoveryTime=0
        }
      }
      if !instance_exists(bossSL_Rhand) //right hand recovery
      {
        if darkEnergyTime<darkEnergyWait
        {
          //darkEnergyTime+=0.25
          darkEnergyTime+=0.25*gDeltaTime //60fps change: per 30fps tick
          if darkEnergyTime>darkEnergyWait
            darkEnergyTime=darkEnergyWait
        }
        //rHandRecoveryTime+=1
        rHandRecoveryTime+=gDeltaTime //60fps change: counts 30fps ticks
        if rHandRecoveryTime>=rHandRecoveryDelay
        {
          effect_create_above(ef_smoke,x+88,y-18,2,c_black)
          bossSL_Rhand=instance_create(x+88,y-18,oShroudLordArmLv2)
          bossSL_Rhand.type=1
          bossSL_Rhand.activateBoss=1
          rHandRecoveryTime=0
        }
      }
    }

    //---------- Perma-laser during 4th phase ----------
    if specialAttack=9
    {
      if finalPhaseLaserA=1
      {
        laserHeadR=instance_create(xCenter-roomSpan-24,180,oHeadLaserSpewer)
        laserHeadR.type=1
        laserHeadR.spiritPower=spiritPower
        laserHeadR.idleTime=10000
        laserHeadL=instance_create(xCenter+roomSpan+24,180,oHeadLaserSpewer)
        laserHeadL.type=2
        laserHeadL.image_xscale=-1
        laserHeadL.spiritPower=spiritPower
        laserHeadL.idleTime=10000
        newLaser=instance_create(80,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=10000
        newLaser.bShake=1
        newLaser=instance_create(432,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=10000
        newLaser.bShake=0
        finalPhaseLaserA=2
      }
      if finalPhaseLaserB=1
      {
        newLaser=instance_create(xCenter,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=10000
        newLaser.bShake=1
        finalPhaseLaserB=2
      }
    }

    //****************************** scale difficulty ******************************
    if lifePercent<=0.94 and lifePercent>=0.9 and bossProgress<=0 //----- bar purple (1) -----
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      bossProgress=1
    }
    else if lifePercent<=0.899 and lifePercent>=0.85 and bossProgress<=1
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      bossProgress=2
    }
    else if lifePercent<=0.849 and lifePercent>=0.8 and bossProgress<=2
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      bossProgress=3
    }
    else if lifePercent<=0.799 and lifePercent>=0.75 and bossProgress<=3
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      maxAttack+=1
      bossProgress=4
    }
    else if lifePercent<=0.749 and lifePercent>=0.7 and bossProgress<=4 //----- bar blue (2) -----
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      shroudLaserAmt+=1
      groundBlastWait-=global.difficulty
      maxHandAtk+=1
      specialAttack+=1
      bossProgress=5
    }
    else if lifePercent<=0.699 and lifePercent>=0.65 and bossProgress<=5
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      bossProgress=6
    }
    else if lifePercent<=0.649 and lifePercent>=0.6 and bossProgress<=6
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      bossProgress=7
    }
    else if lifePercent<=0.599 and lifePercent>=0.55 and bossProgress<=7
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      bossProgress=8
    }
    else if lifePercent<=0.549 and lifePercent>=0.5 and bossProgress<=8
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      groundBlastYScale+=0.15
      bossProgress=9
    }
    else if lifePercent<=0.499 and lifePercent>=0.45 and bossProgress<=9 //----- bar green (3) -----
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait+=160
      specialAttack+=1
      bossProgress=10
    }
    else if lifePercent<=0.449 and lifePercent>=0.4 and bossProgress<=10
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      headLaserWait-=global.difficulty*2
      headLaserIdle+=1
      bossProgress=11
    }
    else if lifePercent<=0.399 and lifePercent>=0.35 and bossProgress<=11
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      headLaserWait-=global.difficulty*2
      headLaserIdle+=1
      bossProgress=12
    }
    else if lifePercent<=0.349 and lifePercent>=0.3 and bossProgress<=12
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      headLaserWait-=global.difficulty*2
      headLaserIdle+=1
      bossProgress=13
    }
    else if lifePercent<=0.299 and lifePercent>=0.25 and bossProgress<=13
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      headLaserWait-=global.difficulty
      headLaserIdle+=global.difficulty*2
      bossProgress=14
    }
    else if lifePercent<=0.249 and lifePercent>=0.2 and bossProgress<=14 //----- bar red (4) -----
    {
      with oShroudLordArmLv2 {instance_destroy()}
      with oShroudLFire {instance_destroy()}
      with oSLLaser {instance_destroy()}
      with oHeadLaserSpewer {instance_destroy()}
      with oSLFakeHead {instance_destroy()}
      with oSLHeadLaser {instance_destroy()}

      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      if global.difficulty>=3
        shroudLaserAmt+=1
      groundBlastWait-=160
      groundBlastYScale-=0.7
      maxHandAtk+=1
      specialAttack+=1
      bossProgress=15
    }
    else if lifePercent<=0.199 and lifePercent>=0.15 and bossProgress<=15
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      gravityBombWait-=global.difficulty*2
      gravityBombAmt+=1
      finalPhaseLaserA=1
      bossProgress=16
    }
    else if lifePercent<=0.149 and lifePercent>=0.1 and bossProgress<=16
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty
      shroudLaserWait-=global.difficulty
      shroudLaserIdle+=global.difficulty
      groundBlastWait-=global.difficulty
      gravityBombWait-=global.difficulty*2
      if global.difficulty>=3
        gravityBombAmt+=1
      bossProgress=17
    }
    else if lifePercent<=0.099 and lifePercent>=0.05 and bossProgress<=17
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty*2
      shroudLaserWait-=global.difficulty*2
      shroudLaserIdle+=global.difficulty*2
      groundBlastWait-=global.difficulty*2
      gravityBombWait-=global.difficulty*3
      finalPhaseLaserB=1
      bossProgress=18
    }
    else if lifePercent<=0.049 and bossProgress<=18
    {
      lHandRecoveryDelay-=global.difficulty*4
      rHandRecoveryDelay-=global.difficulty*4
      darkEnergyWait-=global.difficulty*2
      shroudLaserWait-=global.difficulty*2
      shroudLaserIdle+=global.difficulty*2
      groundBlastWait-=global.difficulty*2
      gravityBombWait-=global.difficulty*4
      bossProgress=19
    }
  }
  //****************************** bob up and down ******************************
  //sLordMoveTime+=1
  //if sLordMoveTime>=1 and sLordMoveTime<=21
  //  sLordMove+=0.04
  //else if sLordMoveTime>=22 and sLordMoveTime<=42
  //  sLordMove-=0.04
  //else if sLordMoveTime>=52 and sLordMoveTime<=72
  //  sLordMove-=0.04
  //else if sLordMoveTime>=73 and sLordMoveTime<=93
  //  sLordMove+=0.04
  //else if sLordMoveTime>=103
  //  sLordMoveTime=0
  //y+=sLordMove
  //60fps change: the float counts 30fps ticks (the same ticks: >a-1 is >=a in whole ticks), and its speed changes
  //and moves it per 30fps tick
  sLordMoveTime+=gDeltaTime
  if sLordMoveTime>0 and sLordMoveTime<=21
    sLordMove+=0.04*gDeltaTime
  else if sLordMoveTime>21 and sLordMoveTime<=42
    sLordMove-=0.04*gDeltaTime
  else if sLordMoveTime>51 and sLordMoveTime<=72
    sLordMove-=0.04*gDeltaTime
  else if sLordMoveTime>72 and sLordMoveTime<=93
    sLordMove+=0.04*gDeltaTime
  else if sLordMoveTime>=103
    sLordMoveTime=0
  y+=sLordMove*gDeltaTime
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.attackType=other.HURRICANE_DASH {other.physicalPower=oPlayer1.physicalPower*0.75}

event_inherited()
if instance_exists(bossSL_Rhand)
{
  if bossSL_Rhand.slamDelay=0
  {
    if bossSL_Rhand.currentAttack=0
      //bossSL_Rhand.slamTime+=7
      bossSL_Rhand.slamTime+=7*gDeltaTime //60fps change: added every frame an attack touches it: per 30fps tick
    else
      //bossSL_Rhand.slamTime+=3
      bossSL_Rhand.slamTime+=3*gDeltaTime //60fps change: see above
    if bossSL_Rhand.slamTime>bossSL_Rhand.slamWait
      bossSL_Rhand.slamTime=bossSL_Rhand.slamWait
  }
  if bossSL_Rhand.bulletStormDelay=0
  {
    if bossSL_Rhand.currentAttack=1
      //bossSL_Rhand.bulletStormTime+=7
      bossSL_Rhand.bulletStormTime+=7*gDeltaTime //60fps change: see above
    else
      //bossSL_Rhand.bulletStormTime+=3
      bossSL_Rhand.bulletStormTime+=3*gDeltaTime //60fps change: see above
    if bossSL_Rhand.bulletStormTime>bossSL_Rhand.bulletStormWait
      bossSL_Rhand.bulletStormTime=bossSL_Rhand.bulletStormWait
  }
}
if instance_exists(bossSL_Lhand)
{
  if bossSL_Lhand.slamDelay=0
  {
    if bossSL_Lhand.currentAttack=0
      //bossSL_Lhand.slamTime+=7
      bossSL_Lhand.slamTime+=7*gDeltaTime //60fps change: see above
    else
      //bossSL_Lhand.slamTime+=3
      bossSL_Lhand.slamTime+=3*gDeltaTime //60fps change: see above
    if bossSL_Lhand.slamTime>bossSL_Lhand.slamWait
      bossSL_Lhand.slamTime=bossSL_Lhand.slamWait
  }
  if bossSL_Lhand.bulletStormDelay=0
  {
    if bossSL_Lhand.currentAttack=1
      //bossSL_Lhand.bulletStormTime+=7
      bossSL_Lhand.bulletStormTime+=7*gDeltaTime //60fps change: see above
    else
      //bossSL_Lhand.bulletStormTime+=3
      bossSL_Lhand.bulletStormTime+=3*gDeltaTime //60fps change: see above
    if bossSL_Lhand.bulletStormTime>bossSL_Lhand.bulletStormWait
      bossSL_Lhand.bulletStormTime=bossSL_Lhand.bulletStormWait
  }
}

if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and sprite_index=sShroudLHeadM
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    inflictStatus(0)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(0.25)
draw_set_color(make_color_rgb(255,57,214))
draw_triangle(x,-384,x+96,room_height,x-96,room_height,false)
draw_set_alpha(0.5)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y-16,128,make_color_rgb(255,57,214),c_black,false)
draw_set_blend_mode(bm_normal)
draw_sprite(sShroudLBody,-1,x,y-40)
event_inherited()
//Ground Blast indicator
if groundBlastTime>=groundBlastDelay+20 and groundBlastTime<=groundBlastDelay+37 and groundBlastDelay!=0
{
  draw_set_alpha(0.6)
  draw_set_color(c_red)
  draw_triangle(x,y-19,gbX1,320,gbX1-gbSize,320,0)
  draw_triangle(x,y-19,gbX2,320,gbX2+gbSize,320,0)
}
