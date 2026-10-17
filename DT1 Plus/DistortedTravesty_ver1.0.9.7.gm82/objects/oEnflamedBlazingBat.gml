#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
image_speed=0.33
armFrame=sEBBatArmDown
swordAngle=0
handFlameX=0
handFlameY=0

//Enemy base statistics
eName="Enflamed Blazing Bat"
maxLife=12000
life=maxLife
expWorth=80000
physicalPower=340
physicalDefense=120
spiritPower=350
spiritDefense=150
FIREresist=100
WATERresist=-100
WINDresist=-50
EARTHresist=50
damageType="SPIRIT"
elementType=1
bIsBoss=true
barAmount=1
questType=1
activateBoss=0
specialAttack=0
batForm=0
if global.difficulty=1
{
  fireballWait=190
  fireballAmount=1
  fireSpinSpd=4
  riseFireAmount=8
  handFlameWait=180
  swordReleaseWait=70
  swordFire=0
}
else if global.difficulty=2
{
  fireballWait=150
  fireballAmount=1
  fireSpinSpd=4
  riseFireAmount=10
  handFlameWait=160
  swordReleaseWait=60
  swordFire=0
}
else if global.difficulty=3
{
  fireballWait=130
  fireballAmount=3
  fireSpinSpd=4
  riseFireAmount=12
  handFlameWait=150
  swordReleaseWait=50
  swordFire=1
}
else if global.difficulty=4
{
  fireballWait=110
  fireballAmount=5
  fireSpinSpd=5
  riseFireAmount=15
  handFlameWait=135
  swordReleaseWait=40
  swordFire=1
}
fireballTime=70
underLavaWait=90
underLavaTime=75
handFlameTime=0
swordReleaseTime=0
bSwordOut=false

bossProgress=0
flyDir=0 //form 2, 0: In lava, 1: Out of lava
difficultyAdjustments(global.difficulty)

xCenter=448
yGround=352
roomSpan=256

flameTempWait=0
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
    combatText="This fire bat is very strange. It's attacks are relatively easy to see coming, it doesn't have much durability. I just don't get it. I feel as though it should be a lot stronger than this. Seriously, just watch for the fireballs it sends at you."
    sideText="This bat, believe it or not is from a Mickey Mouse game. I have an odd feeling it is not working with The Darkness and also have the feeling it is hiding something."
    activateBoss=2
  }

  if bActive=true and dieFade=0
  {
    if batForm=0 //********** Normal Bat Form **********
    {
      //***** Movement *****
      if specialAttack=0
      {
        if flyDir=0 //left
        {
          //x-=1
          x-=1*gDeltaTime //60fps change: per 30fps tick
          if x<xCenter-roomSpan
          {
            image_xscale=1
            flyDir=1
          }
        }
        else if flyDir=1 //right
        {
          //x+=1
          x+=1*gDeltaTime //60fps change: per 30fps tick
          if x>xCenter+roomSpan
          {
            image_xscale=-1
            flyDir=0
          }
        }
      }
      else if specialAttack>=1
      {
        //specialAttack+=1
        specialAttack+=gDeltaTime //60fps change: counts 30fps ticks (in the special attack it's a timer)
        if specialAttack>=1 and specialAttack<=19
        {
          //if specialAttack=2
          if scrCountPass(specialAttack,2) //60fps change: once, when the count reaches it
            fireballTime=fireballWait-40
          if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
            effect_create_above(ef_smokeup,x,y,1,c_red)
          if specialAttack>=15
          {
            effect_create_above(ef_ring,x,y,1,c_red)
            visible=false
            bCanTakeDamage=false
            specialAttack=20
          }
        }
        else if specialAttack>=20 and specialAttack<=29
        {
          //if specialAttack=21
          if scrCountPass(specialAttack,21) //60fps change: once, when the count reaches it
          {
            x=448
            y=160
            effect_create_above(ef_ring,x,y,1,c_red)
            visible=true
            bCanTakeDamage=true
          }
          else if specialAttack>=29
          {
            specialFireDir=80
            specialAttack=49
          }
        }
        //else if specialAttack=50
        else if scrCountPass(specialAttack,50) //60fps change: once, when the count reaches it
        {
          playSound(global.snd_SpellFireball,0,0.95)
          for(i=0;i<6;i+=1)
          {
            fireWaveR[i]=instance_create(x,y,oCannonBullet)
            fireWaveR[i].sprite_index=sKreFire
            fireWaveR[i].spiritPower=spiritPower
            fireWaveR[i].damageType="SPIRIT"
            fireWaveR[i].elementType=1
            fireWaveR[i].bulletSpeed=0
            fireWaveR[i].size=2
            //fireWaveR[i].direction=0
            fireWaveR[i]._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            fireWaveR[i].image_speed=0.4+random(0.1)

            fireWaveL[i]=instance_create(x,y,oCannonBullet)
            fireWaveL[i].sprite_index=sKreFire
            fireWaveL[i].spiritPower=spiritPower
            fireWaveL[i].damageType="SPIRIT"
            fireWaveL[i].elementType=1
            fireWaveL[i].bulletSpeed=0
            fireWaveL[i].size=2
            //fireWaveL[i].direction=180
            fireWaveL[i]._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            fireWaveL[i].image_speed=0.4+random(0.1)
          }
        }
        //else if specialAttack>=51 and specialAttack<=90
        else if specialAttack>50 and specialAttack<=90 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
        {
          for(i=0;i<6;i+=1)
          {
            //fireWaveR[i].x+=i+1
            //fireWaveL[i].x-=i+1
            fireWaveR[i].x+=(i+1)*gDeltaTime //60fps change: per 30fps tick
            fireWaveL[i].x-=(i+1)*gDeltaTime //60fps change: per 30fps tick
          }
        }
        //else if specialAttack=91
        else if scrCountPass(specialAttack,91) //60fps change: once, when the count reaches it
        {
          playSound(global.snd_SpellFireball,0,0.95)
          for(i=0;i<6;i+=1)
          {
            fireWaveR[i].bulletSpeed=10
            //fireWaveR[i].direction=90
            fireWaveR[i]._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            fireWaveL[i].bulletSpeed=10
            //fireWaveL[i].direction=90
            fireWaveL[i]._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
        }
        //else if specialAttack>=111 and specialAttack<=420
        else if specialAttack>=111 and specialAttack<=420 and scrModPass(specialAttack,1) //60fps change: the spray once per 30fps tick (each time the count reaches a whole number; every tick at 30fps)
        {
          var dir;
          dir=0
          for(i=0;i<2;i+=1)
          {
            newAttack=instance_create(x,y,oCannonBullet)
            newAttack.sprite_index=sKreFire
            newAttack.x=x+lengthdir_x(16,specialFireDir+dir)
            newAttack.y=y+lengthdir_y(16,specialFireDir+dir)
            newAttack.spiritPower=spiritPower
            newAttack.damageType="SPIRIT"
            newAttack.elementType=1
            newAttack.bulletSpeed=8
            //newAttack.direction=specialFireDir+dir
            newAttack._direction=specialFireDir+dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.image_angle=specialFireDir+dir
            newAttack.image_speed=0.4+random(0.1)
            dir=180
          }
          if specialFireDir mod 20=0
          {
            playSound(global.snd_SpellFireball,0,0.95)
            newAttack=instance_create((xCenter-roomSpan)+random(roomSpan*2),-8,oCannonBullet)
            newAttack.sprite_index=sKreFire
            newAttack.spiritPower=spiritPower
            newAttack.damageType="SPIRIT"
            newAttack.elementType=1
            newAttack.bulletSpeed=7
            //newAttack.direction=270
            newAttack._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.image_angle=270
            newAttack.image_speed=0.4+random(0.1)
          }
          specialFireDir+=fireSpinSpd
        }
        //else if specialAttack=421
        else if scrCountPass(specialAttack,421) //60fps change: once, when the count reaches it
        {
          effect_create_above(ef_ring,x,y,1,c_red)
          x=448
          y=240
          effect_create_above(ef_ring,x,y,1,c_red)
          bCanTakeDamage=true
          specialAttack=0
          bossProgress+=1
        }

        //if specialAttack=210
        if scrCountPass(specialAttack,210) //60fps change: once, when the count reaches it
        {
          for(i=0;i<5;i+=1)
          {
            newAttack=instance_create(520+(i*24),-8,oCannonBullet)
            newAttack.sprite_index=sKreFire
            newAttack.spiritPower=spiritPower
            newAttack.damageType="SPIRIT"
            newAttack.elementType=1
            newAttack.bulletSpeed=3
            //newAttack.direction=270
            newAttack._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.image_angle=270
            newAttack.image_speed=0.4+random(0.1)
          }
        }
        //else if specialAttack=305
        else if scrCountPass(specialAttack,305) //60fps change: once, when the count reaches it
        {
          for(i=0;i<5;i+=1)
          {
            newAttack=instance_create(280+(i*24),-8,oCannonBullet)
            newAttack.sprite_index=sKreFire
            newAttack.spiritPower=spiritPower
            newAttack.damageType="SPIRIT"
            newAttack.elementType=1
            newAttack.bulletSpeed=3
            //newAttack.direction=270
            newAttack._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.image_angle=270
            newAttack.image_speed=0.4+random(0.1)
          }
        }
      }
      //***** Fireball *****
      if specialAttack=0
      {
        //fireballTime+=1
        fireballTime+=gDeltaTime //60fps change: counts 30fps ticks
        //if fireballTime=fireballWait-30
        if scrCountPass(fireballTime,fireballWait-30) //60fps change: once, when the count reaches it
          effect_create_above(ef_smokeup,x,y,1,c_red)
        else if fireballTime>=fireballWait //fireball
        {
          var dir;
          dir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
          if fireballAmount=3
            dir-=25
          else if fireballAmount=5
            dir-=50
          for(i=0;i<fireballAmount;i+=1)
          {
            newAttack=instance_create(x,y,oCannonBullet)
            newAttack.sprite_index=sKreFire
            newAttack.spiritPower=spiritPower
            newAttack.damageType="SPIRIT"
            newAttack.elementType=1
            newAttack.bulletSpeed=6
            //newAttack.direction=dir
            newAttack._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            newAttack.image_angle=direction
            newAttack.image_speed=0.5
            dir+=25
          }
          fireballTime=0
        }
      }
    }
    else if batForm=1 //********** Transition **********
    {
      //specialAttack+=1
      specialAttack+=gDeltaTime //60fps change: counts 30fps ticks
      //if specialAttack=5
      if scrCountPass(specialAttack,5) //60fps change: once, when the count reaches it
      {
        msgCreate("Ugh, you got past my fire spam.#Looks like I'll need to try THAT!",0,oMessagePerson,"Blazing The Bat",0,1)
        newMessage.fadingTime=105
      }
      //else if specialAttack=95
      else if scrCountPass(specialAttack,95) //60fps change: once, when the count reaches it
      {
        msgCreate("Should be fun.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=90
      }

      if bossProgress=0 and specialAttack>=30
      {
        if x>xCenter+8
        {
          image_xscale=-1
          //x-=4
          x-=4*gDeltaTime //60fps change: per 30fps tick
        }
        else if x<xCenter-8
        {
          image_xscale=1
          //x+=4
          x+=4*gDeltaTime //60fps change: per 30fps tick
        }
        if x<=xCenter+8 and x>=xCenter-8
          bossProgress=1
      }
      else if bossProgress=1
      {
        if y<room_height+16
          //y+=4
          y+=4*gDeltaTime //60fps change: per 30fps tick
        else
          bossProgress=2
      }
      else if bossProgress=2 and specialAttack>=166
      {
        x=xCenter
        flyDir=0
        sprite_index=sEBBatBody
        maxLife=23000
        var adjustCurve,tempAdjust;
        if global.difficulty=1 //Beginner
        {
          adjustCurve=0.15
          tempAdjust=maxLife*adjustCurve
          maxLife-=round(tempAdjust)
          life=maxLife
        }
        else if global.difficulty=3 //Hardcore
        {
          adjustCurve=0.15
          tempAdjust=maxLife*adjustCurve
          maxLife+=round(tempAdjust)
          life=maxLife
        }
        else if global.difficulty=4 //Distorted
        {
          adjustCurve=0.2
          tempAdjust=maxLife*adjustCurve
          maxLife+=round(tempAdjust)
          life=maxLife
        }

        life=maxLife
        barAmount=2
        eName="Enflamed Blazing Robot"
        combatText="Like the bat, it can spam lots of fireballs. Think a bit and dodging won't be as tough as you might think. As it comes out of the lava, it will cause a large amount of fireballs to come up with it, but that isn't the scary part. The flame in its hand will rise and split into a large number of spiraling fireballs, which will explode into more fireballs. The sword will spin, when it stops, it will fly toward you and leave fireballs behind. Careful though, these fireballs split."
        sideText="Whoa, okay that was unexpected. The machine is not giving off any Darkness readings. This guy sure does get extreme about guarding it's home, but so would I."
        cripplePointText=">Thrust Attack#>Upward Strike"
        batForm=2
      }
    }
    else if batForm=2 //********** Lava Robot Form **********
    {
      if flyDir=0 //in lava
      {
        //come out of lava
        //underLavaTime+=1
        underLavaTime+=gDeltaTime //60fps change: counts 30fps ticks
        if underLavaTime>=underLavaWait
        {
          //if underLavaTime=underLavaWait
          if scrCountPass(underLavaTime,underLavaWait) //60fps change: once, when the count reaches it
            bCanTakeDamage=true
          if x>oCharacter.x
            image_xscale=-1
          else
            image_xscale=1
          if y>240 and handFlameTime<1000
            //y-=6
            y-=6*gDeltaTime //60fps change: per 30fps tick
          //if underLavaTime=underLavaWait+5
          if scrCountPass(underLavaTime,underLavaWait+5) //60fps change: once, when the count reaches it
          {
            for(i=0;i<riseFireAmount;i+=1)
            {
              newAttack=instance_create(432+random(32),336,oShotzoBullet)
              newAttack.sprite_index=sALfireball
              newAttack.damageType="SPIRIT"
              newAttack.spiritPower=spiritPower
              newAttack.elementType=1
              newAttack.image_xscale=0.9
              newAttack.image_yscale=0.9
              newAttack.xVel=random_range(-3.5,3.5)
              newAttack.yVel=random_range(-12,-8)
            }
            if bossProgress>=4
            {
              for(i=0;i<round(riseFireAmount/2);i+=1)
              {
                newAttack=instance_create(192+random(32),336,oShotzoBullet)
                newAttack.sprite_index=sALfireball
                newAttack.damageType="SPIRIT"
                newAttack.spiritPower=spiritPower
                newAttack.elementType=1
                newAttack.image_xscale=0.8
                newAttack.image_yscale=0.8
                newAttack.xVel=random_range(-1,3.5)
                newAttack.yVel=random_range(-12,-8)

                newAttack=instance_create(672+random(32),336,oShotzoBullet)
                newAttack.sprite_index=sALfireball
                newAttack.damageType="SPIRIT"
                newAttack.spiritPower=spiritPower
                newAttack.elementType=1
                newAttack.image_xscale=0.8
                newAttack.image_yscale=0.8
                newAttack.xVel=random_range(-3.5,1)
                newAttack.yVel=random_range(-12,-8)
              }
            }
          }
        }
        //hand flame rise
        if underLavaTime>=underLavaWait
          //handFlameTime+=1
          handFlameTime+=gDeltaTime //60fps change: counts 30fps ticks
        if handFlameTime>=handFlameWait
        {
          if flameTempWait=0
            flameTempWait=handFlameWait
          //if handFlameTime=flameTempWait
          if scrCountPass(handFlameTime,flameTempWait) //60fps change: once, when the count reaches it
          {
            handFlameX=x+x5
            handFlameY=y+y5

          }
          //else if handFlameTime>=flameTempWait+1 and handFlameTime<=flameTempWait+999
          else if handFlameTime>flameTempWait and handFlameTime<=flameTempWait+999 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            if handFlameY>128
              //handFlameY-=2
              handFlameY-=2*gDeltaTime //60fps change: per 30fps tick
            else
              handFlameTime=flameTempWait+1000
          }
          //else if handFlameTime=flameTempWait+1010
          else if scrCountPass(handFlameTime,flameTempWait+1010) //60fps change: once, when the count reaches it
          {
            hFlameDist=0
            specialFireDir=0
            flameSpiralDrop=random(1)
            for(i=0;i<8;i+=1)
            {
              handFlameB[i]=instance_create(handFlameX,handFlameY,oCannonBullet)
              handFlameB[i].sprite_index=sALfireball
              handFlameB[i].spiritPower=spiritPower
              handFlameB[i].damageType="SPIRIT"
              handFlameB[i].elementType=1
              handFlameB[i].size=2
              handFlameB[i].image_xscale=1.25
              handFlameB[i].image_yscale=1.25
              handFlameB[i].bulletSpeed=0
            }
          }
          //else if handFlameTime>=flameTempWait+1011 and handFlameTime<=flameTempWait+1080
          else if handFlameTime>flameTempWait+1010 and handFlameTime<=flameTempWait+1080 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            var dir;
            dir=0
            for(i=0;i<8;i+=1)
            {
              handFlameB[i].x=handFlameX+lengthdir_x(hFlameDist,specialFireDir+dir)
              handFlameB[i].y=handFlameY+lengthdir_y(hFlameDist,specialFireDir+dir)
              //handFlameB[i].image_angle+=3
              handFlameB[i].image_angle+=3*gDeltaTime //60fps change: per 30fps tick
              dir+=45
            }
            //handFlameY+=flameSpiralDrop
            handFlameY+=flameSpiralDrop*gDeltaTime //60fps change: per 30fps tick
            //specialFireDir+=5
            specialFireDir+=5*gDeltaTime //60fps change: per 30fps tick
            //hFlameDist+=1
            hFlameDist+=1*gDeltaTime //60fps change: per 30fps tick
          }
          //else if handFlameTime=flameTempWait+1081
          else if scrCountPass(handFlameTime,flameTempWait+1081) //60fps change: once, when the count reaches it
          {
            for(i=0;i<8;i+=1)
            {
              for(ii=0;ii<round(riseFireAmount/4);ii+=1)
              {
                newAttack=instance_create(handFlameB[i].x,handFlameB[i].y,oShotzoBullet)
                newAttack.sprite_index=sALfireball
                newAttack.damageType="SPIRIT"
                newAttack.spiritPower=spiritPower
                newAttack.elementType=1
                newAttack.image_xscale=0.9
                newAttack.image_yscale=0.9
                newAttack.xVel=random_range(-4,4)
                newAttack.yVel=random_range(-5,-3)
              }
              with handFlameB[i]
                instance_destroy()
            }
          }
          else if handFlameTime>=flameTempWait+1110
          {
            //y+=6
            y+=6*gDeltaTime //60fps change: per 30fps tick
            if y>room_height+16
            {
              bCanTakeDamage=false
              bSwordOut=false
              underLavaTime=0
              handFlameTime=0
              swordReleaseTime=0
              flameTempWait=0
            }
          }
        }
        //sword release
        if bSwordOut=false
        {
          if underLavaTime>=underLavaWait
            //swordReleaseTime+=1
            swordReleaseTime+=gDeltaTime //60fps change: counts 30fps ticks
          if swordReleaseTime>=swordReleaseWait
          {
            effect_create_above(ef_ring,x+x4,y+y4,1,c_red)
            handSword=instance_create(x+x4,y+y4,oEBBatSword)
            handSword.image_angle=45
            handSword.damageType="SPIRIT"
            handSword.spiritPower=spiritPower
            handSword.elementType=1
            bSwordOut=true
          }
        }
      }
    }

    //scale difficulty
    if batForm=0
    {
      if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=0
      {
        specialAttack=1
        bossProgress+=1
      }
      else if lifePercent<=0.5 and bossProgress=2
      {
        bCanTakeDamage=false
        bossProgress=0
        batForm=1
      }
    }
    else if batForm=2
    {
      if lifePercent<=0.9 and lifePercent>=0.81 and bossProgress=0
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        bossProgress+=1
      }
      else if lifePercent<=0.8 and lifePercent>=0.71 and bossProgress=1
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        swordReleaseWait-=3
        swordFire+=1
        bossProgress+=1
      }
      else if lifePercent<=0.7 and lifePercent>=0.61 and bossProgress=2
      {
        riseFireAmount+=global.difficulty
        handFlameWait-=3*global.difficulty
        swordReleaseWait-=3
        bossProgress+=1
      }
      else if lifePercent<=0.6 and lifePercent>=0.51 and bossProgress=3
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        swordFire+=1
        bossProgress+=1
      }
      else if lifePercent<=0.5 and lifePercent>=0.41 and bossProgress=4
      {
        riseFireAmount+=global.difficulty
        handFlameWait-=3*global.difficulty
        swordReleaseWait-=3
        bossProgress+=1
      }
      else if lifePercent<=0.4 and lifePercent>=0.31 and bossProgress=5
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        bossProgress+=1
      }
      else if lifePercent<=0.3 and lifePercent>=0.21 and bossProgress=6
      {
        riseFireAmount+=global.difficulty
        handFlameWait-=3*global.difficulty
        swordReleaseWait-=3
        if global.difficulty=4
          swordFire+=2
        else
          swordFire+=1
        bossProgress+=1
      }
      else if lifePercent<=0.2 and lifePercent>=0.11 and bossProgress=7
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        swordReleaseWait-=3
        bossProgress+=1
      }
      else if lifePercent<=0.1 and lifePercent>=0 and bossProgress=8
      {
        riseFireAmount+=1
        handFlameWait-=2*global.difficulty
        bossProgress+=1
      }
    }
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
if batForm=2
{
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
    if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
    {
      inflictStatus(0)
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if batForm=2
{
  if image_xscale=1
  {
    x1=13
    x2=-13
    x3=-7
    x4=33
    swordAngle=45
  }
  else
  {
    x1=-13
    x2=13
    x3=7
    x4=-33
    swordAngle=315
  }
  y1=-10
  y2=-26
  y3=38
  y4=19

  if bSwordOut=false
    draw_sprite_ext(sEBBatSword,-1,x+x4,y+y4,image_xscale,image_yscale,swordAngle,image_blend,image_alpha)
  draw_sprite_ext(armFrame,-1,x+x1,y+y1,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  draw_sprite_ext(sEBBatHead,-1,x+x2,y+y2,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  draw_sprite_ext(sEBBatSnake,-1,x+x3,y+y3,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
event_inherited()
if batForm=2
{
  if image_xscale=1
    x5=-34
  else
    x5=34
  y5=46
  if handFlameTime<handFlameWait
    draw_sprite_ext(sEBBatFire,-1,x+x5,y+y5,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  else if handFlameTime>=handFlameWait and handFlameTime<=handFlameWait+1009
    draw_sprite_ext(sEBBatFire,-1,handFlameX,handFlameY,1,1,0,c_white,1)
}
