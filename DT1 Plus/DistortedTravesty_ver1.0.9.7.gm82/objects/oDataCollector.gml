#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_alpha=0
colRed=make_color_rgb(255,110,110)
colBlue=make_color_rgb(120,120,255)
colGreen=make_color_rgb(120,255,120)
colBrown=make_color_rgb(255,160,110)
currentColor=0

//Enemy base statistics
eName="Data Collector"
maxLife=45000
life=maxLife
expWorth=200000
physicalPower=450
physicalDefense=160
spiritPower=430
spiritDefense=210
bIsBoss=true
skillResist=5
barAmount=3
questType=1
bCanDealDamage=false
activateBoss=0
specialAttack=0
colorChangeDelay=600
colorChangeTime=colorChangeDelay
if global.difficulty=1
{
  spiralHellWait=270
  spiralHellAmt=6
  lightningCrushWait=230
}
else if global.difficulty=2
{
  spiralHellWait=250
  spiralHellAmt=8
  lightningCrushWait=220
}
else if global.difficulty=3
{
  spiralHellWait=240
  spiralHellAmt=12
  lightningCrushWait=210
}
else if global.difficulty=4
{
  spiralHellWait=230
  spiralHellAmt=14
  lightningCrushWait=200
}
spiralHellTime=30
lightningCrushTime=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Full Swing#>Upward Strike#>Full Swing#>Any Physical"
setPDefense=physicalDefense
setSDefense=spiritDefense

fireCreate=0
xCenter=480
yGround=320
roomSpan=192
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
    image_alpha=0.7
    combatText="The attacks should all be familiar to you. The lightning attack is taken straight from Arrghus and its bullet pattern is pretty much what the Fourth Wall Crusher had with a few timing changes. Its weakness changes.#Hint: It is the same as the enemy types here. This weakness is massive, exploit it."
    sideText="And its yet, another filler boss. Why do all these filler bosses fight the same way? Anyway, this is scary looking, and in case you didn't know, its from Phantasy Star. I don't know what else to say about this. I have a feeling that The Darkness knows you don't like bullet hells though."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //---------- Normal Attack: Spiral Hell ----------
    if specialAttack!=2 and specialAttack!=5
      //spiralHellTime+=1
      spiralHellTime+=gDeltaTime //60fps change: counts 30fps ticks

    //if spiralHellTime=spiralHellWait
    if scrCountPass(spiralHellTime,spiralHellWait) //60fps change: once, when the count reaches it
    {
      afterImage=instance_create(x,y,oEnemyAfterImage)
      afterImage.image_alpha=0.8
      afterImage.sprite_index=sprite_index
      afterImage.image_index=image_index
      afterImage.imageFade=0.05
      afterImage.xScalingSet=0.075
      afterImage.yScalingSet=0.075
    }
    if spiralHellTime>=spiralHellWait+20 //point_direction(x,y,oPlayer1.x,oPlayer1.y-26)-125 , 98
    {
      //shotDir=random(360)
      bulArcTime=72
      shotDir=55
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=145
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=235
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=325
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }

      shotDir=100
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=190
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=280
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      shotDir=370
      for(i=0;i<spiralHellAmt;i+=1)
      {
        newBullet=instance_create(x,y,oMMeShotArc)
        newBullet.x=x+lengthdir_x(8,shotDir)
        newBullet.y=y+lengthdir_y(8,shotDir)
        newBullet.damageType="SPIRIT"
        newBullet.spiritPower=spiritPower
        newBullet.bDestroyOnOutside=0
        newBullet.bulletSpeed=5
        //newBullet.direction=shotDir
        newBullet._direction=shotDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.arcTime=bulArcTime-(i*3)
        newBullet.bulletArc=5
        shotDir+=360/spiralHellAmt
      }
      spiralHellTime=0
    }
    //---------- Normal Attack: Lightning Crush ----------
    //lightningCrushTime+=1
    lightningCrushTime+=gDeltaTime //60fps change: counts 30fps ticks
    if lightningCrushTime>=lightningCrushWait
    {
      for(i=0;i<3;i+=1)
      {
        if i=0
          newLightning=instance_create(oPlayer1.x,yGround,oArrghusLightning)
        else if i=1
          newLightning=instance_create(oPlayer1.x+64,yGround,oArrghusLightning)
        else if i=2
          newLightning=instance_create(oPlayer1.x-64,yGround,oArrghusLightning)
        newLightning.spiritPower=spiritPower
        if i=0
          newLightning.bShake=1
        else
          newLightning.bShake=0
        newLightning.bMakeFire=1
      }
      lightningCrushTime=0
    }

    //colorChangeTime+=1
    colorChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if colorChangeTime>=colorChangeDelay
    {
      currentColor+=1
      if currentColor=5
        currentColor=1

      if currentColor=1
      {
        FIREresist=100
        WATERresist=-100
        WINDresist=100
        EARTHresist=100
        baseColor=colRed
        image_blend=baseColor
      }
      else if currentColor=2
      {
        FIREresist=100
        WATERresist=100
        WINDresist=-100
        EARTHresist=100
        baseColor=colBlue
        image_blend=baseColor
      }
      else if currentColor=3
      {
        FIREresist=100
        WATERresist=100
        WINDresist=100
        EARTHresist=-100
        baseColor=colGreen
        image_blend=baseColor
      }
      else if currentColor=4
      {
        FIREresist=-100
        WATERresist=100
        WINDresist=100
        EARTHresist=100
        baseColor=colBrown
        image_blend=baseColor
      }
      colorChangeTime=0
    }

    //fire start
    if instance_exists(fireCreate)
    {
      //fireCreate.image_angle+=15
      fireCreate.image_angle+=15*gDeltaTime //60fps change: per 30fps tick
      //fireCreate.y+=7
      fireCreate.y+=7*gDeltaTime //60fps change: per 30fps tick
      if fireCreate.y>=yGround
      {
        var xPos;
        xPos=296
        for(i=0;i<24;i+=1)
        {
          firePit=instance_create(xPos+(i*16),yGround,oMarioLava)
          firePit.sprite_index=sFlameUp
        }
        with fireCreate
          instance_destroy()
      }
    }
    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      fireCreate=instance_create(xCenter,0,oMisc)
      fireCreate.type=1
      fireCreate.sprite_index=sALfireball
      fireCreate.image_xscale=2
      fireCreate.image_yscale=2
      fireCreate.image_alpha=0.6
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      spiralHellWait-=global.difficulty*2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      spiralHellWait-=global.difficulty*3
      spiralHellAmt*=2
      lightningCrushWait-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      spiralHellWait-=global.difficulty*3
      lightningCrushWait-=global.difficulty*2
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      spiralHellWait-=global.difficulty*3
      lightningCrushWait-=global.difficulty*2
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
