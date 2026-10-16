#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
animSpdNormal=0.2
image_speed=animSpdNormal
global.p1RaveEnergy=0

//Enemy base statistics
eName="Mitra (The Artist)"
maxLife=15000
life=maxLife
expWorth=0
physicalPower=500
physicalDefense=200
spiritPower=500
spiritDefense=300
FIREresist=100
WATERresist=100
WINDresist=100
EARTHresist=100
skillResist=100
bIsBoss=true
barAmount=2
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
maxAttacks=1
bRestoreLife=0
muffinCount=7
hexHackProg=0
hexHackTime=0
if global.difficulty=1
{
  restoreAmt=3
  atkNormal1Delay=320
  atkNormal2Delay=850
  corporateLaserAmt=12
  atkNormal3Delay=310
  atkNormal4Delay=290
}
else if global.difficulty=2
{
  restoreAmt=4
  atkNormal1Delay=300
  atkNormal2Delay=790
  corporateLaserAmt=15
  atkNormal3Delay=290
  atkNormal4Delay=270
}
else if global.difficulty=3
{
  restoreAmt=4
  atkNormal1Delay=280
  atkNormal2Delay=740
  corporateLaserAmt=18
  atkNormal3Delay=270
  atkNormal4Delay=260
}
else if global.difficulty=4
{
  restoreAmt=5
  atkNormal1Delay=260
  atkNormal2Delay=690
  corporateLaserAmt=21
  atkNormal3Delay=250
  atkNormal4Delay=240
}
teleportTime=0
teleportDelay=300
teleportProg=0
atkNormal1Time=120
atkNormal2Time=atkNormal2Delay-30
atkNormal3Time=200
atkNormal4Time=120
atkOptions=0
optionDir=0
optionDist=80
xTeleMax=96
yTeleMax=384
yTeleMin=48
laserSpawnSpd=70

bossProgress=0
difficultyAdjustments(global.difficulty)
maxLife=15000
life=maxLife
cripplePointText=">None (You're screwed)"
setPDefense=physicalDefense
setSDefense=spiritDefense

xCenter=448
yGround=512
roomSpan=384
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
    combatText="The Artist doesn't have too many attacks by himself, but with Hex backing him up and the Muffins lending him additional abilities, this is troublesome. With the Muffins there, he is invincible. You need to find a way to bring down the barriers and destroy them. Also note that when you destroy them, data will be distorted and changed. It's going to make this place very unstable. The released energy, if you can call it that, will be absorbed by The Artist. He will continually boost his own offensive and defensive abilities as you destroy the Muffins."
    sideText="This is from a game called 'Treasure of the Rudras'. I don't know if The Artist actually played that game or if he is just using something that looks menacing. Sad that the only thing The Artist is concerned with is protecting his own interests, he doesn't want his company exposed. Anyway, we can't let him win, the entire world is depending on us.#Wait... actually they aren't, no one knows this is actually happening. We're not even going to get recognition for this! Oh well, we're only nerds."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //-------------------- Defense Control --------------------
    if sprite_index=sMitraSpell
    {
      physicalDefense=round(setPDefense*1.1)
      spiritDefense=round(setSDefense*1.1)
    }
    else
    {
      physicalDefense=setPDefense
      spiritDefense=setSDefense
    }
    //-------------------- Option Control --------------------
    if atkOptions>0
    {
      for(i=0;i<atkOptions;i+=1)
      {
        artOption[i].x=x+lengthdir_x(optionDist,optionDir+(i*90))
        artOption[i].y=y+lengthdir_y(optionDist,optionDir+(i*90))
      }
      optionDir+=2
    }
    if bRestoreLife=0 //-------------------- NORMAL ACTIONS --------------------
    {
      teleportTime+=1
      if teleportProg=0
      {
        if teleportTime>teleportDelay //teleport check
        {
          if atkNormal1Time<atkNormal1Delay and atkNormal2Time<atkNormal2Delay and atkNormal3Time<atkNormal3Delay and atkNormal4Time<atkNormal4Delay
            teleportProg+=1
        }
        //facing direction
        if atkNormal1Time<atkNormal1Delay and atkNormal2Time<atkNormal2Delay and atkNormal3Time<atkNormal3Delay and atkNormal4Time<atkNormal4Delay
        {
          if x>oCharacter.x
            image_xscale=-1
          else
            image_xscale=1
        }
        //-------------------- Normal Attack 1: Forgery Laser --------------------
        if atkNormal2Time<atkNormal2Delay and atkNormal3Time<atkNormal3Delay and atkNormal4Time<atkNormal4Delay
          atkNormal1Time+=1
        if atkNormal1Time>=atkNormal1Delay
        {
          if atkNormal1Time=atkNormal1Delay //announce attack
          {
            enemyAttack=instance_create(0,0,oEnemyAttackAnnounce)
            enemyAttack.attackString="Forgery Laser"
            sprite_index=sMitraShot
            image_index=0
            image_speed=0
          }
          else if atkNormal1Time=atkNormal1Delay+55 //execute attack
          {
            image_index=1
            var laserOffsetX;
            if image_xscale=1
              laserOffsetX=27
            else
              laserOffsetX=-27
            effect=instance_create(x+laserOffsetX,y+21,oEffect)
            effect.sprite_index=sEnergyRip1
            effect.image_speed=0.75
            effect.image_xscale=0.8
            effect.image_yscale=0.8
            effect.newBlend=1

            mitraLaser=instance_create(x+laserOffsetX,y+21,oMitraLaser)
            mitraLaser.spiritPower=spiritPower
            if image_xscale=1
              mitraLaser.image_angle=320
            else
              mitraLaser.image_angle=220
            blastedSpeed=6
          }
          else if atkNormal1Time>=atkNormal1Delay+56 and atkNormal1Time<=atkNormal1Delay+90 //push back
          {
            blastedSpeed-=0.15
            if image_xscale=1
              x-=blastedSpeed
            else
              x+=blastedSpeed
            y-=blastedSpeed
          }
          else if atkNormal1Time=atkNormal1Delay+91 //end attack
          {
            sprite_index=sMitraIdle
            image_index=0
            image_speed=animSpdNormal
            atkNormal1Time=0
          }
          //laser start effect
          if atkNormal1Time>=atkNormal1Delay+5 and atkNormal1Time<=atkNormal1Delay+51 and atkNormal1Time mod 6=0
          {
            var laserEffectX;
            if image_xscale=1
              laserEffectX=31
            else
              laserEffectX=-31
            effect_create_above(ef_firework,x+laserEffectX,y+2,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
          }
        }
        //-------------------- Normal Attack 2: Corporate Takeover --------------------
        if maxAttacks>=2
        {
          if atkNormal1Time<atkNormal1Delay and atkNormal3Time<atkNormal3Delay and atkNormal4Time<atkNormal4Delay
            atkNormal2Time+=1
          if atkNormal2Time>=atkNormal2Delay
          {
            if sprite_index=sMitraSpell //stop animation
            {
              if image_index=image_number
                image_speed=0
            }

            if atkNormal2Time=atkNormal2Delay //announce attack
            {
              enemyAttack=instance_create(0,0,oEnemyAttackAnnounce)
              enemyAttack.attackString="Corporate Takeover"
              sprite_index=sMitraSpell
              image_index=0
              image_speed=0.2
              effect=instance_create(x,y,oEffect)
              effect.sprite_index=sMitraStar
              effect.image_speed=0.25
              effect.image_xscale=image_xscale
              corporateLaserDir=0
            }
            else if atkNormal2Time=atkNormal2Delay+240 //end attack
            {
              sprite_index=sMitraIdle
              image_index=0
              image_speed=animSpdNormal
              atkNormal2Time=0
            }

            if atkNormal2Time>=atkNormal2Delay+85 and atkNormal2Time mod 8=0 //create attack
            {
              var bulletDir;
              bulletDir=0
              for(i=0;i<corporateLaserAmt;i+=1)
              {
                newBullet=instance_create(x,y,oMMeShotArc)
                newBullet.sprite_index=sLaserB
                newBullet.physicalPower=physicalPower
                newBullet.bDestroyOnOutside=1
                newBullet.timeToDestroy=1000
                newBullet.bulletSpeed=5
                newBullet.direction=corporateLaserDir+bulletDir
                newBullet.arcTime=40+i
                if i mod 2=0
                  newBullet.bulletArc=4
                else
                  newBullet.bulletArc=-4
                bulletDir+=360/corporateLaserAmt
              }
              corporateLaserDir+=10
            }
          }
        }
        //-------------------- Normal Attack 3: Company Stock Options --------------------
        if maxAttacks>=3 and atkOptions<4
        {
          if atkNormal1Time<atkNormal1Delay and atkNormal2Time<atkNormal2Delay and atkNormal4Time<atkNormal4Delay
            atkNormal3Time+=1
          if atkNormal3Time>=atkNormal3Delay
          {
            if sprite_index=sMitraSpell //stop animation
            {
              if image_index=image_number
                image_speed=0
            }

            if atkNormal3Time=atkNormal3Delay //announce attack
            {
              enemyAttack=instance_create(0,0,oEnemyAttackAnnounce)
              enemyAttack.attackString="Company Stock Options"
              sprite_index=sMitraSpell
              image_index=0
              image_speed=0.2
              effect=instance_create(x,y,oEffect)
              effect.sprite_index=sMitraStar
              effect.image_speed=0.25
              effect.image_xscale=image_xscale
            }
            else if atkNormal3Time=atkNormal3Delay+81 //execute and end attack
            {
              artOption[atkOptions]=instance_create(x,y,oMitraOption)
              atkOptions+=1
              for(i=0;i<atkOptions;i+=1)
              {
                artOption[i].laserAtkTime=i*40
              }
              sprite_index=sMitraIdle
              image_index=0
              image_speed=animSpdNormal
              atkNormal3Time=0
            }
          }
        }
        //-------------------- Normal Attack 4: Legal Personality --------------------
        if maxAttacks>=4
        {
          if atkNormal1Time<atkNormal1Delay and atkNormal2Time<atkNormal2Delay and atkNormal3Time<atkNormal3Delay
            atkNormal4Time+=1
          if atkNormal4Time>=atkNormal4Delay
          {
            if sprite_index=sMitraSpell //stop animation
            {
              if image_index=image_number
                image_speed=0
            }

            if atkNormal4Time=atkNormal4Delay //announce attack
            {
              enemyAttack=instance_create(0,0,oEnemyAttackAnnounce)
              enemyAttack.attackString="Legal Personality"
              sprite_index=sMitraSpell
              image_index=0
              image_speed=0.2
              effect=instance_create(x,y,oEffect)
              effect.sprite_index=sMitraStar
              effect.image_speed=0.25
              effect.image_xscale=image_xscale
              corporateLaserDir=0
            }
            else if atkNormal4Time=atkNormal4Delay+81 //execute attack
            {
              for(i=0;i<8;i+=1)
              {
                for(ii=0;ii<4;ii+=1)
                {
                  mitraBombs=instance_create(x,y,oMitraBomb)
                  mitraBombs.physicalPower=physicalPower
                  mitraBombs.direction=45+(ii*90)
                  mitraBombs.waitTime=80+(i*8)
                  mitraBombs.bulletSpeed=6+i
                }
              }
            }
            else if atkNormal4Time=atkNormal4Delay+95 //end attack
            {
              sprite_index=sMitraIdle
              image_index=0
              image_speed=animSpdNormal
              atkNormal4Time=0
            }
          }
        }
      }
      else //-------------------- TELEPORT --------------------
      {
        if teleportProg=1 //start teleport
        {
          sprite_index=sMitraSpell
          image_index=12
          image_speed=0
          bCanTakeDamage=false
          teleportProg+=1
        }
        else if teleportProg=2 //fade out
        {
          image_alpha-=0.05
          if image_alpha<=0
            teleportProg+=1
        }
        else if teleportProg=3 //find a new location
        {
          x=random_range(xCenter-roomSpan+xTeleMax,xCenter+roomSpan-xTeleMax)
          y=random_range(yGround-yTeleMax,yGround-yTeleMin)
          while(place_meeting(x,y,oSolid))
          {
            x=random_range(xCenter-roomSpan+xTeleMax,xCenter+roomSpan-xTeleMax)
            y=random_range(yGround-yTeleMax,yGround-yTeleMin)
          }
          teleportTime=1000
          image_xscale=9
          image_yscale=9
          teleportProg+=1
        }
        else if teleportProg=4 //fade in
        {
          if teleportTime>=1030
          {
            image_xscale-=0.4
            image_yscale-=0.4
            image_alpha+=0.05
            if image_alpha>=1
            {
              bCanTakeDamage=true
              sprite_index=sMitraIdle
              image_index=0
              image_speed=animSpdNormal
              image_xscale=1
              image_yscale=1
              image_alpha=1
              teleportTime=0
              teleportProg=0
            }
          }
        }
      }
    }
    else if bRestoreLife=1 //-------------------- RESTORE LIFE --------------------
    {
      life+=restoreAmt
      if life>=maxLife
      {
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_white
        flashScreen.fadeSpeed=0.1
        bCanTakeDamage=true
        life=maxLife
        sprite_index=sMitraIdle
        image_index=0
        image_speed=animSpdNormal
        teleportTime=teleportDelay-30
        if atkNormal1Time>=atkNormal1Delay
          atkNormal1Time=atkNormal1Delay-40
        if instance_exists(oArtistMuffin)
        {
          oArtistMuffin.changeMuffin=0
          oArtistMuffin.bCanTakeDamage=false
          oArtistMuffin.life+=4000
        }
        with oMisc
          instance_destroy()
        muffinCount=instance_number(oArtistMuffin)
        bRestoreLife=0
      }
    }

    //------------------------------ JEREMY & HEXOR AREA CONTROL ------------------------------
    if muffinCount<=6 and hexHackProg=0 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=15
      {
        msgCreate("Let's change this.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=85
      {
        msgCreate("What?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=135
      {
        msgCreate("Middle platform, gone.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=160
        oEvPrimaryMemoryW1.bossPlat[5].image_blend=c_green
      else if hexHackTime>=161 and hexHackTime<=180
        oEvPrimaryMemoryW1.bossPlat[5].image_alpha-=0.05
      else if hexHackTime=181
        oEvPrimaryMemoryW1.bossPlat[5].y-=room_height
      else if hexHackTime=215
      {
        msgCreate("Sucks, but I can get by without that.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=315
      {
        msgCreate("How about this then?",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=330
      {
        oEvPrimaryMemoryW1.bossPlat[2].image_blend=c_green
        oEvPrimaryMemoryW1.bossPlat[7].image_blend=c_green
      }
      else if hexHackTime>=351 and hexHackTime<=370
      {
        oEvPrimaryMemoryW1.bossPlat[2].image_alpha-=0.05
        oEvPrimaryMemoryW1.bossPlat[7].image_alpha-=0.05
      }
      else if hexHackTime=371
      {
        oEvPrimaryMemoryW1.bossPlat[2].y-=room_height
        oEvPrimaryMemoryW1.bossPlat[7].y-=room_height
      }
      else if hexHackTime=400
      {
        msgCreate("Okay, that sucks a bit more, can you do something " +string(global.mainCharacters[1]) +string("?"),0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=110
      }
      else if hexHackTime=560
      {
        msgCreate("Yeah, hold on.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=1040
      {
        msgCreate("There we go, got them back.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=1050
      {
        oEvPrimaryMemoryW1.bossPlat[2].y+=room_height
        oEvPrimaryMemoryW1.bossPlat[5].y+=room_height
        oEvPrimaryMemoryW1.bossPlat[7].y+=room_height
      }
      else if hexHackTime>=1051 and hexHackTime<=1070
      {
        oEvPrimaryMemoryW1.bossPlat[2].image_alpha+=0.05
        oEvPrimaryMemoryW1.bossPlat[5].image_alpha+=0.05
        oEvPrimaryMemoryW1.bossPlat[7].image_alpha+=0.05
      }
      else if hexHackTime=1071
      {
        oEvPrimaryMemoryW1.bossPlat[2].image_blend=c_white
        oEvPrimaryMemoryW1.bossPlat[5].image_blend=c_white
        oEvPrimaryMemoryW1.bossPlat[7].image_blend=c_white
      }
      else if hexHackTime=1150
      {
        hexHackTime=0
        hexHackProg+=1
      }
    }
    else if muffinCount<=5 and hexHackProg=1 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=1
      {
        msgCreate("How about a laser right in the middle...",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=30
      {
        newLaser=instance_create(xCenter,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=400
        newLaser.onPlayer=1
        newLaser.bShake=1
      }
      else if hexHackTime=150
      {
        msgCreate("Just going to remove that laser.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=230
      {
        msgCreate("Then I'll add more.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=290
      {
        msgCreate("I'll just keep removing them.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=350
      {
        newLaser=instance_create(64,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=300
        newLaser.onPlayer=1
        newLaser.bShake=1
        newLaser=instance_create(256,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=300
        newLaser.onPlayer=1
        newLaser.bShake=0
        newLaser=instance_create(640,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=300
        newLaser.onPlayer=1
        newLaser.bShake=0
        newLaser=instance_create(832,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=300
        newLaser.onPlayer=1
        newLaser.bShake=0
      }
      else if hexHackTime>=450 and hexHackTime<=1200
      {
        if hexHackTime mod laserSpawnSpd=0
        {
          newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
          newLaser.spiritPower=spiritPower
          newLaser.idleTime=210
          newLaser.onPlayer=1
          newLaser.bShake=1
          if laserSpawnSpd>15
            laserSpawnSpd-=2
        }
        if hexHackTime>=1110
        {
          if teleportTime>teleportDelay
            teleportTime=50
        }
      }
      else if hexHackTime=1250
      {
        newLaser=instance_create(x,yGround,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=20
        newLaser.onPlayer=1
        newLaser.bShake=1
      }
      else if hexHackTime=1295
      {
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_white
        flashScreen.fadeSpeed=0.1
        life-=2000
        msgCreate("Ugh, what are you doing, that hit ME?!",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=1380
      {
        msgCreate("That wasn't me.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1440
      {
        msgCreate("I don't care, no more lasers!",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1510
      {
        msgCreate("Damn straight.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
        hexHackTime=0
        hexHackProg+=1
      }
    }
    else if muffinCount<=4 and hexHackProg=2 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=30
      {
        msgCreate("Hmm...",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=80
      {
        msgCreate("Go away.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime>=160 and hexHackTime<=200
      {
        if hexHackTime=190
          hexHackTime=170
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].yVel=4
        }
        platformCheck=0
        if oEvPrimaryMemoryW1.bossPlat[0].y>=480
        {
          oEvPrimaryMemoryW1.bossPlat[0].y=480
          oEvPrimaryMemoryW1.bossPlat[0].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[1].y>=496
        {
          oEvPrimaryMemoryW1.bossPlat[1].y=496
          oEvPrimaryMemoryW1.bossPlat[1].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[2].y>=464
        {
          oEvPrimaryMemoryW1.bossPlat[2].y=464
          oEvPrimaryMemoryW1.bossPlat[2].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[3].y>=480
        {
          oEvPrimaryMemoryW1.bossPlat[3].y=480
          oEvPrimaryMemoryW1.bossPlat[3].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[4].y>=464
        {
          oEvPrimaryMemoryW1.bossPlat[4].y=464
          oEvPrimaryMemoryW1.bossPlat[4].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[5].y>=480
        {
          oEvPrimaryMemoryW1.bossPlat[5].y=480
          oEvPrimaryMemoryW1.bossPlat[5].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[6].y>=496
        {
          oEvPrimaryMemoryW1.bossPlat[6].y=496
          oEvPrimaryMemoryW1.bossPlat[6].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[7].y>=464
        {
          oEvPrimaryMemoryW1.bossPlat[7].y=464
          oEvPrimaryMemoryW1.bossPlat[7].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[8].y>=480
        {
          oEvPrimaryMemoryW1.bossPlat[8].y=480
          oEvPrimaryMemoryW1.bossPlat[8].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[9].y>=480
        {
          oEvPrimaryMemoryW1.bossPlat[9].y=480
          oEvPrimaryMemoryW1.bossPlat[9].yVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[10].y>=496
        {
          oEvPrimaryMemoryW1.bossPlat[10].y=496
          oEvPrimaryMemoryW1.bossPlat[10].yVel=0
          platformCheck+=1
        }
        if platformCheck=11
          hexHackTime=300
      }
      else if hexHackTime=340
      {
        maxAttacks=2
        yTeleMax=224
        msgCreate("Not cool.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=390
      {
        msgCreate("I'll get this fixed in just a sec.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=90
      }
      else if hexHackTime=480
      {
        msgCreate("No offense, but you're being unusually slow.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=580
      {
        msgCreate("It's kinda hard to try keeping the battlefield under control while both#The Artist and Hex are attempting to block me out.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=180
      }
      else if hexHackTime=760
      {
        msgCreate("How about this, I've hacked your jump height.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=100
        oPlayer1.initialJumpAcc=-9.4
        oPlayer1.jumpTimeTotal=37
      }
      else if hexHackTime=860
      {
        msgCreate("I like this.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=1320
      {
        yTeleMax=384
        msgCreate("There we go, I got it.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1331
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].yVel=-4
        }
      }
      else if hexHackTime=1366
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].yVel=0
        }
      }
      else if hexHackTime=1390
      {
        msgCreate("I like that instead.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1470
      {
        msgCreate("Ass.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
        hexHackTime=0
        hexHackProg+=1
      }
    }
    else if muffinCount<=3 and hexHackProg=3 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=30
      {
        maxAttacks=3
        msgCreate("Alright, there we go.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=90
      {
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_white
        flashScreen.fadeSpeed=0.1
        oEvPrimaryMemoryW1.bossPlat[0].y=176
        oEvPrimaryMemoryW1.bossPlat[1].y=304
        oEvPrimaryMemoryW1.bossPlat[2].y=240
        oEvPrimaryMemoryW1.bossPlat[3].y=368
        oEvPrimaryMemoryW1.bossPlat[4].y=176
        oEvPrimaryMemoryW1.bossPlat[5].y=304
        oEvPrimaryMemoryW1.bossPlat[6].y=432
        oEvPrimaryMemoryW1.bossPlat[7].y=240
        oEvPrimaryMemoryW1.bossPlat[8].y=368
        oEvPrimaryMemoryW1.bossPlat[9].y=176
        oEvPrimaryMemoryW1.bossPlat[10].y=304
      }
      else if hexHackTime=130
      {
        msgCreate("Whoa, warn me before you do that!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=200
      {
        msgCreate("I did.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=40
      }
      else if hexHackTime=240
      {
        msgCreate("A better and less vague warning next time.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=310
      {
        msgCreate("Fair enough.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=40
        hexHackTime=0
        hexHackProg+=1
      }
    }
    else if muffinCount<=2 and hexHackProg=4 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=30
      {
        msgCreate("Here's something.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=80
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_blend=c_green
        }
      }
      else if hexHackTime>=81 and hexHackTime<=100
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_alpha-=0.05
        }
      }
      else if hexHackTime=101
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].y-=room_height
        }
      }
      else if hexHackTime=130
      {
        msgCreate("Don't you mean, here's nothing?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=200
      {
        oEvPrimaryMemoryW1.boostedRecovery=0
        oEvPrimaryMemoryW1.lifeRecovery=0
        oPlayer1.life+=oPlayer1.maxLife/3
        oPlayer1.spiritEnergy=0
        oPlayer1.fireEnergy=0
        oPlayer1.waterEnergy=0
        oPlayer1.windEnergy=0
        oPlayer1.earthEnergy=0
        msgCreate("Precisely.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=40
      }
      else if hexHackTime=240
      {
        msgCreate("Oh what the hell?!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=290
      {
        msgCreate("I'll try to get your boosted recovery back.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=360
      {
        msgCreate("Would be awesome.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=450
      {
        msgCreate("Got those back.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=460
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].y+=room_height
        }
      }
      else if hexHackTime>=461 and hexHackTime<=480
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_alpha+=0.05
        }
      }
      else if hexHackTime=481
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_blend=c_white
        }
      }
      else if hexHackTime=590
      {
        yTeleMax=224
        yTeleMin=96
        msgCreate("That's what you think.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=600
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_blend=c_green
        }
      }
      else if hexHackTime>=601 and hexHackTime<=620
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_alpha-=0.05
        }
      }
      else if hexHackTime=621
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].y-=room_height
        }
      }
      else if hexHackTime=690
      {
        oEvPrimaryMemoryW1.lifeRecovery=1
        oEvPrimaryMemoryW1.boostedRecovery=2.5
        msgCreate("Okay, got your recovery back and it's locked in.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=770
      {
        oPlayer1.runAcc=3.5
        msgCreate("It's all good, I'll just take this away.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=850
      {
        msgCreate("Oh wow, this sucks, fix this!!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=920
      {
        msgCreate("I'm trying, but he's messing with other parameters too,#I need to keep him from messing with those.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=120
      }
      else if hexHackTime=1040
      {
        msgCreate("Let's see...",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1100
      {
        oPlayer1.initialJumpAcc=-6
        oPlayer1.jumpTimeTotal=20
        oPlayer1.grav=2.5
        oPlayer1.dashVel=4
        msgCreate("Oh here we go!#Gravity increase, dash speed way down.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=1180
      {
        msgCreate("Still got my air dash.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1240
      {
        msgCreate("Not anymore.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1300
      {
        msgCreate("He can't take that or your dash.#I've got that locked down.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=1400
      {
        msgCreate("Yeah, but what good is it now?",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1600
      {
        msgCreate("So... going to fix this?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1670
      {
        oPlayer1.runAcc=7.05
        msgCreate("Fixed the run speed.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1730
      {
        msgCreate("You're really troublesome.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1790
      {
        msgCreate("I'm going to delete you soon.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=1770
      {
        msgCreate("That's a bit extreme.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=1830
      {
        msgCreate("It is a hazardous piece of code,#deleting it would be beneficial to the system.",0,oMessagePerson,global.mainCharacters[2],0,1)
        newMessage.fadingTime=120
      }
      else if hexHackTime=1950
      {
        msgCreate("Did it ever occur to you that The Darkness could be using you?",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=110
      }
      else if hexHackTime=2060
      {
        msgCreate("Of course, it was the first thing that came to mind, however...",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=110
      }
      else if hexHackTime=2170
      {
        msgCreate("It seems very logical due to the circumstances that#we are favored by it.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=110
      }
      else if hexHackTime=2280
      {
        msgCreate("How so?",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=2340
      {
        msgCreate("Who cares?! Fix my problem!!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=2410
      {
        oPlayer1.initialJumpAcc=-9.4
        oPlayer1.jumpTimeTotal=37
        oPlayer1.grav=1.35
        oPlayer1.dashVel=14
        msgCreate("Oh right, it's done.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=2480
      {
        yTeleMax=384
        yTeleMin=48
        msgCreate("Finally!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=2530
      {
        msgCreate("Here's the platforms back as well.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=2540
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].y+=room_height
        }
      }
      else if hexHackTime>=2541 and hexHackTime<=2560
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_alpha+=0.05
        }
      }
      else if hexHackTime=2561
      {
        for(i=0;i<11;i+=1)
        {
          oEvPrimaryMemoryW1.bossPlat[i].image_blend=c_white
        }
      }
      else if hexHackTime=2600
      {
        msgCreate("Damn it!",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=2660
      {
        msgCreate("Hey look, we're winning... again!",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=2700
      {
        hexHackTime=0
        hexHackProg+=1
      }

      if hexHackTime>=1200 and hexHackTime<=2500 //create lasers
      {
        if hexHackTime mod 70=0
        {
          newLaser=instance_create(oPlayer1.x,yGround,oSLLaser)
          newLaser.spiritPower=spiritPower
          newLaser.idleTime=150
          newLaser.bShake=1
        }
      }
    }
    else if muffinCount<=1 and hexHackProg=5 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=30
      {
        msgCreate("You've somehow blocked me out of...",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=100
      {
        msgCreate("Everything? Yeah I know, I'm awesome.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=180
      {
        msgCreate("You really like antagonizing him don't you?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=80
      }
      else if hexHackTime=260
      {
        msgCreate("He pissed me off.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
      }
      if hexHackTime=320
      {
        msgCreate("Luckily I do have one more thing I can do.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=420
      {
        oEvPrimaryMemoryW1.lifeRecovery=3
        oEvPrimaryMemoryW1.boostedRecovery=3
        msgCreate("Bring it!#Oh by the way, you have better life recovery now.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=110
      }
      else if hexHackTime=530
      {
        msgCreate("As you wish.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=580
      {
        var hexLaserDir;
        hexLaserDir=90
        for(i=0;i<5;i+=1)
        {
          hexorLaser[i]=instance_create(room_width/2,room_height/2,oHexorLaser)
          hexorLaser[i].spiritPower=spiritPower
          hexorLaser[i].image_angle=hexLaserDir
          hexorLaser[i].idleTime=5000
          hexorLaser[i].bShake=0
          if i!=0
            hexorLaser[i].effectStop=1
          hexLaserDir+=360/5
        }
      }
      else if hexHackTime=650
      {
        msgCreate("That it?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=700
      {
        msgCreate("Not yet, oh and you can't dash through these.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=90
      }
      else if hexHackTime=790
      {
        msgCreate("Lame...",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=1290
      {
        msgCreate("Okay, I know it's awesome that there are spinning lasers,#but DO SOMETHING ABOUT THEM!!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
      }
      else if hexHackTime=1410
      {
        msgCreate("Trying. See if you can get a few hits in while I delete them.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=90
      }
      else if hexHackTime=1500
      {
        msgCreate("That's really funny...#No wait it's not!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1570
      {
        msgCreate("Ah, I knew I was forgetting something.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1580
      {
        for(i=0;i<5;i+=1)
        {
          with hexorLaser[i]
            instance_destroy()
        }
      }
      else if hexHackTime=1640
      {
        msgCreate(". . .",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=1690
      {
        oEvPrimaryMemoryW1.lifeRecovery=2
        msgCreate("Knocked that recovery back down.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=1760
      {
        hexHackTime=0
        hexHackProg+=1
        msgCreate("I don't need it anymore.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }

      if hexHackTime>=800 and hexHackTime<=1579 //rotate Hexor lasers
      {
        for(i=0;i<5;i+=1)
          hexorLaser[i].image_angle+=0.75
      }
    }
    else if muffinCount=0 and hexHackProg=6 //==================================================
    {
      hexHackTime+=1
      if hexHackTime=30
      {
        skillResist=0
        oEvPrimaryMemoryW1.lifeRecovery=3
        msgCreate("Now that the Muffins are gone,#I've taken his physical technique resist down.#They will work on him now.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=130
      }
      else if hexHackTime=160
      {
        xTeleMax=320
        msgCreate("Alright, this has to change.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime>=240 and hexHackTime<=280
      {
        if hexHackTime>=260
          hexHackTime=240
        oEvPrimaryMemoryW1.bossPlat[11].xVel=4
        oEvPrimaryMemoryW1.bossPlat[12].xVel=-4
        platformCheck=0
        if oEvPrimaryMemoryW1.bossPlat[11].x>=240
        {
          oEvPrimaryMemoryW1.bossPlat[11].x=240
          oEvPrimaryMemoryW1.bossPlat[11].xVel=0
          platformCheck+=1
        }
        if oEvPrimaryMemoryW1.bossPlat[12].x<=640
        {
          oEvPrimaryMemoryW1.bossPlat[12].x=640
          oEvPrimaryMemoryW1.bossPlat[12].xVel=0
          platformCheck+=1
        }
        if platformCheck=2
          hexHackTime=300
      }
      else if hexHackTime=330
      {
        msgCreate("You're not fixing that one.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=400
      {
        yTeleMin=96
        msgCreate("Get off the ground!",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=500
      {
        var fireX;
        fireX=272
        for(i=0;i<12;i+=1)
        {
          firePit=instance_create(fireX+(i*32),yGround,oMarioLava)
          firePit.sprite_index=sFlameUp
          firePit.image_xscale=2
          firePit.image_yscale=2
        }
      }
    }
    else if hexHackProg=7 //==================== 66% ====================
    {
      hexHackTime+=1
      if hexHackTime=20
      {
        msgCreate("You won't win.",0,oMessagePerson,global.mainCharacters[3],0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=80
      {
        msgCreate("For once, I don't have a lame comeback.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=80
      }
    }
    else if hexHackProg=8 //==================== 50% ====================
    {
      hexHackTime+=1
      if hexHackTime=20
      {
        msgCreate("You've heavily distorted the data in this area.",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=120
      {
        maxAttacks=4
        msgCreate("Any major consequences of that?",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=190
      {
        msgCreate("You will see in a moment.",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=60
      }
    }
    else if hexHackProg=9 //==================== 15% ====================
    {
      hexHackTime+=1
      if hexHackTime=20
      {
        msgCreate("Try damaging me now.",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=60
      }
      else if hexHackTime=90
      {
        msgCreate("He's made himself completely invulnerable.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=90
      }
      else if hexHackTime=190
      {
        msgCreate("I told you, you can't win.",0,oMessagePerson,"The Artist",0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=270
      {
        msgCreate("We're gonna have to try something we've never done before.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=140
      }
      else if hexHackTime=420
      {
        msgCreate("Like what?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=50
      }
      else if hexHackTime=480
      {
        msgCreate("I know I've said not to during duels, but it's our only chance...",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=120
      }
      else if hexHackTime=610
      {
        msgCreate("Are you talking about Rave Mode?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=70
      }
      else if hexHackTime=690
      {
        msgCreate("Yes, I'm going to give you access to it.#You should be able to take him down with just a few shots.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=170
      }
      else if hexHackTime=870
      {
        msgCreate("I have to warn you though, you only get one chance at this.#If you screw up, it's Game Over.",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=160
      }
      else if hexHackTime=1040
      {
        msgCreate("Alright, give me access, I'm going to do this!",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=100
      }
      else if hexHackTime=1150
      {
        global.p1RaveEnergy=oPlayer1.raveMax
        hexHackTime=0
        hexHackProg+=1
        msgCreate("Done, kick his ass!",0,oMessagePerson,global.mainCharacters[1],0,1)
        newMessage.fadingTime=60
        msgCreate("You have access to Rave Mode.",0,oMessagePerson,"",0,128)
        newMessage.fadingTime=60
      }
    }

    //keep player out of rave mode
    if hexHackProg<9
      global.p1RaveEnergy=0
    //------------------------------ scale difficulty ------------------------------
    /*
    100% - 15000
    75%  - 11250
    67%  - 10050
    50%  - 7500
    33%  - 4950
    25%  - 3750
    */
    if lifePercent<=0.67 and lifePercent>=0.5 and bossProgress=0 and bRestoreLife=0
    {
      if instance_exists(oArtistMuffin)
      {
        sprite_index=sMitraSpell
        image_index=12
        image_speed=0
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_white
        flashScreen.fadeSpeed=0.1
        bCanTakeDamage=false
        oArtistMuffin.changeMuffin=1
        teleportTime=teleportDelay-50
        bRestoreLife=1
      }
      else
      {
        hexHackTime=0
        hexHackProg+=1
        bossProgress+=1
      }
    }
    else if lifePercent<=0.49 and lifePercent>=0.16 and bossProgress=1
    {
      hexHackTime=0
      hexHackProg+=1
      bossProgress+=1
    }
    else if lifePercent<=0.15 and lifePercent>=0 and bossProgress=2
    {
      setPDefense=2500
      setSDefense=2500
      hexHackTime=0
      hexHackProg+=1
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
if other.attackType=other.HURRICANE_DASH {other.physicalPower=oPlayer1.physicalPower*1.1}

event_inherited()
