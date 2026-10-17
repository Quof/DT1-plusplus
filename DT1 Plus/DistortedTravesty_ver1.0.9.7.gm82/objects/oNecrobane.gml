#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-30,40,50)
image_speed=0
frameCount=0
frameIndex=0
image_xscale=-1
rightArmFrame=sNecrobaneArmR1
leftArmFrame=sNecrobaneArmL1
armRX=0
armRY=0
armLX=0
armLY=0
dir=0
laserStartX=0
laserLineColor=c_black
groundLaserLineColor=c_black
lightAlpha=0

//Enemy base statistics
eName="Necrobane"
maxLife=25000
life=maxLife
expWorth=80000
physicalPower=320
physicalDefense=140
spiritPower=310
spiritDefense=200
FIREresist=90
WATERresist=-15
WINDresist=-5
EARTHresist=45
bIsBoss=true
barAmount=2
questType=1
activateBoss=0
currentAttack=0
specialAttack=0
if global.difficulty=1
{
  fireballWait=210
  fireballFreq=14
  eyeSummonWait=70
  skyLaserWait=190
  skyLaserSpacing=58
  groundLaserWait=360
  torchOutWait=1050
}
else if global.difficulty=2
{
  fireballWait=190
  fireballFreq=12
  eyeSummonWait=60
  skyLaserWait=180
  skyLaserSpacing=50
  groundLaserWait=330
  torchOutWait=900
}
else if global.difficulty=3
{
  fireballWait=180
  fireballFreq=11
  eyeSummonWait=50
  skyLaserWait=170
  skyLaserSpacing=46
  groundLaserWait=320
  torchOutWait=870
}
else if global.difficulty=4
{
  fireballWait=170
  fireballFreq=10
  eyeSummonWait=40
  skyLaserWait=160
  skyLaserSpacing=42
  groundLaserWait=310
  torchOutWait=840
}
skyLaserSpaceCheck=skyLaserSpacing

fireballTime=fireballWait-20
bPinFireball=false
eyeSummonTime=10
eyeSpawned=0
skyLaserTime=80
bShowLaserSpots=false
groundLaserTime=50
bShowGroundLaser=false
torchOutTime=0

bSpecialReady=false
bShowSpecialLaser=false
specialXstart=544
specialXspacing=48
specialYspacing=72

bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Any Attack while Eyes open#>Full Swing"

xCenter=800
yGround=304
roomSpan=240

//teleport spots
xTele[0]=xCenter-128
xTele[1]=xCenter-96
xTele[2]=xCenter+96
xTele[3]=xCenter+128
currentSpotX=xTele[3]
moveTime=0
moveDelay=600
moveDirection=0
bMoving=false

leftTorch=instance_create(640,278,oBRFTorch)
midTorch=instance_create(800,278,oBRFTorch)
rightTorch=instance_create(960,278,oBRFTorch)
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
    combatText="The only thing I can analyze is his Fire Storm attack. He will summon fireballs from the sky which rain down at an angle, this can make them troublesome to dodge. I recommend staying near the middle to give yourself the most time to react. I can see a lightning attack which I have named 'Death From Above', but that's all I know about it. The Darkness seems to be blocking any further analysis. Remember your techniques, offensive and defensive. Be observant to what is going on."
    sideText="Gene has called on The Darkness and is using Dracula from 'Circle of the Moon' against you. It does not have it's original properties though. Gene has altered it to an extreme point. That was a pretty good lie by the way. It's me that sucks at Castlevania, you just don't like 2 for some reason. Either way, this is no time to slack. Gene is not holding back at all. It sucks that we have to fight someone we know from our world. I can't believe The Darkness has corrupted someone this much."
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    //torches go out
    //torchOutTime+=1
    torchOutTime+=gDeltaTime //60fps change: counts 30fps ticks
    if torchOutTime>=torchOutWait
    {
      leftTorch.bBurning=false
      midTorch.bBurning=false
      rightTorch.bBurning=false
      torchOutTime=0
    }

    //facing Direction
    if x>xCenter
      image_xscale=-1
    else
      image_xscale=1

    //torches
    if leftTorch.bBurning=true and midTorch.bBurning=true and rightTorch.bBurning=true
      bCanTakeDamage=true
    else
      bCanTakeDamage=false

    //initiate special attack
    if specialAttack=1
    {
      specialAttack=100
      rightArmFrame=sNecrobaneArmR2
      leftArmFrame=sNecrobaneArmL2
      sprite_index=sNecrobaneAnger
      leftTorch.bBurning=false
      midTorch.bBurning=false
      rightTorch.bBurning=false
      laserLineColor=c_black
      groundLaserLineColor=c_black
      bShowLaserSpots=false
      bShowGroundLaser=false
      fireballTime=50
      //eyeSummonTime=10
      skyLaserTime=20
      groundLaserTime=10

      var stringToShow;
      stringToShow="It is time you feel true terror!"
      messageWidth=string_width(stringToShow)
      newMessage=instance_create(256-(messageWidth/2),48,oMessageInfoSpot)
      newMessage.message=stringToShow
      newMessage.talker=global.mainCharacters[2]
      newMessage.window=2
      newMessage.fadingTime=(string_length(stringToShow)*1.5)+10

      bSpecialReady=true
    }
    //**************************************** MOVEMENT ****************************************
    //moveTime+=1
    moveTime+=gDeltaTime //60fps change: counts 30fps ticks
    if moveTime>=moveDelay
    {
      //if moveTime=moveDelay+5 //move start effect
      if scrCountPass(moveTime,moveDelay+5) //move start effect //60fps change: once, when the count reaches it
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1; afterImage.image_xscale=image_xscale
        afterImage.sprite_index=sprite_index; afterImage.image_index=image_index
        afterImage.imageFade=0.04
        if image_xscale=1
          afterImage.xScalingSet=0.005
        else
          afterImage.xScalingSet=-0.005
        afterImage.yScalingSet=0.025
      }
      //else if moveTime=moveDelay+35 //find new spot
      else if scrCountPass(moveTime,moveDelay+35) //find new spot //60fps change: once, when the count reaches it
      {
        var oldSpot,newSpot;
        oldSpot=currentSpotX
        while(oldSpot=currentSpotX)
        {
          newSpot=irandom_range(0,3)
          currentSpotX=xTele[newSpot]
        }
        if oldSpot>currentSpotX //left
          moveDirection=0
        else //right
          moveDirection=1
        bMoving=true
      }

      if bMoving=true
      {
        if gDeltaDoTicks //60fps change (added): the afterimage once per 30fps tick
        {
          afterImage=instance_create(x,y,oEnemyAfterImage)
          afterImage.image_alpha=0.8; afterImage.image_xscale=image_xscale
          afterImage.sprite_index=sprite_index; afterImage.image_index=image_index
          afterImage.imageFade=0.15
        }
        if moveDirection=0 //left
        {
          if x>currentSpotX
            //x-=8
            x-=8*gDeltaTime //60fps change: per 30fps tick
          else
          {
            bMoving=false
            moveTime=0
          }
        }
        else //right
        {
          if x<currentSpotX
            //x+=8
            x+=8*gDeltaTime //60fps change: per 30fps tick
          else
          {
            bMoving=false
            moveTime=0
          }
        }
      }
    }
    //**************************************** FIRE BALL ATTACK ****************************************
    if fireballTime<fireballWait and currentAttack!=2 and bSpecialReady=false
      //fireballTime+=1
      fireballTime+=gDeltaTime //60fps change: counts 30fps ticks
    if fireballTime>=fireballWait and currentAttack!=2 and currentAttack!=3
    {
      //fireballTime+=1
      fireballTime+=gDeltaTime //60fps change: counts 30fps ticks
      currentAttack=1
      //if fireballTime=fireballWait+1
      if scrCountPass(fireballTime,fireballWait+1) //60fps change: once, when the count reaches it
        rightArmFrame=sNecrobaneArmR2
      //if fireballTime>=fireballWait+20 and fireballTime mod fireballFreq=0
      if fireballTime>=fireballWait+20 and scrModPass(fireballTime,fireballFreq) //60fps change: once each time the count reaches a multiple of it
      {
        playSound(global.snd_SpellFireball,0,0.95)
        if bPinFireball=false
        {
          var xFireball,yFireball,fireballAngle;
          if image_xscale=1
          {
            xFireball=xCenter-260
            fireballAngle=315
          }
          else
          {
            xFireball=xCenter+260
            fireballAngle=225
          }
          yFireball=random_range(-288,288)
          fireballAtk=instance_create(xFireball,yFireball,oNecrobaneFire)
          fireballAtk.damageType="SPIRIT"; fireballAtk.spiritPower=spiritPower
          fireballAtk.elementType=1; fireballAtk.bulletSpeed=10
          fireballAtk.decayTime=90; fireballAtk.size=1
          //fireballAtk.image_xscale=image_xscale; fireballAtk.direction=fireballAngle; fireballAtk.image_speed=0.33
          fireballAtk.image_xscale=image_xscale; fireballAtk._direction=fireballAngle; fireballAtk.image_speed=0.33 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        }
        else
        {
          xFireball=xCenter-260
          yFireball=random_range(-288,288)
          fireballAtk=instance_create(xFireball,yFireball,oNecrobaneFire)
          fireballAtk.damageType="SPIRIT"; fireballAtk.spiritPower=spiritPower
          fireballAtk.elementType=1; fireballAtk.bulletSpeed=10
          fireballAtk.decayTime=90; fireballAtk.size=1
          //fireballAtk.direction=315; fireballAtk.image_speed=0.33
          fireballAtk._direction=315; fireballAtk.image_speed=0.33 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

          xFireball=xCenter+260
          yFireball=random_range(-288,288)
          fireballAtk=instance_create(xFireball,yFireball,oNecrobaneFire)
          fireballAtk.damageType="SPIRIT"; fireballAtk.spiritPower=spiritPower
          fireballAtk.elementType=1; fireballAtk.bulletSpeed=10
          fireballAtk.decayTime=90; fireballAtk.size=1
          //fireballAtk.image_xscale=-1; fireballAtk.direction=225; fireballAtk.image_speed=0.33
          fireballAtk.image_xscale=-1; fireballAtk._direction=225; fireballAtk.image_speed=0.33 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        }
      }
      if fireballTime>=fireballWait+120
      {
        rightArmFrame=sNecrobaneArmR1
        currentAttack=0
        fireballTime=0
      }
    }
    //**************************************** EYEBALL ATTACK ****************************************
    if eyeSummonTime<eyeSummonWait and bSpecialReady=false
      //eyeSummonTime+=1
      eyeSummonTime+=gDeltaTime //60fps change: counts 30fps ticks
    if eyeSummonTime>=eyeSummonWait
    {
      if eyeSpawned<8 and currentAttack!=2 //summon eye
      {
        if currentAttack!=3
        {
          necroEye[eyeSpawned]=instance_create(x,y,oNecrobaneEye)
          necroEye[eyeSpawned].initDir=eyeSpawned*45
          eyeSpawned+=1
          eyeSummonTime=0
        }
      }
      else //eyes explode
      {
        if currentAttack!=1 and currentAttack!=3
        {
          //eyeSummonTime+=1
          eyeSummonTime+=gDeltaTime //60fps change: counts 30fps ticks
          currentAttack=2
          //if eyeSummonTime=eyeSummonWait+1
          if scrCountPass(eyeSummonTime,eyeSummonWait+1) //60fps change: once, when the count reaches it
            leftArmFrame=sNecrobaneArmL2
          //else if eyeSummonTime=eyeSummonWait+40
          else if scrCountPass(eyeSummonTime,eyeSummonWait+40) //60fps change: once, when the count reaches it
          {
            for(i=0;i<8;i+=1)
            {
              var eyeAtkDir;
              eyeAtkDir=0
              for(ii=0;ii<6;ii+=1)
              {
                eyeAttack=instance_create(necroEye[i].x,necroEye[i].y,oNecrobaneCurveball)
                eyeAttack.damageType="SPIRIT"; eyeAttack.spiritPower=spiritPower; eyeAttack.elementType=1
                eyeAttack.image_xscale=0.6; eyeAttack.image_yscale=0.6
                //eyeAttack.bulletSpeed=6; eyeAttack.direction=eyeAtkDir
                eyeAttack.bulletSpeed=6; eyeAttack._direction=eyeAtkDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                eyeAttack.curveAmount=1+(0.2*i)+(0.75*ii)+random(0.2)
                eyeAtkDir+=60
              }
              effect_create_above(ef_ring,necroEye[i].x,necroEye[i].y,0,c_black)
            }
            with oNecrobaneEye
              instance_destroy()
            eyeSpawned=0
          }
          else if eyeSummonTime>=eyeSummonWait+75
          {
            leftArmFrame=sNecrobaneArmL1
            currentAttack=0
            eyeSummonTime=0
          }
        }
      }
    }
    if eyeSpawned>0 and currentAttack!=2 //make eyes circle Necrobane
    {
      var eyeXadjust;
      eyeXadjust=-8
      if image_xscale=-1
        eyeXadjust*=-1
      for(i=0;i<eyeSpawned;i+=1)
      {
        necroEye[i].x=x+eyeXadjust+lengthdir_x(70,necroEye[i].initDir+dir)
        necroEye[i].y=y+16+lengthdir_y(70,necroEye[i].initDir+dir)
      }
      //dir+=1
      dir+=1*gDeltaTime //60fps change: per 30fps tick
    }
    //**************************************** SKY LASER ATTACK ****************************************
    if skyLaserTime<skyLaserWait and bSpecialReady=false
      //skyLaserTime+=1
      skyLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
    if skyLaserTime>=skyLaserWait and currentAttack!=1 and currentAttack!=2
    {
      if skyLaserTime>=skyLaserWait+10 and skyLaserTime<=skyLaserWait+60 {bShowLaserSpots=true}
      else {bShowLaserSpots=false}
      if skyLaserTime<=skyLaserWait+5 {skyLaserSpaceCheck=skyLaserSpacing}

      //skyLaserTime+=1
      skyLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
      currentAttack=3
      //if skyLaserTime=skyLaserWait+1
      if scrCountPass(skyLaserTime,skyLaserWait+1) //60fps change: once, when the count reaches it
      {
        rightArmFrame=sNecrobaneArmR2
        leftArmFrame=sNecrobaneArmL2
      }
      //else if skyLaserTime=skyLaserWait+10
      else if scrCountPass(skyLaserTime,skyLaserWait+10) //60fps change: once, when the count reaches it
      {
        laserStartX=(xCenter-roomSpan)+random_range(-16,16)
      }
      //else if skyLaserTime=skyLaserWait+50
      else if scrCountPass(skyLaserTime,skyLaserWait+50) //60fps change: once, when the count reaches it
        laserLineColor=c_white
      //else if skyLaserTime=skyLaserWait+60
      else if scrCountPass(skyLaserTime,skyLaserWait+60) //60fps change: once, when the count reaches it
      {
        playSound(global.snd_Shock,0,0.95)
        instance_create(0,0,oViewShaker)
        for(i=laserStartX;i<room_width;i+=skyLaserSpaceCheck)
        {
          skyLaserAtk=instance_create(i-2,0,oNecrobaneFire)
          skyLaserAtk.damageType="SPIRIT"; skyLaserAtk.spiritPower=spiritPower
          skyLaserAtk.elementType=3; skyLaserAtk.sprite_index=sDTorsoLightning
          skyLaserAtk.bulletSpeed=0; skyLaserAtk.decayTime=4; skyLaserAtk.size=2
          skyLaserAtk.image_xscale=0.5; skyLaserAtk.image_yscale=6; skyLaserAtk.image_angle=180
        }
      }
      else if skyLaserTime>=skyLaserWait+80
      {
        laserLineColor=c_black
        leftArmFrame=sNecrobaneArmL1
        rightArmFrame=sNecrobaneArmR1
        currentAttack=0
        skyLaserTime=0
      }
    }
    //**************************************** GROUND LASER ATTACK ****************************************
    if groundLaserTime<groundLaserWait and bSpecialReady=false
      //groundLaserTime+=1
      groundLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
    if groundLaserTime>=groundLaserWait and bSpecialReady=false
    {
      //groundLaserTime+=1
      groundLaserTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if groundLaserTime=groundLaserWait+1
      if scrCountPass(groundLaserTime,groundLaserWait+1) //60fps change: once, when the count reaches it
        sprite_index=sNecrobaneAnger
      //else if groundLaserTime=groundLaserWait+10
      else if scrCountPass(groundLaserTime,groundLaserWait+10) //60fps change: once, when the count reaches it
        bShowGroundLaser=true
      //else if groundLaserTime=groundLaserWait+40
      else if scrCountPass(groundLaserTime,groundLaserWait+40) //60fps change: once, when the count reaches it
        groundLaserLineColor=c_white
      //else if groundLaserTime=groundLaserWait+50
      else if scrCountPass(groundLaserTime,groundLaserWait+50) //60fps change: once, when the count reaches it
      {
        groundLaserAtk=instance_create(xCenter-roomSpan-16,yGround-12,oNecrobaneFire)
        groundLaserAtk.damageType="SPIRIT"; groundLaserAtk.spiritPower=spiritPower
        groundLaserAtk.elementType=3; groundLaserAtk.sprite_index=sDTorsoLightning
        groundLaserAtk.bulletSpeed=0; groundLaserAtk.decayTime=4; groundLaserAtk.size=2
        groundLaserAtk.image_xscale=1; groundLaserAtk.image_yscale=8; groundLaserAtk.image_angle=270
        bShowGroundLaser=false
      }
      else if groundLaserTime>=groundLaserWait+55
      {
        groundLaserLineColor=c_black
        sprite_index=sNecrobaneIdle
        groundLaserTime=0
      }
    }
    //**************************************** LASER STORM ATTACK ****************************************
    if specialAttack>=100 and specialAttack<1000
    {
      //specialAttack+=1
      specialAttack+=gDeltaTime //60fps change: counts 30fps ticks
      //torchOutTime+=50
      torchOutTime+=50*gDeltaTime //60fps change: per 30fps tick (the torches go out after the same ticks)
      //if specialAttack=160
      if scrCountPass(specialAttack,160) //60fps change: once, when the count reaches it
      {
        bShowSpecialLaser=true
        spcX=specialXstart+random_range(-16,16)
      }
      //else if specialAttack=200
      else if scrCountPass(specialAttack,200) //60fps change: once, when the count reaches it
        laserLineColor=c_white
      //else if specialAttack=210
      else if scrCountPass(specialAttack,210) //60fps change: once, when the count reaches it
      {
        playSound(global.snd_Shock,0,0.95)
        instance_create(0,0,oViewShaker)
        for(i=spcX;i<room_width;i+=specialXspacing)
        {
          specialLaserX=instance_create(i-2,0,oNecrobaneFire)
          specialLaserX.damageType="SPIRIT"; specialLaserX.spiritPower=spiritPower; specialLaserX.elementType=3
          specialLaserX.sprite_index=sDTorsoLightning; specialLaserX.bulletSpeed=0
          specialLaserX.decayTime=4; specialLaserX.size=2
          specialLaserX.image_xscale=0.5; specialLaserX.image_yscale=6; specialLaserX.image_angle=180
        }
        for(i=24;i<room_height;i+=specialYspacing)
        {
          specialLaserY=instance_create(544,i-2,oNecrobaneFire)
          specialLaserY.damageType="SPIRIT"; specialLaserY.spiritPower=spiritPower; specialLaserY.elementType=3
          specialLaserY.sprite_index=sDTorsoLightning; specialLaserY.bulletSpeed=0
          specialLaserY.decayTime=4; specialLaserY.size=2
          specialLaserY.image_xscale=0.5; specialLaserY.image_yscale=8; specialLaserY.image_angle=270
        }
        if specialXspacing>16
        {
          specialXspacing-=8
          specialYspacing-=12
          laserLineColor=c_black
          bShowSpecialLaser=false
          specialAttack=140
        }
        else
        {
          specialAttack=1000
          bShowSpecialLaser=false
          laserLineColor=c_black
          torchOutTime=0
          rightArmFrame=sNecrobaneArmR1
          leftArmFrame=sNecrobaneArmL1
          sprite_index=sNecrobaneIdle
          bSpecialReady=false
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      fireballWait-=global.difficulty*2
      skyLaserWait-=global.difficulty*2
      groundLaserWait-=5
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      fireballWait-=5
      if global.difficulty>=3
        fireballFreq-=2
      else
        fireballFreq-=1
      eyeSummonWait-=global.difficulty
      skyLaserWait-=global.difficulty*2
      if global.difficulty>=3
        skyLaserSpacing-=2
      else
        skyLaserSpacing-=1
      torchOutWait-=global.difficulty*10
      groundLaserWait-=5
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      fireballWait-=global.difficulty*2
      fireballFreq-=1
      eyeSummonWait-=2
      skyLaserWait-=4
      skyLaserSpacing-=global.difficulty
      groundLaserWait-=5
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      fireballWait-=5
      fireballFreq+=3
      eyeSummonWait-=2
      skyLaserWait-=global.difficulty*3
      bPinFireball=true
      torchOutWait-=global.difficulty*10
      groundLaserWait-=5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      fireballWait-=global.difficulty*3
      eyeSummonWait-=2
      skyLaserWait-=4
      skyLaserSpacing-=global.difficulty
      groundLaserWait-=global.difficulty*3
      specialAttack=1
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      if global.difficulty=4
        fireballFreq-=2
      else
        fireballFreq-=1
      eyeSummonWait-=global.difficulty
      skyLaserWait-=global.difficulty*3
      skyLaserSpacing-=global.difficulty
      torchOutWait-=global.difficulty*10
      groundLaserWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      fireballWait-=5
      fireballFreq-=1
      eyeSummonWait-=2
      skyLaserWait-=4
      skyLaserSpacing-=global.difficulty
      groundLaserWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      fireballWait-=5
      skyLaserWait-=4
      skyLaserSpacing-=global.difficulty
      torchOutWait-=global.difficulty*10
      groundLaserWait-=global.difficulty*3
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      fireballWait-=global.difficulty
      eyeSummonWait-=2
      skyLaserSpacing-=global.difficulty
      groundLaserWait-=global.difficulty*2
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
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if fireballTime<fireballWait
    fireballTime-=round((stunnedTime/2))
  if groundLaserTime<groundLaserWait
    groundLaserTime-=round((stunnedTime/2))
  if moveTime<moveDelay
    moveTime+=4
}
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and sprite_index=sNecrobaneAnger
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
//******************** laser spots ********************
if bShowLaserSpots=true
{
  draw_set_alpha(0.7)
  draw_set_color(laserLineColor)
  for(i=laserStartX;i<room_width;i+=skyLaserSpaceCheck)
  {
    draw_line_width(i,0,i,room_height,3)
  }
}
if bShowGroundLaser=true
{
  draw_set_alpha(0.7)
  draw_set_color(groundLaserLineColor)
  draw_line_width(0,yGround-12,room_width,yGround-12,6)
}
if bShowSpecialLaser=true
{
  draw_set_alpha(0.7)
  draw_set_color(laserLineColor)
  for(i=spcX;i<room_width;i+=specialXspacing)
  {
    draw_line_width(i,0,i,room_height,3)
  }
  for(i=24;i<room_height;i+=specialYspacing)
  {
    draw_line_width(specialXstart,i,room_width,i,3)
  }
}
//******************** boss animation ********************
//frameCount+=1
frameCount+=gDeltaTime //60fps change: counts 30fps ticks
//if frameCount mod 12=0
if scrModPass(frameCount,12) //60fps change: once each time the count reaches a multiple of it
{
  frameIndex+=1
  if frameIndex=1
    image_index=1
  else if frameIndex=2
    image_index=2
  else if frameIndex=3
    image_index=1
  else if frameIndex=4
  {
    image_index=0
    frameIndex=0
    frameCount=0
  }
}

if image_index=0
{
  armRX=13
  armRY=-12
  armLX=-17
  armLY=-11
}
else if image_index=1
{
  armRX=13
  armRY=-14
  armLX=-17
  armLY=-13
}
else if image_index=2
{
  armRX=13
  armRY=-13
  armLX=-17
  armLY=-12
}

if sprite_index=sNecrobaneAnger
{
  armRX=13
  armRY=-13
  armLX=-17
  armLY=-12
}

if image_xscale=-1
{
  armLX*=-1
  armRX*=-1
}
//******************** draw boss ********************
event_inherited()
//right arm
draw_sprite_ext(rightArmFrame,-1,x+armRX,y+armRY,image_xscale,1,0,image_blend,image_alpha)
//left arm
draw_sprite_ext(leftArmFrame,-1,x+armLX,y+armLY,image_xscale,1,0,image_blend,image_alpha)

//******************** dim lights ********************
lightAlpha=0
if leftTorch.bBurning=false
  lightAlpha+=0.1
if midTorch.bBurning=false
  lightAlpha+=0.1
if rightTorch.bBurning=false
  lightAlpha+=0.1
draw_set_color(c_black)
draw_set_alpha(lightAlpha)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
