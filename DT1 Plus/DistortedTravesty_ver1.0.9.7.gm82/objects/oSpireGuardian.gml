#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.2

//Enemy base statistics
eName="Spire Guardian"
maxLife=30000
life=maxLife
expWorth=250000
physicalPower=400
physicalDefense=200
spiritPower=490
spiritDefense=240
FIREresist=0
WATERresist=0
WINDresist=0
EARTHresist=0
skillResist=5
bIsBoss=true
barAmount=3
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
maxAttack=4
if global.difficulty=1
{
  redCircleWait=200
  blueCircleWait=280
  greenCircleWait=250
  bigAttackWait=530
  bigAtk1Amt=3
}
else if global.difficulty=2
{
  redCircleWait=190
  blueCircleWait=270
  greenCircleWait=240
  bigAttackWait=520
  bigAtk1Amt=4
}
else if global.difficulty=3
{
  redCircleWait=180
  blueCircleWait=260
  greenCircleWait=230
  bigAttackWait=510
  bigAtk1Amt=5
}
else if global.difficulty=4
{
  redCircleWait=170
  blueCircleWait=250
  greenCircleWait=220
  bigAttackWait=500
  bigAtk1Amt=6
}
teleportTime=0
teleportDelay=600
teleportSide=1 //0:left, 1:right
teleLineY=sprite_height
normalAtkSeq=0
redCircleTime=redCircleWait-50
blueCircleTime=blueCircleWait-150
greenCircleTime=greenCircleWait-100
bigAttackTime=100
bigAttackDelay=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Full Swing#>Upward Strike#>Full Swing#>Any Physical"
setPDefense=physicalDefense
setSDefense=spiritDefense

xCenter=256
yGround=320
roomSpan=160
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
    combatText="This guy doesn't move around much, which is a good thing, cause that could make this rough. You need to understand the functions of each of the colored circles it fires off. The red one will shoot a ring of bullets with one being fired directly at you. The blue one is similar to the red, except it is fewer bullets and they arc for just over a second. The green sprays a large amount of gravity based bullets. When these are fired together, they can be very deadly. Use your abilities to ease things up for yourself."
    sideText="I was wondering if there was going to be a tower guard. This is from a game called 'Treasure of the Rudras', which was somewhat of an obscure game. I never actually got the chance to play it, but I did want to."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if baseColor=c_silver
    {
      physicalDefense=round(setPDefense*1.5)
      spiritDefense=round(setSDefense*1.5)
    }
    else if baseColor=c_orange
    {
      physicalDefense=round(setPDefense*5)
      spiritDefense=round(setSDefense*5)
    }
    else
    {
      physicalDefense=setPDefense
      spiritDefense=setSDefense
    }
    //movement **************************************************
    if bigAttackTime<bigAttackWait
    {
      //teleportTime+=1
      teleportTime+=gDeltaTime //60fps change: counts 30fps ticks
      if teleportTime>=teleportDelay
      {
        //if teleportTime=teleportDelay
        if scrCountPass(teleportTime,teleportDelay) //60fps change: once, when the count reaches it
          bCanTakeDamage=false
        //if teleportTime>=teleportDelay+1 and teleportTime<=teleportDelay+999 //teleport line disappear
        if teleportTime>teleportDelay and teleportTime<=teleportDelay+999 //teleport line disappear //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        {
          //teleLineY-=6
          teleLineY-=6*gDeltaTime //60fps change: per 30fps tick
          if teleLineY<0
          {
            teleLineY=0
            if teleportSide=0 //teleport to right
            {
              x=368
              image_xscale=-1
              teleportSide=1
            }
            else //teleport to left
            {
              x=144
              image_xscale=1
              teleportSide=0
            }
            teleportTime=teleportDelay+1000
          }
        }
        //else if teleportTime>=teleportDelay+1005 //teleport line reappear
        else if teleportTime>teleportDelay+1004 //teleport line reappear //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        {
          //teleLineY+=6
          teleLineY+=6*gDeltaTime //60fps change: per 30fps tick
          if teleLineY>=sprite_height
          {
            teleLineY=sprite_height
            bCanTakeDamage=true
            teleportTime=0
          }
        }
      }
      //attacks **************************************************
      if teleportTime<teleportDelay
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1

        //---------- Red Circle ----------
        //redCircleTime+=1
        redCircleTime+=gDeltaTime //60fps change: counts 30fps ticks
        if redCircleTime>=redCircleWait
        {
          var x1,y1,cirDir;
          if image_xscale=1
          {
            x1=-49
            cirDir=random_range(-35,35)
          }
          else
          {
            x1=49
            cirDir=random_range(145,215)
          }
          y1=9
          effect=instance_create(x+x1,y+y1,oEffect)
          effect.sprite_index=sEnergyRip1
          effect.image_speed=0.75
          effect.image_xscale=0.35
          effect.image_yscale=0.35
          effect.newBlend=1

          redAtk=instance_create(x+x1,y+y1,oSpireGuardRed)
          redAtk.movePattern=normalAtkSeq
          redAtk.moveSpeed=3
          //redAtk.direction=cirDir
          redAtk._direction=cirDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

          normalAtkSeq+=1
          if normalAtkSeq=2
            normalAtkSeq=0
          redCircleTime=0
        }
        //---------- Blue Circle ----------
        //blueCircleTime+=1
        blueCircleTime+=gDeltaTime //60fps change: counts 30fps ticks
        if blueCircleTime>=blueCircleWait
        {
          var x1,y1,cirDir;
          if image_xscale=1
          {
            x1=33
            cirDir=random_range(-35,35)
          }
          else
          {
            x1=-33
            cirDir=random_range(145,215)
          }
          y1=40
          effect=instance_create(x+x1,y+y1,oEffect)
          effect.sprite_index=sEnergyRip1
          effect.image_speed=0.75
          effect.image_xscale=0.35
          effect.image_yscale=0.35
          effect.newBlend=1

          blueAtk=instance_create(x+x1,y+y1,oSpireGuardBlue)
          blueAtk.movePattern=normalAtkSeq
          blueAtk.moveSpeed=3
          //blueAtk.direction=cirDir
          blueAtk._direction=cirDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

          normalAtkSeq+=1
          if normalAtkSeq=2
            normalAtkSeq=0
          blueCircleTime=0
        }
        //---------- Green Circle ----------
        //greenCircleTime+=1
        greenCircleTime+=gDeltaTime //60fps change: counts 30fps ticks
        if greenCircleTime>=greenCircleWait
        {
          var x1,y1,cirDir;
          if image_xscale=1
          {
            x1=19
            cirDir=random_range(-20,20)
          }
          else
          {
            x1=-19
            cirDir=random_range(160,200)
          }
          y1=-36
          effect=instance_create(x+x1,y+y1,oEffect)
          effect.sprite_index=sEnergyRip1
          effect.image_speed=0.75
          effect.image_xscale=0.35
          effect.image_yscale=0.35
          effect.newBlend=1

          greenAtk=instance_create(x+x1,y+y1,oSpireGuardGreen)
          greenAtk.movePattern=normalAtkSeq
          greenAtk.moveSpeed=3
          //greenAtk.direction=cirDir
          greenAtk._direction=cirDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

          normalAtkSeq+=1
          if normalAtkSeq=2
            normalAtkSeq=0
          greenCircleTime=0
        }
      }
    }
    if teleportTime<teleportDelay
    {
      //-------------------- BIG ATTACK --------------------
      //bigAttackTime+=1
      bigAttackTime+=gDeltaTime //60fps change: counts 30fps ticks
      if bigAttackDelay=0
      {
        if bigAttackTime>=bigAttackWait
        {
          bigAttackDelay=bigAttackWait
          bigAttackTime=bigAttackWait
        }
      }
      if bigAttackTime>=bigAttackDelay and bigAttackDelay!=0
      {
        //if bigAttackTime=bigAttackDelay
        if scrCountPass(bigAttackTime,bigAttackDelay) //60fps change: once, when the count reaches it
        {
          afterImage=instance_create(x,y,oEnemyAfterImage)
          afterImage.image_alpha=1
          afterImage.sprite_index=sprite_index
          afterImage.image_index=image_index
          afterImage.image_xscale=image_xscale
          afterImage.imageFade=0.04
          if image_xscale=1
            afterImage.xScalingSet=0.1
          else
            afterImage.xScalingSet=-0.1
          afterImage.yScalingSet=0.1
          baseColor=c_silver

          if currentAttack=maxAttack
            currentAttack=0
          if maxAttack=10
          {
            baseColor=c_orange
            currentAttack=9
            maxAttack=4
          }
          image_blend=baseColor
          currentAttack+=1
        }
        if currentAttack=1 //---------- outward red circle ----------
        {
          //if bigAttackTime=bigAttackDelay+40
          if scrCountPass(bigAttackTime,bigAttackDelay+40) //60fps change: once, when the count reaches it
          {
            var cirDir;
            cirDir=0
            for(i=0;i<bigAtk1Amt;i+=1)
            {
              bigAtkRed[i]=instance_create(xCenter,yGround-128,oSpireGuardRed)
              bigAtkRed[i].movePattern=0
              bigAtkRed[i].moveSpeed=1
              //bigAtkRed[i].direction=cirDir
              bigAtkRed[i]._direction=cirDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              cirDir+=360/bigAtk1Amt
            }
          }
          //else if bigAttackTime=bigAttackDelay+220
          else if scrCountPass(bigAttackTime,bigAttackDelay+220) //60fps change: once, when the count reaches it
          {
            for(i=0;i<bigAtk1Amt;i+=1)
            {
              with bigAtkRed[i]
                instance_destroy()
            }
            redCircleTime-=20
            blueCircleTime-=20
            greenCircleTime-=20
            baseColor=c_white
            image_blend=baseColor
            bigAttackTime=0
            bigAttackDelay=0
          }
        }
        else if currentAttack=2 //---------- circling blue circle ----------
        {
          //if bigAttackTime=bigAttackDelay+40
          if scrCountPass(bigAttackTime,bigAttackDelay+40) //60fps change: once, when the count reaches it
          {
            blueCirDist=8
            blueCirSpin=0
            var cirDir;
            cirDir=0
            for(i=0;i<bigAtk1Amt;i+=1)
            {
              bigAtkBlue[i]=instance_create(xCenter,yGround-128,oSpireGuardBlue)
              bigAtkBlue[i].x=x+lengthdir_x(blueCirDist,cirDir)
              bigAtkBlue[i].y=y+lengthdir_y(blueCirDist,cirDir)
              bigAtkBlue[i].movePattern=0
              bigAtkBlue[i].moveSpeed=0
              cirDir+=360/bigAtk1Amt
            }
          }
          //else if bigAttackTime>=bigAttackDelay+41 and bigAttackTime<=bigAttackDelay+219
          else if bigAttackTime>bigAttackDelay+40 and bigAttackTime<=bigAttackDelay+219 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            //blueCirDist+=1
            blueCirDist+=1*gDeltaTime //60fps change: per 30fps tick
            //blueCirSpin+=4
            blueCirSpin+=4*gDeltaTime //60fps change: per 30fps tick
            var cirDir;
            cirDir=0
            for(i=0;i<bigAtk1Amt;i+=1)
            {
              bigAtkBlue[i].x=xCenter+lengthdir_x(blueCirDist,cirDir+blueCirSpin)
              bigAtkBlue[i].y=(yGround-128)+lengthdir_y(blueCirDist,cirDir+blueCirSpin)
              cirDir+=360/bigAtk1Amt
            }
          }
          //else if bigAttackTime=bigAttackDelay+220
          else if scrCountPass(bigAttackTime,bigAttackDelay+220) //60fps change: once, when the count reaches it
          {
            for(i=0;i<bigAtk1Amt;i+=1)
            {
              with bigAtkBlue[i]
                instance_destroy()
            }
            redCircleTime-=20
            blueCircleTime-=20
            greenCircleTime-=20
            baseColor=c_white
            image_blend=baseColor
            bigAttackTime=0
            bigAttackDelay=0
          }
        }
        else if currentAttack=3 //---------- straight green circle ----------
        {
          //if bigAttackTime=bigAttackDelay+40
          if scrCountPass(bigAttackTime,bigAttackDelay+40) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter+roomSpan+64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=185
            bigAtkGreen._direction=185 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+80
          else if scrCountPass(bigAttackTime,bigAttackDelay+80) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter-roomSpan-64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=-5
            bigAtkGreen._direction=-5 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+110
          else if scrCountPass(bigAttackTime,bigAttackDelay+110) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter+roomSpan+64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=185
            bigAtkGreen._direction=185 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+130
          else if scrCountPass(bigAttackTime,bigAttackDelay+130) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter-roomSpan-64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=-5
            bigAtkGreen._direction=-5 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+140
          else if scrCountPass(bigAttackTime,bigAttackDelay+140) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter+roomSpan+64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=185
            bigAtkGreen._direction=185 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+170
          else if scrCountPass(bigAttackTime,bigAttackDelay+170) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter+roomSpan+64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=185
            bigAtkGreen._direction=185 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkGreen=instance_create(xCenter-roomSpan-64,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=3.5
            //bigAtkGreen.direction=-5
            bigAtkGreen._direction=-5 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+210
          else if scrCountPass(bigAttackTime,bigAttackDelay+210) //60fps change: once, when the count reaches it
          {
            redCircleTime-=20
            blueCircleTime-=20
            greenCircleTime-=20
            baseColor=c_white
            image_blend=baseColor
            bigAttackTime=0
            bigAttackDelay=0
          }
        }
        else if currentAttack=4 //---------- straight all color circle ----------
        {
          //if bigAttackTime=bigAttackDelay+40
          if scrCountPass(bigAttackTime,bigAttackDelay+40) //60fps change: once, when the count reaches it
          {
            bigAtkRed=instance_create(xCenter,yGround-128,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=2
            //bigAtkRed.direction=90
            bigAtkRed._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter,yGround-128,oSpireGuardBlue)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=2
            //bigAtkBlue.direction=210
            bigAtkBlue._direction=210 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkGreen=instance_create(xCenter,yGround-128,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=2
            //bigAtkGreen.direction=330
            bigAtkGreen._direction=330 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+100
          else if scrCountPass(bigAttackTime,bigAttackDelay+100) //60fps change: once, when the count reaches it
          {
            bigAtkRed=instance_create(xCenter,yGround-128,oSpireGuardGreen)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=2
            //bigAtkRed.direction=90
            bigAtkRed._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter,yGround-128,oSpireGuardRed)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=2
            //bigAtkBlue.direction=210
            bigAtkBlue._direction=210 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkGreen=instance_create(xCenter,yGround-128,oSpireGuardBlue)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=2
            //bigAtkGreen.direction=330
            bigAtkGreen._direction=330 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+160
          else if scrCountPass(bigAttackTime,bigAttackDelay+160) //60fps change: once, when the count reaches it
          {
            bigAtkRed=instance_create(xCenter,yGround-128,oSpireGuardBlue)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=2
            //bigAtkRed.direction=90
            bigAtkRed._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter,yGround-128,oSpireGuardGreen)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=2
            //bigAtkBlue.direction=210
            bigAtkBlue._direction=210 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkGreen=instance_create(xCenter,yGround-128,oSpireGuardRed)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=2
            //bigAtkGreen.direction=330
            bigAtkGreen._direction=330 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+210
          else if scrCountPass(bigAttackTime,bigAttackDelay+210) //60fps change: once, when the count reaches it
          {
            redCircleTime-=20
            blueCircleTime-=20
            greenCircleTime-=20
            baseColor=c_white
            image_blend=baseColor
            bigAttackTime=0
            bigAttackDelay=0
          }
        }
        else if currentAttack=10 //---------- super attack with all color circles ----------
        {
          //if bigAttackTime>=bigAttackDelay+20 and bigAttackTime<=bigAttackDelay+59
          if bigAttackTime>bigAttackDelay+19 and bigAttackTime<=bigAttackDelay+59 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            oEvSoFSW1.fadeColor=c_black
            //oEvSoFSW1.bossFinishFadeAlpha+=0.005
            oEvSoFSW1.bossFinishFadeAlpha+=0.005*gDeltaTime //60fps change: per 30fps tick
          }
          //else if bigAttackTime=bigAttackDelay+80
          else if scrCountPass(bigAttackTime,bigAttackDelay+80) //60fps change: once, when the count reaches it
          {
            var x1;
            x1=xCenter-96
            for(i=0;i<3;i+=1)
            {
              bigAtkGreen=instance_create(x1,yGround+64,oSpireGuardGreen)
              bigAtkGreen.movePattern=0
              bigAtkGreen.moveSpeed=2.5
              //bigAtkGreen.direction=90
              bigAtkGreen._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              x1+=96
            }
          }
          //else if bigAttackTime=bigAttackDelay+210
          else if scrCountPass(bigAttackTime,bigAttackDelay+210) //60fps change: once, when the count reaches it
          {
            bigAtkRed=instance_create(xCenter,yGround-256,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=3.25
            //bigAtkRed.direction=225
            bigAtkRed._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkRed=instance_create(xCenter,yGround-256,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=3.25
            //bigAtkRed.direction=315
            bigAtkRed._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkRed=instance_create(xCenter,yGround,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=3.25
            //bigAtkRed.direction=45
            bigAtkRed._direction=45 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkRed=instance_create(xCenter,yGround,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=3.25
            //bigAtkRed.direction=135
            bigAtkRed._direction=135 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+320
          else if scrCountPass(bigAttackTime,bigAttackDelay+320) //60fps change: once, when the count reaches it
          {
            bigAtkBlue=instance_create(xCenter-roomSpan-32,yGround-128,oSpireGuardBlue)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=3.25
            //bigAtkBlue.direction=0
            bigAtkBlue._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter+roomSpan+32,yGround-128,oSpireGuardBlue)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=3.25
            //bigAtkBlue.direction=180
            bigAtkBlue._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter,yGround+32,oSpireGuardBlue)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=3.25
            //bigAtkBlue.direction=90
            bigAtkBlue._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkBlue=instance_create(xCenter,yGround-288,oSpireGuardBlue)
            bigAtkBlue.movePattern=0
            bigAtkBlue.moveSpeed=3.25
            //bigAtkBlue.direction=270
            bigAtkBlue._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if bigAttackTime=bigAttackDelay+430
          else if scrCountPass(bigAttackTime,bigAttackDelay+430) //60fps change: once, when the count reaches it
          {
            bigAtkGreen=instance_create(xCenter+roomSpan+32,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=1.75
            //bigAtkGreen.direction=175
            bigAtkGreen._direction=175 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkGreen=instance_create(xCenter-roomSpan-32,yGround-192,oSpireGuardGreen)
            bigAtkGreen.movePattern=0
            bigAtkGreen.moveSpeed=1.75
            //bigAtkGreen.direction=5
            bigAtkGreen._direction=5 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            bigAtkRed=instance_create(xCenter+roomSpan+32,yGround+32,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=0
            bigAtkRed=instance_create(xCenter-roomSpan-32,yGround+32,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=0
            bigAtkRed=instance_create(xCenter+roomSpan+32,yGround-288,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=0
            bigAtkRed=instance_create(xCenter-roomSpan-32,yGround-288,oSpireGuardRed)
            bigAtkRed.movePattern=0
            bigAtkRed.moveSpeed=0
            bigAtkBlue=instance_create(xCenter,yGround-128,oSpireGuardBlue)
            bigAtkBlue.movePattern=270
            bigAtkBlue.moveSpeed=0
          }
          //else if bigAttackTime=bigAttackDelay+640
          else if scrCountPass(bigAttackTime,bigAttackDelay+640) //60fps change: once, when the count reaches it
          {
            with oSpireGuardRed
              instance_destroy()
            with oSpireGuardBlue
              instance_destroy()
            with oSpireGuardGreen
              instance_destroy()
          }
          //else if bigAttackTime>=bigAttackDelay+641 and bigAttackTime<=bigAttackDelay+670
          else if bigAttackTime>bigAttackDelay+640 and bigAttackTime<=bigAttackDelay+670 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
            //oEvSoFSW1.bossFinishFadeAlpha-=0.005
            oEvSoFSW1.bossFinishFadeAlpha-=0.005*gDeltaTime //60fps change: per 30fps tick
          //else if bigAttackTime=bigAttackDelay+671
          else if scrCountPass(bigAttackTime,bigAttackDelay+671) //60fps change: once, when the count reaches it
          {
            baseColor=c_white
            image_blend=baseColor
            oEvSoFSW1.fadeColor=c_white
            redCircleTime-=30
            blueCircleTime-=30
            greenCircleTime-=30
            bigAttackTime=0
            bigAttackDelay=0
            currentAttack=0
          }
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      redCircleWait-=global.difficulty*2
      blueCircleWait-=global.difficulty*2
      greenCircleWait-=global.difficulty*2
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      redCircleWait-=global.difficulty
      blueCircleWait-=global.difficulty
      greenCircleWait-=global.difficulty
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      redCircleWait-=global.difficulty*2
      blueCircleWait-=global.difficulty*2
      greenCircleWait-=global.difficulty*2
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      redCircleWait-=global.difficulty
      blueCircleWait-=global.difficulty
      greenCircleWait-=global.difficulty
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      redCircleWait-=global.difficulty*2
      blueCircleWait-=global.difficulty*2
      greenCircleWait-=global.difficulty*2
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      redCircleWait-=global.difficulty
      blueCircleWait-=global.difficulty
      greenCircleWait-=global.difficulty
      bigAttackWait-=global.difficulty*2
      maxAttack=10
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      redCircleWait-=global.difficulty*2
      blueCircleWait-=global.difficulty*2
      greenCircleWait-=global.difficulty*2
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      redCircleWait-=global.difficulty
      blueCircleWait-=global.difficulty
      greenCircleWait-=global.difficulty
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      redCircleWait-=global.difficulty*2
      blueCircleWait-=global.difficulty*2
      greenCircleWait-=global.difficulty*2
      bigAttackWait-=global.difficulty*2
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.attackType=other.HURRICANE_DASH {other.physicalPower=oPlayer1.physicalPower*0.9}

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
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=3
  }
}
else if cripplePointProgress=3
{
  if damageTime=flashTime and dieFade=0
    inflictStatus(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if teleportTime>=teleportDelay
{
  if image_xscale=1
  {
    offsetX1=72
    offsetX2=sprite_width
    offsetX3=0
  }
  else
  {
    offsetX1=97
    offsetX2=-sprite_width
    offsetX3=sprite_width
  }

  draw_sprite_part_ext(sprite_index,image_index,0,0,offsetX2,teleLineY,x-offsetX1-offsetX3,y-sprite_yoffset,image_xscale,image_yscale,c_white,1)
  //draw_set_alpha(1)
  //draw_set_color(c_teal)
  //draw_line(x-offsetX1,y-sprite_yoffset+teleLineY,x-offsetX1+offsetX2,y-sprite_yoffset+teleLineY)
  //if global.gamePaused=false
  if global.gamePaused=false and gDeltaDoTicks //60fps change: the sparks once per 30fps tick
  {
    if image_xscale=1
    {
      for(ii=0;ii<sprite_width;ii+=6)
        effect_create_above(ef_spark,x-offsetX1+ii,y-sprite_yoffset+teleLineY,0,make_color_rgb(random(255),random(255),random(255)))
    }
    else
    {
      for(ii=0;ii<-sprite_width;ii+=6)
        effect_create_above(ef_spark,x-offsetX1+ii,y-sprite_yoffset+teleLineY,0,make_color_rgb(random(255),random(255),random(255)))
    }
  }
}
else
  event_inherited()
