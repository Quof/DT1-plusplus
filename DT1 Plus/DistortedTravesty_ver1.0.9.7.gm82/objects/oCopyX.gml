#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-32,13,-1)
image_speed=0
//Enemy base statistics
eName="Copy X"
maxLife=17000
life=maxLife
expWorth=52000
physicalPower=300
physicalDefense=100
spiritPower=300
spiritDefense=150
bIsBoss=true
barAmount=2
questType=1
activateBoss=0
attackDelay=0
currentAction=0 //action set
currentAttack=0 //attack set
specialAttack=0
animChange=-1
inactiveDist=100000
hitSound=global.snd_MMeHit
reHitTime=5
tempVal=0
chargeFrame=0
if global.difficulty=1
{
  waitTime=64
  acidFreq=22
}
else if global.difficulty=2
{
  waitTime=54
  acidFreq=18
}
else if global.difficulty=3
{
  waitTime=48
  acidFreq=14
}
else if global.difficulty=4
{
  waitTime=40
  acidFreq=12
}
bAttacking=false
bChooseType=false
bChargedShot=false
sBurner=0
superCharge=0
jumpTime=0 //time before gravity takes full affect
dashTime=0 //time before dash slows down
attackTime=0 //time in attack animation
shieldTime=0 //time Crystal Hunter is up
doubleStrike=0 //do 2 attacks in 1 attack cycle when this gets to 3
difficultyAdjustments(global.difficulty)
setSAttack=spiritPower
setPDefense=physicalDefense
setSDefense=spiritDefense

col_XBuster=c_white
col_SpinningBlade=make_color_rgb(255,35,120)
col_AcidBurst=make_color_rgb(110,255,20)
col_TriadThunder=make_color_rgb(230,100,255)
col_SpeedBurner=make_color_rgb(255,0,0)
col_ShotgunIce=make_color_rgb(60,140,240)
col_FrostShield=make_color_rgb(70,190,255)
currentColor=col_XBuster
attackType=0

bossProgress=0
xCenter=464
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
  makeEnemyActive()
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    image_speed=0.6
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="Copy X will employ numerous techniques that the real X used. I can't describe them all, but I will list them: X Buster, Acid Burst, Triad Thunder, Shotgun Ice, Speed Burner, Frost Shield, and Spinning Blade. Some of these even have a secondary function, X Buster can be charged. With Speed Burner, he can engulf himself in fire. With The Darkness modifications, Copy X can perform multiple Danmaku-like attacks, which I'm sure it will use at specific times. I have also detected that it will use Crystal Hunter's secondary function to shield itself. It may not use this until it absolutely has to, but note that it can only use it while it is not mobile."
    sideText="X is the successor of the original Mega Man and is Dr. Light's greatest creation. He is the first robot to possess sophisticated technology and behavioral adaptation and is the precursor to each and every Reploid brought into production in the Mega Man X series. This thing here is merely a copy created by The Darkness. From what I'm analyzing, The Darkness has the ability to copy data and almost literally paste it with its own modifications. This may explain Meta Knight."
    activateBoss=2
  }

  if sprite_index=sMegamanXGather or sprite_index=sMegamanXRelease
  {
    physicalDefense=setPDefense*2
    spiritDefense=setSDefense*2
  }
  else
  {
    physicalDefense=setPDefense
    spiritDefense=setSDefense
  }
  if sprite_index=sCXspeedBurnerCharge
    setSAttack=spiritPower*1.2
  else
    setSAttack=spiritPower

  if bActive=true and dieFade=0
  {
    if animChange!=-1
      animChange+=1
    if sprite_index=sMegamanXIdle or sprite_index=sMegamanXJump
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    //========================= choose next action =========================
    attackDelay+=1
    if currentAction>=0 and currentAction<=9 //on ground
    {
      if attackDelay=round(waitTime/2)
        bChooseType=true
      if attackDelay>=waitTime
      {
        if specialAttack=1 or specialAttack=3 or specialAttack=5
        {
          specialAttack+=1
          currentAction=100
          attackDelay=0
        }
        else
        {
          nextAction=irandom(100)
          if point_distance(x,0,oPlayer1.x,0)>roomSpan*1.1
            nextAction-=15
          if oPlayer1.y<yGround-32
            nextAction+=15

          if nextAction>-20 and nextAction<19
            currentAction=10
          else if nextAction>20 and nextAction<50
            currentAction=20
          else if nextAction>51 and nextAction<81
            currentAction=30
          else if nextAction>82 and nextAction<120
            currentAction=40
        }
        tempVal=0
        //currentAction=30 //---------- FIXED ACTION FOR TESTING ----------
        if doubleStrike>=1
        {
          doubleStrike+=1
        }
        attackDelay=0
      }
    }
    //========================= actions =========================
    else if currentAction>=10 and currentAction<=19 //idle shot --------------------
    {
      if attackDelay=1 //attack
        bAttacking=true
      else if attackDelay>=10
      {
        currentAction=0
        attackDelay=0
      }
    }
    else if currentAction>=20 and currentAction<=29 //dash toward player --------------------
    {
      if attackDelay=1 //dash
      {
        dashTime=irandom_range(9,15)
        if x>oPlayer1.x
          xVel=-9
        else
          xVel=9
      }
      else if attackDelay>=7 and attackDelay<=9 //jump
      {
        if oPlayer1.y<yGround-32
        {
          if random(100)<80
          {
            y-=6
            yVel=-6
            jumpTime=3
          }
        }
      }
      else if attackDelay=16 //attack
        bAttacking=true
      else if attackDelay>=36
      {
        if doubleStrike>=3
        {
          bAttacking=true
          doubleStrike=1
        }
        currentAction=0
        attackDelay=0
      }
    }
    else if currentAction>=30 and currentAction<=39 //dash jump toward player --------------------
    {
      if attackDelay=1
      {
        dashTime=irandom_range(9,15)
        if x>oPlayer1.x
          xVel=-9
        else
          xVel=9
      }
      else if attackDelay=4
      {
        dashTime+=2
        y-=6
        yVel=-6
        jumpTime=3
      }
      else if attackDelay=12 //attack
      {
        if doubleStrike>=3
        {
          bAttacking=true
          doubleStrike=1
        }
        else
        {
          if oPlayer1.y<yGround-32
          {
            if random(100)<70
            {
              bAttacking=true
              tempVal=1
            }
          }
          else
          {
            if random(100)<30
            {
              bAttacking=true
              tempVal=1
            }
          }
        }
      }
      else if attackDelay=41 and tempVal=0 //attack
        bAttacking=true
      else if attackDelay>=46
      {
        currentAction=0
        attackDelay=0
      }
    }
    else if currentAction>=40 and currentAction<=49 //jump in place --------------------
    {
      if attackDelay=1
      {
        y-=6
        yVel=-6
        jumpTime=3
      }
      else if attackDelay=10 //attack
      {
        if doubleStrike>=3
        {
          bAttacking=true
          doubleStrike=1
        }
        else
        {
          if oPlayer1.y<yGround-32
          {
            if random(100)<70
            {
              bAttacking=true
              tempVal=1
            }
          }
          else
          {
            if random(100)<30
            {
              bAttacking=true
              tempVal=1
            }
          }
        }
      }
      else if attackDelay=36 and tempVal=0 //attack
        bAttacking=true
      else if attackDelay>=41
      {
        currentAction=0
        attackDelay=0
      }
    }
    else if currentAction>=100 and currentAction<=199 //special attack --------------------
    {
      if currentAction=100
      {
        if attackDelay=1
        {
          superCharge=1
          image_speed=0
          image_index=0
        }
        else if attackDelay=2
        {
          if specialAttack=2
            currentColor=col_AcidBurst
          else if specialAttack=4
            currentColor=col_SpinningBlade
          else if specialAttack=6
            currentColor=col_FrostShield
          baseColor=currentColor
          image_blend=baseColor
        }
        else if attackDelay=9
          image_index=1
        else if attackDelay=17
          image_index=2
        else if attackDelay=25
        {
          superCharge=2
          image_speed=1
        }
        else if attackDelay>=26
        {
          if x>xCenter
            x-=2
          else if x<xCenter
            x+=2

          if y>yGround-112
            y-=2
          else if y<yGround-112
            y+=2

          if point_distance(x,y,xCenter,yGround-112)<3
          {
            currentAction=110
            attackDelay=0
          }
        }
      }
      else if currentAction=110
      {
        if specialAttack=2
        {
          if attackDelay mod acidFreq=0 and attackDelay<210
          {
            xAcidBurst=instance_create(x,y-17,oCXacidBurst)
            xAcidBurst.physicalPower=physicalPower
            xAcidBurst.yVel=-random(2)-3
            xAcidBurst.type=0
            xAcidBurst.xVel=random_range(-5,5)
          }
          else if attackDelay>=240
          {
            superCharge=0
            jumpTime=0
            image_speed=0.6
            currentAction=0
            attackDelay=0
          }
        }
        else if specialAttack=4
        {
          if attackDelay=1
            tempVar=0
          else if attackDelay mod 5=0 and attackDelay<121
          {
            xSpinBlade=instance_create(x,y-17,oCXspinningBlade)
            xSpinBlade.spiritPower=spiritPower
            xSpinBlade.throwSpeed=7.5
            xSpinBlade.returnID=id
            xSpinBlade.xAdjust=0
            xSpinBlade.yAdjust=-17
            xSpinBlade.direction=tempVar
            tempVar+=15
          }
          else if attackDelay>=140
          {
            superCharge=0
            jumpTime=0
            image_speed=0.6
            currentAction=0
            attackDelay=0
          }
        }
        else if specialAttack=6
        {
          if attackDelay=1
            tempVar=0
          else if attackDelay=5
          {
            var dirSet;
            dirSet=0
            for(i=0;i<4;i+=1)
            {
              xFrostShield=instance_create(x,y-17,oCXfrostShield)
              xFrostShield.spiritPower=spiritPower
              xFrostShield.breakTime=35
              xFrostShield.spd=3
              xFrostShield.direction=dirSet
              dirSet+=90
            }
          }
          else if attackDelay=40
          {
            var dirSet;
            dirSet=45
            for(i=0;i<4;i+=1)
            {
              xFrostShield=instance_create(x,y-17,oCXfrostShield)
              xFrostShield.spiritPower=spiritPower
              xFrostShield.breakTime=35
              xFrostShield.spd=3
              xFrostShield.direction=dirSet
              dirSet+=90
            }
          }
          else if attackDelay>=80 and attackDelay<=141
          {
            if attackDelay mod 5=0
            {
              xFrostShield=instance_create(x,y-17,oCXfrostShield)
              xFrostShield.spiritPower=spiritPower
              xFrostShield.breakTime=35
              xFrostShield.spd=3
              xFrostShield.direction=tempVar
              tempVar+=30
            }
          }
          else if attackDelay>=170
          {
            superCharge=0
            jumpTime=0
            image_speed=0.6
            currentAction=0
            attackDelay=0
          }
        }
      }
    }
    //========================= attacks =========================
    if bAttacking=true
    {
      attackTime=15
      var yShotAdjust;
      if xVel=0
        yShotAdjust=18
      else
        yShotAdjust=15

      if currentColor=col_XBuster
      {
        xBuster=instance_create(x,y-yShotAdjust,oMMeShot1)
        if bChargedShot=true
        {
          xBuster.sprite_index=sTechWoA_N
          xBuster.physicalPower=round(physicalPower*1.1)
        }
        else
        {
          xBuster.sprite_index=sBusterShot
          xBuster.physicalPower=physicalPower
        }
        xBuster.bulletSpeed=10
        if image_xscale=1
        {
          xBuster.direction=0
          xBuster.x+=20
        }
        else
        {
          xBuster.direction=180
          xBuster.image_xscale=-1
          xBuster-=20
        }
      }
      else if currentColor=col_SpinningBlade
      {
        xSpinBlade=instance_create(x,y-yShotAdjust,oCXspinningBlade)
        xSpinBlade.spiritPower=spiritPower
        xSpinBlade.throwSpeed=7.5
        xSpinBlade.returnID=id
        xSpinBlade.xAdjust=0
        xSpinBlade.yAdjust=-17
        xSpinBlade.direction=point_direction(x,y,oPlayer1.x,oPlayer1.y-24)
        if image_xscale=1
          xSpinBlade.x+=20
        else
          xSpinBlade-=20
      }
      else if currentColor=col_AcidBurst
      {
        xAcidBurst=instance_create(x,y-yShotAdjust,oCXacidBurst)
        xAcidBurst.physicalPower=physicalPower
        xAcidBurst.yVel=-random(2)-3
        xAcidBurst.type=0
        if image_xscale=1
        {
          xAcidBurst.xVel=random(2)+3
          xAcidBurst.x+=20
        }
        else
        {
          xAcidBurst.xVel=-random(2)-3
          xAcidBurst-=20
        }
      }
      else if currentColor=col_TriadThunder
      {
        xTriadThunder=instance_create(x,y-yShotAdjust,oMMeShot1)
        xTriadThunder.damageType="SPIRIT"
        xTriadThunder.spiritPower=spiritPower
        xTriadThunder.elementType=3
        xTriadThunder.sprite_index=sCXtriadThunder
        xTriadThunder.image_speed=0.8
        xTriadThunder.bulletSpeed=3
        if image_xscale=1
        {
          xTriadThunder.direction=0
          xTriadThunder.x+=20
        }
        else
        {
          xTriadThunder.direction=180
          xTriadThunder-=20
        }
      }
      else if currentColor=col_SpeedBurner
      {
        if bChargedShot=true
          sBurner=1
        else
        {
          xSpeedBurner=instance_create(x,y-yShotAdjust,oMMeShot1)
          xSpeedBurner.damageType="SPIRIT"
          xSpeedBurner.spiritPower=spiritPower
          xSpeedBurner.elementType=1
          xSpeedBurner.sprite_index=sCXspeedBurner
          xSpeedBurner.image_speed=0.66
          xSpeedBurner.bulletSpeed=7.5
          if image_xscale=1
          {
            xSpeedBurner.direction=0
            xSpeedBurner.x+=20
          }
          else
          {
            xSpeedBurner.direction=180
            xSpeedBurner.image_xscale=-1
            xSpeedBurner-=20
          }
        }
      }
      else if currentColor=col_ShotgunIce
      {
        xShotIce=instance_create(x,y-yShotAdjust,oCXshotgunIceA)
        xShotIce.spiritPower=spiritPower
        if image_xscale=1
        {
          xShotIce.xVel=8
          xShotIce.x+=20
        }
        else
        {
          xShotIce.xVel=-8
          xShotIce-=20
        }
      }
      else if currentColor=col_FrostShield
      {
        xFrostShield=instance_create(x,y-yShotAdjust,oCXfrostShield)
        xFrostShield.spiritPower=spiritPower
        xFrostShield.spd=3
        xFrostShield.direction=90
        xFrostShield.breakTime=50
        if image_xscale=1
          xFrostShield.x+=20
        else
          xFrostShield-=20
      }
      bChargedShot=false
      bAttacking=false
    }

    if sBurner>=1 //speed burner
    {
      currentAction=0
      attackDelay=0
      if sBurner=1
      {
        dashTime=0
        jumpTime=0
        yVel=0
        damageType="SPIRIT"
        elementType=1
        if x>oPlayer1.x
          xVel=-13
        else
          xVel=13
        y-=16
        currentColor=col_XBuster
        baseColor=currentColor
        image_blend=baseColor
        sBurner=2
      }

      if xVel>0 //right
      {
        if x>xCenter+roomSpan-18
          sBurner=3
      }
      else if xVel<0 //left
      {
        if x<xCenter-roomSpan+18
          sBurner=3
      }

      if sBurner=3
      {
        y+=16
        damageType="PHYSICAL"
        elementType=0
        sBurner=0
        xVel=0
      }
    }

    if bChooseType=true //choose a new attack type
    {
      var newAtk;
      newAtk=irandom_range(1,7)
      if newAtk=1
        currentColor=col_XBuster
      else if newAtk=2
        currentColor=col_SpinningBlade
      else if newAtk=3
        currentColor=col_AcidBurst
      else if newAtk=4
        currentColor=col_TriadThunder
      else if newAtk=5
        currentColor=col_SpeedBurner
      else if newAtk=6
        currentColor=col_ShotgunIce
      else if newAtk=7
        currentColor=col_FrostShield
      baseColor=currentColor
      image_blend=baseColor
      bChooseType=false

      if currentColor=col_XBuster
      {
        if random(100)<40
          bChargedShot=true
      }
      else if currentColor=col_SpeedBurner
      {
        if point_distance(x,0,oPlayer1.x,0)>roomSpan
          if random(100)<75
            bChargedShot=true
      }
    }

    //animation check
    if superCharge=0
    {
      if attackTime>0 //attacking
      {
        if yVel=0 and y>yGround-3 //on ground
        {
          if xVel=0 //not moving
            sprite_index=sMegamanXAim
          else //moving
            sprite_index=sMegamanXDashAim
        }
        else //in air
          sprite_index=sMegamanXJumpAim
        attackTime-=1
      }
      else //not attacking
      {
        if yVel=0 and y>yGround-3 //on ground
        {
          if xVel=0 //not moving
            sprite_index=sMegamanXIdle
          else //moving
            sprite_index=sMegamanXDash
        }
        else //in air
          sprite_index=sMegamanXJump
      }
      if sBurner>=1
        sprite_index=sCXspeedBurnerCharge
    }
    else if superCharge=1
      sprite_index=sMegamanXGather
    else if superCharge=2
      sprite_index=sMegamanXRelease

    if dashTime<=0 and sBurner=0//stop momentum
    {
      if yVel=0 //on ground
      {
        if xVel>0
          xVel-=0.75
        else if xVel<0
          xVel+=0.75
      }
      else //in air - slow him down
      {
        if xVel>0
          xVel-=0.5
        else if xVel<0
          xVel+=0.5
      }

      if xVel>0 and xVel<1
        xVel=0
      else if xVel<0 and xVel>-1
        xVel=0
    }
    else
      dashTime-=1

    //scripted attacks
    if superCharge=0
    {
      if lifePercent<=0.75 and specialAttack=0
        specialAttack=1
      else if lifePercent<=0.5 and specialAttack=2
        specialAttack=3
      else if lifePercent<=0.25 and specialAttack=4
        specialAttack=5
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
    {
      waitTime-=2
      bossProgress+=1
    }
    else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
    {
      waitTime-=2
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
    {
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
    {
      doubleStrike=1
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
    {
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
    {
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
    {
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
    {
      waitTime-=global.difficulty
      bossProgress+=1
    }
    else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
    {
      waitTime-=1
      bossProgress+=1
    }
  }
  if jumpTime<=0 and superCharge=0 and sBurner=0
    yVel+=0.4
  else
    jumpTime-=1
  if isCollisionBottom(1)
    yVel=0
  if isCollisionLeft(1)
  {
    xVel*=-1
    image_xscale*=-1
  }
  if isCollisionRight(1)
  {
    xVel*=-1
    image_xscale*=-1
  }
  moveTo(xVel,yVel)
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lifePercent>=0.15
  event_inherited()
else
{
  if sprite_index=sMegamanXIdle
  {
    bCanTakeDamage=false
    shieldTime=7
  }
  else
    event_inherited()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if life>0
{
  attackIconX=view_xview[0]+5
  attackIconY=view_yview[0]+348
  if superCharge=0
  {
    if currentColor=c_white
      draw_sprite(sCopyXattackIcons,0,attackIconX,attackIconY)
    else if currentColor=col_SpinningBlade
      draw_sprite(sCopyXattackIcons,1,attackIconX,attackIconY)
    else if currentColor=col_AcidBurst
      draw_sprite(sCopyXattackIcons,2,attackIconX,attackIconY)
    else if currentColor=col_TriadThunder
      draw_sprite(sCopyXattackIcons,3,attackIconX,attackIconY)
    else if currentColor=col_SpeedBurner
      draw_sprite(sCopyXattackIcons,4,attackIconX,attackIconY)
    else if currentColor=col_ShotgunIce
      draw_sprite(sCopyXattackIcons,5,attackIconX,attackIconY)
    else if currentColor=col_FrostShield
      draw_sprite(sCopyXattackIcons,6,attackIconX,attackIconY)
  }
  else
    draw_sprite(sCopyXattackIcons,7,attackIconX,attackIconY)

  //charging
  if bChargedShot=true
  {
    draw_sprite(sMMcharging,chargeFrame,x,y-17)
    chargeFrame+=1
    if chargeFrame>=11
      chargeFrame=0
  }

  //shield
  if shieldTime>0
  {
    draw_sprite(sCXcrystalHunter,round(shieldTime/2),x,y-17)
    shieldTime-=1
    if shieldTime=0
      bCanTakeDamage=true
  }
}
