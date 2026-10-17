#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.25
bodyAlpha=0.25

//Enemy base statistics
eName="Dark Gear"
maxLife=20000
life=maxLife
expWorth=85000
physicalPower=400
physicalDefense=150
spiritPower=450
spiritDefense=200
FIREresist=25
WATERresist=-50
WINDresist=-25
EARTHresist=50
bIsBoss=true
barAmount=2
questType=1
bCanDealDamage=false
activateBoss=0
if global.difficulty=1
{
  teleportWait=800
  crossSpiralWait=160
  crossSpiralAmt=10
  crossSpiralLength=240
  judgeLineWait=260
  judgeLineAmt=15
  judgeLineLength=190
  roseSparkWait=450
  roseSparkAmt=18
  roseSparkPeddles=7
}
else if global.difficulty=2
{
  teleportWait=750
  crossSpiralWait=150
  crossSpiralAmt=9
  crossSpiralLength=250
  judgeLineWait=250
  judgeLineAmt=14
  judgeLineLength=200
  roseSparkWait=400
  roseSparkAmt=15
  roseSparkPeddles=8
}
else if global.difficulty=3
{
  teleportWait=700
  crossSpiralWait=140
  crossSpiralAmt=8
  crossSpiralLength=260
  judgeLineWait=240
  judgeLineAmt=13
  judgeLineLength=210
  roseSparkWait=350
  roseSparkAmt=14
  roseSparkPeddles=9
}
else if global.difficulty=4
{
  teleportWait=650
  crossSpiralWait=130
  crossSpiralAmt=7
  crossSpiralLength=270
  judgeLineWait=230
  judgeLineAmt=12
  judgeLineLength=220
  roseSparkWait=300
  roseSparkAmt=13
  roseSparkPeddles=10
}
teleportTime=100
crossSpiralTime=crossSpiralWait-15
crossSpiralDelay=0
judgeLineTime=90
judgeLineDelay=0
roseSparkTime=roseSparkWait-5
roseSparkDelay=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Full Swing#>Upward Strike#>Full Swing#>Any Physical"

xCenter=1216
yGround=304
roomSpan=176
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
    combatText="It uses only danmaku-like attacks. I know you hate those, but try to endure this. You have many ways to deflect and dodge around them. The first one you see, Cross Spiral, does just what it's called. If you time it right, you can slip right through the gaps. Another attack should be easy to slip through on it's own. The gaps are quite large, but dodging it may become a problem when combined with the other attacks. Just focus and you can do it. Har har, get it? ... You suck if you didn't at least smile."
    sideText="The sprite used for this is from Makai Kingdom. The Darkness just likes using stuff that looks intimidating. It's also funny to watch you trying to dodge all that."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //movement **************************************************
    //teleportTime+=1
    teleportTime+=gDeltaTime //60fps change: counts 30fps ticks
    if teleportTime>=teleportWait
    {
      effect_create_above(ef_ring,x,y,1,c_black)
      if y=96
        y=224
      else
        y=96
      teleportTime=0
    }
    //attacks **************************************************
    //---------- Cross Spiral ----------
    //crossSpiralTime+=1
    crossSpiralTime+=gDeltaTime //60fps change: counts 30fps ticks
    if crossSpiralDelay=0
    {
      if crossSpiralTime>=crossSpiralWait
      {
        crossSpiralDelay=crossSpiralWait
        crossSpiralTime=crossSpiralWait
      }
    }
    if crossSpiralTime>=crossSpiralDelay and crossSpiralDelay!=0
    {
      //if crossSpiralTime=crossSpiralDelay+1
      if scrCountPass(crossSpiralTime,crossSpiralDelay+1) //60fps change: once, when the count reaches it
      {
        afterImage=instance_create(x,y,oEnemyAfterImage)
        afterImage.image_alpha=1
        afterImage.sprite_index=sprite_index
        afterImage.image_index=image_index
        afterImage.imageFade=0.1
        afterImage.xScalingSet=0.2
        afterImage.yScalingSet=0.2

        dgFlareL=instance_create(x,y,oMisc)
        dgFlareL.sprite_index=sColorRotoDisc
        dgFlareL.type=1
        dgFlareR=instance_create(x,y,oMisc)
        dgFlareR.sprite_index=sColorRotoDisc
        dgFlareR.type=1

        dgFlareDir=0
      }
      //else if crossSpiralTime>=crossSpiralDelay+1 and crossSpiralTime<=crossSpiralDelay+30
      else if crossSpiralTime>crossSpiralDelay+1 and crossSpiralTime<=crossSpiralDelay+30 //60fps change: the same 30fps ticks, counted in gDeltaTime steps (from after the one-shot above, which makes what this moves; at 30fps that took the +1 tick)
      {
        //dgFlareL.x-=7
        dgFlareL.x-=7*gDeltaTime //60fps change: per 30fps tick
        //dgFlareR.x+=7
        dgFlareR.x+=7*gDeltaTime //60fps change: per 30fps tick
      }
      //else if crossSpiralTime>=crossSpiralDelay+45 and crossSpiralTime mod crossSpiralAmt=0
      else if crossSpiralTime>=crossSpiralDelay+45 and scrModPass(crossSpiralTime,crossSpiralAmt) //60fps change: once each time the count reaches a multiple of it
      {
        //left
        newBullet=instance_create(dgFlareL.x,dgFlareL.y,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(255,190,190)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=7
        //newBullet.direction=dgFlareDir+90
        newBullet._direction=dgFlareDir+90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.image_angle=dgFlareDir+90
        newBullet=instance_create(dgFlareL.x,dgFlareL.y,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(255,190,190)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=7
        //newBullet.direction=dgFlareDir+270
        newBullet._direction=dgFlareDir+270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.image_angle=dgFlareDir+270
        //right
        newBullet=instance_create(dgFlareR.x,dgFlareR.y,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(190,190,255)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=7
        //newBullet.direction=dgFlareDir
        newBullet._direction=dgFlareDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.image_angle=dgFlareDir
        newBullet=instance_create(dgFlareR.x,dgFlareR.y,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(190,190,255)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=7
        //newBullet.direction=dgFlareDir+180
        newBullet._direction=dgFlareDir+180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.image_angle=dgFlareDir+180

        dgFlareDir+=5
      }

      if crossSpiralTime>=crossSpiralDelay+45+crossSpiralLength //end attack
      {
        with dgFlareL
          instance_destroy()
        with dgFlareR
          instance_destroy()
        crossSpiralTime=0
        crossSpiralDelay=0
      }
    }
    //---------- Judge Line ----------
    //judgeLineTime+=1
    judgeLineTime+=gDeltaTime //60fps change: counts 30fps ticks
    if judgeLineDelay=0
    {
      if judgeLineTime>=judgeLineWait
      {
        judgeLineDelay=judgeLineWait
        judgeLineTime=judgeLineWait
      }
    }
    if judgeLineTime>=judgeLineDelay and judgeLineDelay!=0
    {
      //if judgeLineTime=judgeLineDelay+1
      if scrCountPass(judgeLineTime,judgeLineDelay+1) //60fps change: once, when the count reaches it
      {
        dgJudgeL=instance_create(x,y,oMisc)
        dgJudgeL.sprite_index=sColorRotoDisc
        dgJudgeL.image_blend=c_green
        dgJudgeL.type=1
        dgJudgeR=instance_create(x,y,oMisc)
        dgJudgeR.sprite_index=sColorRotoDisc
        dgJudgeR.image_blend=c_green
        dgJudgeR.type=1
        if dgJudgeL.y>176
          judgeDir=1
        else
          judgeDir=0
      }
      //else if judgeLineTime>=judgeLineDelay+1 and judgeLineTime<=judgeLineDelay+30
      else if judgeLineTime>judgeLineDelay+1 and judgeLineTime<=judgeLineDelay+30 //60fps change: the same 30fps ticks, counted in gDeltaTime steps (from after the one-shot above, which makes what this moves; at 30fps that took the +1 tick)
      {
        //dgJudgeL.x-=7
        dgJudgeL.x-=7*gDeltaTime //60fps change: per 30fps tick
        //dgJudgeR.x+=7
        dgJudgeR.x+=7*gDeltaTime //60fps change: per 30fps tick
      }
      //else if judgeLineTime>=judgeLineDelay+45 and judgeLineTime mod judgeLineAmt=0
      else if judgeLineTime>=judgeLineDelay+45 and scrModPass(judgeLineTime,judgeLineAmt) //60fps change: once each time the count reaches a multiple of it
      {
        //left
        newBullet=instance_create(dgJudgeL.x,dgJudgeL.y,oMMeShot1)
        newBullet.sprite_index=sEbulletSmall
        newBullet.image_blend=make_color_rgb(190,255,190)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=5
        //newBullet.direction=0
        newBullet._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        //right
        newBullet=instance_create(dgJudgeR.x,dgJudgeR.y,oMMeShot1)
        newBullet.sprite_index=sEbulletSmall
        newBullet.image_blend=make_color_rgb(190,255,190)
        newBullet.physicalPower=physicalPower
        newBullet.bulletSpeed=5
        //newBullet.direction=180
        newBullet._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }

      //if judgeLineTime>=judgeLineDelay+45 //move energy balls
      if judgeLineTime>judgeLineDelay+44 //move energy balls //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        if judgeDir=0 //down
        {
          //dgJudgeL.y+=4
          dgJudgeL.y+=4*gDeltaTime //60fps change: per 30fps tick
          //dgJudgeR.y+=4
          dgJudgeR.y+=4*gDeltaTime //60fps change: per 30fps tick
          if dgJudgeL.y>=yGround
            judgeDir=1
        }
        else if judgeDir=1 //up
        {
          //dgJudgeL.y-=4
          dgJudgeL.y-=4*gDeltaTime //60fps change: per 30fps tick
          //dgJudgeR.y-=4
          dgJudgeR.y-=4*gDeltaTime //60fps change: per 30fps tick
          if dgJudgeL.y<=80
            judgeDir=0
        }
      }

      if judgeLineTime>=judgeLineDelay+45+judgeLineLength //end attack
      {
        with dgJudgeL
          instance_destroy()
        with dgJudgeR
          instance_destroy()
        judgeLineTime=0
        judgeLineDelay=0
      }
    }
    //---------- Rose Spark ----------
    if bossProgress>=2
      //roseSparkTime+=1
      roseSparkTime+=gDeltaTime //60fps change: counts 30fps ticks
    if roseSparkDelay=0
    {
      if roseSparkTime>=roseSparkWait
      {
        roseSparkDelay=roseSparkWait
        roseSparkTime=roseSparkWait
      }
    }
    if roseSparkTime>=roseSparkDelay and roseSparkDelay!=0
    {
      //if roseSparkTime=roseSparkDelay+1
      if scrCountPass(roseSparkTime,roseSparkDelay+1) //60fps change: once, when the count reaches it
      {
        dgRose=instance_create(x,y,oMisc)
        dgRose.sprite_index=sColorRotoDisc
        dgRose.depth=20
        dgRose.image_blend=c_red
        dgRose.image_xscale=1.25
        dgRose.image_yscale=1.25
        dgRose.type=1
      }
      //else if roseSparkTime=roseSparkDelay+45
      else if scrCountPass(roseSparkTime,roseSparkDelay+45) //60fps change: once, when the count reaches it
      {
        roseStart=instance_create(dgRose.x,dgRose.y,oMMeShot1)
        roseStart.sprite_index=sColorRotoDisc
        roseStart.image_blend=c_red
        roseStart.image_xscale=1.25
        roseStart.image_yscale=1.25
        roseStart.physicalPower=physicalPower
        roseStart.size=2
        roseStart.bulletSpeed=3.5
        //roseStart.direction=point_direction(dgRose.x,dgRose.y,oPlayer1.x,oPlayer1.y-26)
        roseStart._direction=point_direction(dgRose.x,dgRose.y,oPlayer1.x,oPlayer1.y-26) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        sparkNum=0
        sparkNumMax=0
        sparkBurst=0
        roseDir=0
        with dgRose
          instance_destroy()
      }
      //else if roseSparkTime>=roseSparkDelay+46 and roseSparkTime<10000 and roseSparkTime mod roseSparkAmt=0
      else if roseSparkTime>=roseSparkDelay+46 and roseSparkTime<10000 and scrModPass(roseSparkTime,roseSparkAmt) //60fps change: once each time the count reaches a multiple of it
      {
        if instance_exists(roseStart)
        {
          rosePetal[sparkNumMax,0]=instance_create(roseStart.x,roseStart.y,oMMeShot1)
          rosePetal[sparkNumMax,0].sprite_index=sEbulletSmall
          rosePetal[sparkNumMax,0].image_blend=make_color_rgb(255,190,255)
          rosePetal[sparkNumMax,0].physicalPower=physicalPower
          rosePetal[sparkNumMax,0].bulletSpeed=0
          roseDir=point_direction(roseStart.x,roseStart.y,oPlayer1.x,oPlayer1.y)
          for(i=1;i<roseSparkPeddles+1;i+=1)
          {
            rosePetal[sparkNumMax,i]=instance_create(roseStart.x,roseStart.y,oMMeShot1)
            rosePetal[sparkNumMax,i].x=roseStart.x+lengthdir_x(10,roseDir)
            rosePetal[sparkNumMax,i].y=roseStart.y+lengthdir_y(10,roseDir)
            rosePetal[sparkNumMax,i].sprite_index=sEbulletDiamond
            rosePetal[sparkNumMax,i].image_blend=make_color_rgb(255,255,190)
            rosePetal[sparkNumMax,i].physicalPower=physicalPower
            rosePetal[sparkNumMax,i].bulletSpeed=0
            //rosePetal[sparkNumMax,i].direction=roseDir
            rosePetal[sparkNumMax,i]._direction=roseDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            rosePetal[sparkNumMax,i].image_angle=roseDir
            roseDir+=360/roseSparkPeddles
          }
          sparkNumMax+=1
          if roseStart.x<xCenter-(roomSpan*1.5) or roseStart.x>xCenter+(roomSpan*1.5)
            with roseStart
              instance_destroy()
        }
        else
          roseSparkTime=10000
      }
      else if roseSparkTime>=10000
      {
        //sparkBurst+=1
        sparkBurst+=gDeltaTime //60fps change: counts 30fps ticks
        //if sparkBurst mod 10=0
        if scrModPass(sparkBurst,10) //60fps change: once each time the count reaches a multiple of it
        {
          if sparkNum<sparkNumMax
          {
            with rosePetal[sparkNum,0]
              instance_destroy()
            for(i=1;i<roseSparkPeddles+1;i+=1)
              rosePetal[sparkNum,i].bulletSpeed=8
            sparkNum+=1
          }
          else
          {
            roseSparkTime=0
            roseSparkDelay=0
          }
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=0
    {
      crossSpiralWait-=global.difficulty*5
      crossSpiralAmt-=1
      crossSpiralLength+=global.difficulty*5

      judgeLineWait-=global.difficulty*5
      judgeLineAmt-=1
      judgeLineLength+=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=1
    {
      crossSpiralWait-=global.difficulty*5
      if global.difficulty>1
        crossSpiralAmt-=1
      crossSpiralLength+=global.difficulty*5

      judgeLineWait-=global.difficulty*5
      judgeLineAmt-=1
      judgeLineLength+=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=2
    {
      crossSpiralWait-=global.difficulty*5
      crossSpiralAmt-=1
      crossSpiralLength+=global.difficulty*5

      judgeLineWait-=global.difficulty*5
      if global.difficulty=4
        judgeLineAmt-=2
      else
        judgeLineAmt-=1
      judgeLineLength+=global.difficulty*5
      roseSparkWait-=global.difficulty*15
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sShroudLBody,-1,x,y,1,1,0,c_white,bodyAlpha)
event_inherited()
