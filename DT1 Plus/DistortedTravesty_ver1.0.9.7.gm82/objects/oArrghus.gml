#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-24,-24,24,24)
image_speed=0
miniEyeSpeed=5
miniEyeDir=0
miniEyeXDist=0
miniEyeYDist=0
miniEyePattern=0
miniEyeTime=0
destinX=0
destinY=0
moveWait=150
moveTime=0
bMovedToCenter=0
warnAlpha=1
alphaChange=0

//Enemy base statistics
eName="Arrghus"
maxLife=15000
life=maxLife
expWorth=95000
physicalPower=450
physicalDefense=180
spiritPower=470
spiritDefense=215
FIREresist=10
WATERresist=-50
WINDresist=90
EARTHresist=100
skillResist=5
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
specialAttack=0
specialAtkTime=0
if global.difficulty=1
{
  fortifyWait=830
  crossSpiralWait=320
  crossSpiralFreq=20
  crossSpiralAmt=10
  lightningCrushWait=260
  lightningCrushAmt=2
  specialAmount=10
}
else if global.difficulty=2
{
  fortifyWait=800
  crossSpiralWait=300
  crossSpiralFreq=18
  crossSpiralAmt=12
  lightningCrushWait=240
  lightningCrushAmt=2
  specialAmount=12
}
else if global.difficulty=3
{
  fortifyWait=770
  crossSpiralWait=280
  crossSpiralFreq=16
  crossSpiralAmt=14
  lightningCrushWait=230
  lightningCrushAmt=3
  specialAmount=14
}
else if global.difficulty=4
{
  fortifyWait=740
  crossSpiralWait=260
  crossSpiralFreq=14
  crossSpiralAmt=16
  lightningCrushWait=210
  lightningCrushAmt=3
  specialAmount=16
}
fortifyTime=0
fortifyDelay=0
crossSpiralTime=0
crossSpiralDelay=0
lightningCrushTime=10

bossProgress=0
breakProgress=0
startMoveTime=0
laserDist=0
laserAttackDir=0
otherLaserDir=90
difficultyAdjustments(global.difficulty)
cripplePointText=">Full Swing#>Upward Strike#>Full Swing#>Any Physical"
setPDefense=physicalDefense
setSDefense=spiritDefense

xCenter=512
yGround=320
roomSpan=240
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
    combatText="First thing to note about this is it's completely immune to Earth attacks. Wind will damage it, but it isn't worth your time. It also seems to have a slight resistance to Fire, luckily it is vulnerable to Water. While it has it's protective blocks around itself, it will syphon energy from the temple. It's energy link is protected by a block, You need to find a way to remove that block and severe the link, which I think can be broken with a high powered dash."
    sideText="This is from the Four Swords Zelda game."
    oVDbossBlocks.leftBlock.x=448
    oVDbossBlocks.rightBlock.x=544
    oVDbossBlocks.topBlock.y=0
    oVDbossBlocks.bottomShortLeft.y=288
    oVDbossBlocks.bottomShortRight.y=288
    instance_create(514,48,oArrghusEnergyLink)
    for(i=0;i<8;i+=1)
      miniEye[i]=instance_create(x,y,oMiniArrghus)
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    image_index=breakProgress
    //HP regen and defense set **************************************************
    if instance_exists(oArrghusEnergyLink)
    {
      physicalDefense=setPDefense*5
      spiritDefense=setSDefense*5
      if life<maxLife
        //life+=1
        life+=gDeltaTime //60fps change: per 30fps tick
    }
    else if specialAttack=2
    {
      physicalDefense=setPDefense*5
      spiritDefense=setSDefense*5
    }
    else
    {
      physicalDefense=setPDefense
      spiritDefense=setSDefense
    }
    //check if mini eyes exist **************************************************
    if !instance_exists(oMiniArrghus)
    {
      if breakProgress=0
      {
        oVDbossBlocks.tbMoveDir=1
        oVDbossBlocks.bllbMoveDir=2
        oVDbossBlocks.brlbMoveDir=2
        breakProgress=1
      }
    }
    //Mini Arrghus movement **************************************************
    for(i=0;i<8;i+=1)
    {
      miniEye[i].x=x+lengthdir_x(miniEyeXDist,miniEyeDir+(i*45))
      miniEye[i].y=y+lengthdir_y(miniEyeYDist,miniEyeDir+(i*45))
    }
    //miniEyeDir+=miniEyeSpeed
    miniEyeDir+=miniEyeSpeed*gDeltaTime //60fps change: per 30fps tick
    //miniEyeTime+=1
    miniEyeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if miniEyePattern=0 //initial spread
    {
      if miniEyeTime<=48
      {
        //miniEyeXDist+=1
        miniEyeXDist+=1*gDeltaTime //60fps change: per 30fps tick
        //miniEyeYDist+=1
        miniEyeYDist+=1*gDeltaTime //60fps change: per 30fps tick
      }
      if miniEyeTime>=80
      {
        miniEyePattern=choose(1,2)
        miniEyeTime=0
      }
    }
    else if miniEyePattern=1 //x spread
    {
      if miniEyeTime<=50
      {
        //miniEyeXDist+=1
        miniEyeXDist+=1*gDeltaTime //60fps change: per 30fps tick
        //miniEyeYDist-=0.1
        miniEyeYDist-=0.1*gDeltaTime //60fps change: per 30fps tick
      }
      //else if miniEyeTime>=111 and miniEyeTime<=160
      else if miniEyeTime>110 and miniEyeTime<=160 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        //miniEyeXDist-=1
        miniEyeXDist-=1*gDeltaTime //60fps change: per 30fps tick
        //miniEyeYDist+=0.1
        miniEyeYDist+=0.1*gDeltaTime //60fps change: per 30fps tick
      }
      else if miniEyeTime>=200
      {
        miniEyePattern=2
        miniEyeTime=0
      }
    }
    else if miniEyePattern=2 //y spread
    {
      if miniEyeTime<=50
      {
        //miniEyeXDist-=0.1
        miniEyeXDist-=0.1*gDeltaTime //60fps change: per 30fps tick
        //miniEyeYDist+=1
        miniEyeYDist+=1*gDeltaTime //60fps change: per 30fps tick
      }
      //else if miniEyeTime>=111 and miniEyeTime<=160
      else if miniEyeTime>110 and miniEyeTime<=160 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        //miniEyeXDist+=0.1
        miniEyeXDist+=0.1*gDeltaTime //60fps change: per 30fps tick
        //miniEyeYDist-=1
        miniEyeYDist-=1*gDeltaTime //60fps change: per 30fps tick
      }
      else if miniEyeTime>=200
      {
        miniEyePattern=1
        miniEyeTime=0
      }
    }
    //movement **************************************************
    if breakProgress=2
    {
      //startMoveTime+=1
      startMoveTime+=gDeltaTime //60fps change: counts 30fps ticks
      if startMoveTime>=75
      {
        moveTime=moveWait-90
        destinX=512
        destinY=176
        crossSpiralTime=crossSpiralWait
        if lightningCrushTime<0
          lightningCrushTime=0
        breakProgress=3
      }
    }
    else if breakProgress=3
    {
      //------------------------- special attack -------------------------
      if specialAttack=1 and fortifyTime<fortifyWait and fortifyDelay=0
      {
        crossSpiralTime=0
        crossSpiralDelay=0
        lightningCrushTime=0
        specialAttack=2
      }
      else if specialAttack=2
      {
        if specialAtkTime=0 //move to attack position
        {
          destinX=512
          destinY=112
          //direction=point_direction(x,y,destinX,destinY)
          _direction=point_direction(x,y,destinX,destinY) //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
          //speed=2
          _speed=2 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
          if point_distance(x,y,destinX,destinY)<3
          {
            specialAtkTime=1
            //speed=0
            _speed=0 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
            x=destinX
            y=destinY
          }
        }
        else if specialAtkTime>=1 //create rocks
        {
          //specialAtkTime+=1
          specialAtkTime+=gDeltaTime //60fps change: counts 30fps ticks
          //if specialAtkTime=30
          if scrCountPass(specialAtkTime,30) //60fps change: once, when the count reaches it
          {
            for(i=0;i<specialAmount;i+=1)
            {
              specialRightA[i]=instance_create(x,y,oMMeShot1)
              specialRightA[i].sprite_index=sNeteryuRock
              specialRightA[i].size=2
              specialRightA[i].damageType="SPIRIT"
              specialRightA[i].elementType=4
              specialRightA[i].spiritPower=spiritPower
              specialRightA[i].bulletSpeed=i+1
              //specialRightA[i].direction=180
              specialRightA[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

              specialLeftA[i]=instance_create(x,y,oMMeShot1)
              specialLeftA[i].sprite_index=sNeteryuRock
              specialLeftA[i].size=2
              specialLeftA[i].damageType="SPIRIT"
              specialLeftA[i].elementType=4
              specialLeftA[i].spiritPower=spiritPower
              specialLeftA[i].bulletSpeed=i+1
              //specialLeftA[i].direction=0
              specialLeftA[i]._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            }
          }
          //else if specialAtkTime=32 //Jeremy's message about attack sucking
          else if scrCountPass(specialAtkTime,32) //Jeremy's message about attack sucking //60fps change: once, when the count reaches it
          {
            msgCreate("This is going to suck.#Also you can't deflect this attack, just dodge it.",0,oMessagePerson,global.mainCharacters[1],0,1)
            newMessage.fadingTime=90
          }
          //else if specialAtkTime=44 //stop rocks from moving
          else if scrCountPass(specialAtkTime,44) //stop rocks from moving //60fps change: once, when the count reaches it
          {
            for(i=0;i<specialAmount;i+=1)
            {
              specialRightA[i].bulletSpeed=0
              specialLeftA[i].bulletSpeed=0
            }
            specialProg=0
          }
          //else if specialAtkTime=56 //lightning strike
          else if scrCountPass(specialAtkTime,56) //lightning strike //60fps change: once, when the count reaches it
          {
            playSound(global.snd_Shock,0,0.9)
            instance_create(0,0,oViewShaker)
            var lightPlacer;
            lightPlacer=352
            for(i=0;i<3;i+=1)
            {
              lightningStrike[i]=instance_create(lightPlacer,yGround,oMMeShot1)
              lightningStrike[i].sprite_index=sDTorsoLightning
              lightningStrike[i].size=2
              lightningStrike[i].damageType="SPIRIT"
              lightningStrike[i].elementType=3
              lightningStrike[i].spiritPower=spiritPower
              lightningStrike[i].image_xscale=0.8
              lightningStrike[i].image_yscale=4.25
              lightningStrike[i].image_speed=0.6+random(0.2)
              lightningStrike[i].bulletSpeed=0
              lightPlacer+=160
            }
          }
          else if specialAtkTime>=120 and specialAtkTime<10000 //attack with rocks (create line)
          {
            //if specialAtkTime mod 12=0
            if scrModPass(specialAtkTime,12) //60fps change: once each time the count reaches a multiple of it
            {
              for(i=0;i<9;i+=1)
              {
                specialRightB[i]=instance_create(specialRightA[specialProg].x,specialRightA[specialProg].y,oMMeShot1)
                specialRightB[i].sprite_index=sNeteryuRock
                specialRightB[i].size=2
                specialRightB[i].damageType="SPIRIT"
                specialRightB[i].elementType=4
                specialRightB[i].spiritPower=spiritPower
                specialRightB[i].bulletSpeed=i+1
                //specialRightB[i].direction=point_direction(specialRightA[specialProg].x,specialRightA[specialProg].y,oPlayer1.x,oPlayer1.y)
                specialRightB[i]._direction=point_direction(specialRightA[specialProg].x,specialRightA[specialProg].y,oPlayer1.x,oPlayer1.y) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                
                specialLeftB[i]=instance_create(specialLeftA[specialProg].x,specialLeftA[specialProg].y,oMMeShot1)
                specialLeftB[i].sprite_index=sNeteryuRock
                specialLeftB[i].size=2
                specialLeftB[i].damageType="SPIRIT"
                specialLeftB[i].elementType=4
                specialLeftB[i].spiritPower=spiritPower
                specialLeftB[i].bulletSpeed=i+1
                //specialLeftB[i].direction=point_direction(specialLeftA[specialProg].x,specialLeftA[specialProg].y,oPlayer1.x,oPlayer1.y)
                specialLeftB[i]._direction=point_direction(specialLeftA[specialProg].x,specialLeftA[specialProg].y,oPlayer1.x,oPlayer1.y) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              }
              with specialRightA[specialProg]
                instance_destroy()
              with specialLeftA[specialProg]
                instance_destroy()
              specialProg+=1
            }
            if specialProg>=specialAmount and specialAtkTime<10000 //end attack
              specialAtkTime=10001
          }
          else if specialAtkTime>=10050
          {
            for(i=0;i<3;i+=1)
            {
              with lightningStrike[i]
                instance_destroy()
            }
            specialAttack=3
            fortifyTime-=90
            if fortifyTime<0
              fortifyTime=0
          }
        }
      }
      //------------------------- fortify -------------------------
      if specialAttack!=2
      {
        //fortifyTime+=1
        fortifyTime+=gDeltaTime //60fps change: counts 30fps ticks
        if fortifyDelay=0
        {
          if fortifyTime>=fortifyWait
          {
            fortifyDelay=fortifyWait
            fortifyTime=fortifyWait
          }
        }
        if fortifyTime>=fortifyDelay and fortifyDelay!=0
        {
          if bMovedToCenter=0 //move back to center
          {
            destinX=512
            destinY=176
            //direction=point_direction(x,y,destinX,destinY)
            _direction=point_direction(x,y,destinX,destinY) //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
            //speed=2
            _speed=2 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
            if point_distance(x,y,destinX,destinY)<3
            {
              bMovedToCenter=1
              //speed=0
              _speed=0 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
              x=destinX
              y=destinY
            }
          }
          
          //if fortifyTime=fortifyDelay //create laser points
          if scrCountPass(fortifyTime,fortifyDelay) //create laser points //60fps change: once, when the count reaches it
          {
            laserDist=0
            laserAttackDir=0
            otherLaserDir=90
            crossSpiralTime=0
            crossSpiralDelay=0
            lightningCrushTime=0
            for(i=0;i<3;i+=1)
            {
              laserPoint[i]=instance_create(x,y,oMisc)
              laserPoint[i].sprite_index=sNull
              laserPoint[i].type=1
              if i=2
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,otherLaserDir)
                laserPoint[i].y=y+lengthdir_y(laserDist,otherLaserDir)
              }
              else
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,laserAttackDir+(i*180))
                laserPoint[i].y=y+lengthdir_y(laserDist,laserAttackDir+(i*180))
              }
            }
          }
          //else if fortifyTime>=fortifyDelay+1 and fortifyTime<=fortifyDelay+49 //extend lasers
          else if fortifyTime>fortifyDelay and fortifyTime<=fortifyDelay+49 //extend lasers //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            //laserDist+=6
            laserDist+=6*gDeltaTime //60fps change: per 30fps tick
            for(i=0;i<3;i+=1)
            {
              if i=2
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,otherLaserDir)
                laserPoint[i].y=y+lengthdir_y(laserDist,otherLaserDir)
              }
              else
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,laserAttackDir+(i*180))
                laserPoint[i].y=y+lengthdir_y(laserDist,laserAttackDir+(i*180))
              }
            }
          }
          //else if fortifyTime>=fortifyDelay+50 and fortifyTime<=fortifyDelay+230 //laser attack
          else if fortifyTime>fortifyDelay+49 and fortifyTime<=fortifyDelay+230 //laser attack //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            //laserAttackDir+=5
            laserAttackDir+=5*gDeltaTime //60fps change: per 30fps tick
            //otherLaserDir-=2
            otherLaserDir-=2*gDeltaTime //60fps change: per 30fps tick
            for(i=0;i<3;i+=1)
            {
              if i=2
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,otherLaserDir)
                laserPoint[i].y=y+lengthdir_y(laserDist,otherLaserDir)
              }
              else
              {
                laserPoint[i].x=x+lengthdir_x(laserDist,laserAttackDir+(i*180))
                laserPoint[i].y=y+lengthdir_y(laserDist,laserAttackDir+(i*180))
              }
              if collision_line(x,y,laserPoint[i].x,laserPoint[i].y,oPlayer1,true,true)
              {
                with oPlayer1
                  hitPlayer()
              }
            }
          }
          else if fortifyTime>=fortifyDelay+181 and bMovedToCenter=1 //end attack
          {
            for(i=0;i<2;i+=1)
            {
              with laserPoint[i]
                instance_destroy()
            }
            oEvVeiledDetritusW1.bossFinishFadeAlpha=1
            instance_create(514,48,oArrghusEnergyLink)
            for(i=0;i<8;i+=1)
              miniEye[i]=instance_create(x,y,oMiniArrghus)
            oVDbossBlocks.lbMoveDir=2
            oVDbossBlocks.rbMoveDir=2
            oVDbossBlocks.tbMoveDir=2
            oVDbossBlocks.blsbMoveDir=2
            oVDbossBlocks.brsbMoveDir=2
            startMoveTime=0
            bMovedToCenter=0
            fortifyTime=0
            fortifyDelay=0
            miniEyePattern=0
            miniEyeXDist=0
            miniEyeYDist=0
            miniEyeTime=0
            breakProgress=0
          }
        }
        else
        {
          //move normal
          //moveTime+=1
          moveTime+=gDeltaTime //60fps change: counts 30fps ticks
          if moveTime>=moveWait //choose new destination
          {
            destinX=(xCenter-roomSpan+64)+random(roomSpan-32)
            destinY=yGround-64-random(64)
            moveTime=0
          }
          //direction=point_direction(x,y,destinX,destinY)
          _direction=point_direction(x,y,destinX,destinY) //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
          if point_distance(x,y,destinX,destinY)<3
            //speed=0
            _speed=0 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
          else
            //speed=1
            _speed=1 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
        }
      }
    }
    if specialAttack!=2
    {
      //attacks **************************************************
      //---------- Cross Spiral ----------
      if breakProgress=3 or crossSpiralTime>crossSpiralDelay
      {
        if fortifyTime<fortifyWait
          //crossSpiralTime+=1
          crossSpiralTime+=gDeltaTime //60fps change: counts 30fps ticks
      }
      if crossSpiralDelay=0
      {
        if crossSpiralTime>=crossSpiralWait
        {
          crossSpiralDelay=crossSpiralWait
          crossSpiralTime=crossSpiralWait
          oEvVeiledDetritusW1.bossFinishFadeAlpha=0.6
        }
      }
      if crossSpiralTime>=crossSpiralDelay and crossSpiralDelay!=0
      {
        //if crossSpiralTime>=crossSpiralDelay+10 and crossSpiralTime mod crossSpiralFreq=0
        if crossSpiralTime>=crossSpiralDelay+10 and scrModPass(crossSpiralTime,crossSpiralFreq) //60fps change: once each time the count reaches a multiple of it
        {
          csDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
          for(i=0;i<crossSpiralAmt;i+=1)
          {
            newBullet=instance_create(x,y,oMMeShotArc)
            newBullet.sprite_index=sNeteryuRock
            newBullet.damageType="SPIRIT"
            newBullet.elementType=4
            newBullet.spiritPower=spiritPower
            newBullet.bulletSpeed=2.5
            //newBullet.direction=csDir
            newBullet._direction=csDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newBullet.arcTime=65
            newBullet.bulletArc=2
            newBullet.bDestroyOnOutside=1
            csDir+=360/crossSpiralAmt
          }
        }
        
        if crossSpiralTime>=crossSpiralDelay+70 //end attack
        {
          crossSpiralTime=0
          crossSpiralDelay=0
        }
      }
    }
    //---------- Lightning Crush ----------
    //lightningCrushTime+=1
    lightningCrushTime+=gDeltaTime //60fps change: counts 30fps ticks
    if lightningCrushTime>=lightningCrushWait
    {
      for(i=0;i<lightningCrushAmt;i+=1)
      {
        if i=0
          newLightning=instance_create(oPlayer1.x,yGround,oArrghusLightning)
        else
          newLightning=instance_create((xCenter-roomSpan)+random(roomSpan*2),yGround,oArrghusLightning)
        newLightning.spiritPower=spiritPower
        if i=0
          newLightning.bShake=1
        else
          newLightning.bShake=0
        if breakProgress=3
          newLightning.bMakeFire=1
        else
          newLightning.bMakeFire=0
      }
      if breakProgress=3
        lightningCrushTime=0
      else
        lightningCrushTime=-60
    }
    
    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      fortifyWait-=global.difficulty*3
      crossSpiralWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      fortifyWait-=global.difficulty*3
      crossSpiralWait-=global.difficulty*2
      if global.difficulty=4
        crossSpiralFreq-=1
      crossSpiralAmt+=1
      lightningCrushWait-=global.difficulty
      if global.difficulty=4
        lightningCrushAmt+=1
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      fortifyWait-=global.difficulty*3
      crossSpiralWait-=global.difficulty*2
      crossSpiralAmt+=1
      lightningCrushWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      fortifyWait-=global.difficulty*3
      crossSpiralWait-=global.difficulty*2
      if global.difficulty>1
        crossSpiralFreq-=1
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      fortifyWait-=global.difficulty*4
      crossSpiralWait-=global.difficulty*2
      if global.difficulty>2
        crossSpiralAmt+=1
      lightningCrushWait-=global.difficulty*2
      lightningCrushAmt+=global.difficulty
      specialAttack=1
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      fortifyWait-=global.difficulty*4
      crossSpiralWait-=global.difficulty*2
      crossSpiralFreq-=1
      if global.difficulty=4
        crossSpiralAmt+=1
      lightningCrushWait-=global.difficulty
      if global.difficulty>1
        lightningCrushAmt+=1
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      fortifyWait-=global.difficulty*4
      crossSpiralWait-=global.difficulty*2
      crossSpiralFreq-=1
      lightningCrushWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      fortifyWait-=global.difficulty*5
      crossSpiralWait-=global.difficulty*2
      if global.difficulty>1
        crossSpiralFreq-=1
      crossSpiralAmt+=1
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      fortifyWait-=global.difficulty*5
      crossSpiralWait-=global.difficulty*2
      if global.difficulty=4
        crossSpiralFreq-=1
      lightningCrushWait-=global.difficulty*2
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
else
  //speed=0
  _speed=0 //60fps change: _speed/_direction stand in for speed/direction (see correctSpeedDirection at the end)
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Collision_oAttackBase
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
if fortifyTime>fortifyDelay and fortifyTime<fortifyDelay+230 and fortifyDelay!=0
{
  for(i=0;i<3;i+=1)
  {
    draw_set_alpha(1)
    draw_set_color(make_color_rgb(random(105)+150,random(40)+90,random(40)+110))
    draw_line_width(x,y,laserPoint[i].x,laserPoint[i].y,4)
  }
}
event_inherited()
if specialAtkTime>=10 and specialAtkTime<=55
{
  draw_sprite_ext(sWarningSymbol,-1,352,yGround,0.6,0.6,0,c_white,warnAlpha)
  draw_sprite_ext(sWarningSymbol,-1,512,yGround,0.6,0.6,0,c_white,warnAlpha)
  draw_sprite_ext(sWarningSymbol,-1,672,yGround,0.6,0.6,0,c_white,warnAlpha)
  //alphaChange+=1
  alphaChange+=gDeltaTime //60fps change: counts 30fps ticks
  //if alphaChange=8
  if alphaChange>=8 //60fps change: counts 30fps ticks; >= so it still flips if the frame rate changes mid-count
  {
    if warnAlpha=1
      warnAlpha=0
    else
      warnAlpha=1
    alphaChange=0
  }
}
