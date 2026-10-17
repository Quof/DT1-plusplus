#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-32,-69,32,-1)
image_speed=0.33
image_xscale=-1

//Enemy base statistics
eName="Metallicardian"
maxLife=15000
life=maxLife
expWorth=31000
physicalPower=260
physicalDefense=120
spiritPower=270
spiritDefense=135
FIREresist=-30
WINDresist=90
EARTHresist=-60
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
specialAttack=0
if global.difficulty=1
{
  waitTime=55
  maxLightWaves=1
  twisterPasses=1
}
else if global.difficulty=2
{
  waitTime=50
  maxLightWaves=2
  twisterPasses=2
}
else if global.difficulty=3
{
  waitTime=45
  maxLightWaves=3
  twisterPasses=2
}
else if global.difficulty=4
{
  waitTime=40
  maxLightWaves=4
  twisterPasses=2
}
newLoc=0
attackDelay=0
attackTime=0
attackProgress=0
attackType=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Rock Smash while not Idle"

xCenter=448
yGround=336
roomSpan=224
teleportProgress=0
timeTillTeleport=90
teleportTimer=timeTillTeleport
colorBlend=255
bChooseNewLocation=false
fireCreate=0
doubleAttack=0
//teleport positions
psX1=320
psX2=448
psX3=576
psY1=208
psY2=272
psY3=336
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
    combatText="A guardian type robot whose technique is to limit it's opponent's area of movement. It's attacks cover a large area and unless you see it coming, they can be quite difficult to dodge. Luckily it's movement pattern is simple. It limits it's attacks based on where it teleports. Once you learn these, dodging him shouldn't be too much of a hassle.#It will start chaining it's attack after awhile though, so watch out."
    sideText="This thing uses a type of metal that is able to disassemble itself into microscopic particles and quickly move to another location. The fade out you see is the effect from that. It's AI is interesting as well. It seems like it maps out a room so it knows where it can teleport."
    activateBoss=2
  }
  if sprite_index=sMetallicardianShock or sprite_index=sMetallicardianRise or sprite_index=sMetallicardianTwister
    bCanDealDamage=true
  else
    bCanDealDamage=false

  if bActive=true and dieFade=0
  {
    if teleportProgress=0
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if attackDelay>=waitTime
      {
        if currentAttack=1 //metallic wave ==================================================
        {
          //attackTime+=1
          attackTime+=gDeltaTime //60fps change: counts 30fps ticks
          if attackProgress=0 //first wave
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
              sprite_index=sMetallicardianHover
            //if attackTime=25
            if scrCountPass(attackTime,25) //60fps change: once, when the count reaches it
            {
              mWave=instance_create(x,y-32,oDustRScythe)
              mWave.sprite_index=sMetallicWave
              mWave.type=2
              mWave.spiritPower=spiritPower
              mWave.bulletSpeed=10
              if newLoc=1 or newLoc=6
                //mWave.direction=0
                mWave._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              else if newLoc=3 or newLoc=8
              {
                //mWave.direction=180
                mWave._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                mWave.image_xscale=-1
              }

              if attackType=0
                attackProgress=10
              else if attackType>=1 and attackType<=4
              {
                attackTime=0
                attackProgress=1
              }
            }
          }
          else if attackProgress=1 //second wave
          {
            //if attackTime=3
            if scrCountPass(attackTime,3) //60fps change: once, when the count reaches it
            {
              if attackType=1 or attackType=3
                newLoc=5
              else if attackType=2 or attackType=4
                newLoc=4
              bChooseNewLocation=true
              effect_create_above(ef_smoke,x,y-(sprite_height/2),1,c_gray)
            }
            //if attackTime=12
            if scrCountPass(attackTime,12) //60fps change: once, when the count reaches it
            {
              mWave=instance_create(x,y-32,oDustRScythe)
              mWave.sprite_index=sMetallicWave
              mWave.type=2
              mWave.spiritPower=spiritPower
              mWave.bulletSpeed=10
              if newLoc=4
                //mWave.direction=0
                mWave._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              else if newLoc=5
              {
                //mWave.direction=180
                mWave._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                mWave.image_xscale=-1
              }
              attackTime=0
              attackProgress=2
            }
          }
          else if attackProgress=2 //third wave
          {
            //if attackTime=3
            if scrCountPass(attackTime,3) //60fps change: once, when the count reaches it
            {
              if attackType=1
                newLoc=6
              else if attackType=2
                newLoc=8
              else if attackType=3
                newLoc=1
              else if attackType=4
                newLoc=3
              bChooseNewLocation=true
              effect_create_above(ef_smoke,x,y-(sprite_height/2),1,c_gray)
            }
            //if attackTime=12
            if scrCountPass(attackTime,12) //60fps change: once, when the count reaches it
            {
              mWave=instance_create(x,y-32,oDustRScythe)
              mWave.sprite_index=sMetallicWave
              mWave.type=2
              mWave.spiritPower=spiritPower
              mWave.bulletSpeed=10
              if newLoc=1 or newLoc=6
                //mWave.direction=0
                mWave._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              else if newLoc=3 or newLoc=8
              {
                //mWave.direction=180
                mWave._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                mWave.image_xscale=-1
              }
              attackTime=0
              attackProgress=10
            }
          }
          else if attackProgress=10 //end wave
          {
            if doubleAttack!=2
            {
              currentAttack=-1
              attackTime=0
              attackDelay=0
              attackProgress=0
              teleportTimer=timeTillTeleport
            }
            else
            {
              currentAttack=choose(2,3)
              if currentAttack=2
              {
                newLoc=choose(9,10)
                bChooseNewLocation=true
              }
              if currentAttack=3
              {
                attackType=1
                newLoc=choose(2,4,5,7)
                bChooseNewLocation=true
              }
              effect_create_above(ef_smoke,x,y-(sprite_height/2),1,c_gray)
              attackTime=0
              attackProgress=0
              doubleAttack=3
            }
          }
        }
        if currentAttack=2 //metallic light wave ==================================================
        {
          //attackTime+=1
          attackTime+=gDeltaTime //60fps change: counts 30fps ticks
          if attackProgress=0 //rise to position
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
            {
              sprite_index=sMetallicardianRise
              riseUpSpeed=-12
            }
            //y+=riseUpSpeed
            //riseUpSpeed+=0.4
            //60fps change: per 30fps tick: it moves, then speeds up at the end of each of its 30fps ticks (each time
            //the count reaches a whole number), as at 30fps; from the frame that sets the speed (the count reaching 1)
            if attackTime>=1
            {
              y+=riseUpSpeed*gDeltaTime
              if scrModPass(attackTime,1)
                riseUpSpeed+=0.4
            }
            if riseUpSpeed>=0 and y>=272
            {
              y=psY2
              attackTime=0
              attackProgress=1
            }
          }
          else if attackProgress=1 //fire waves
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
            {
              sprite_index=sMetallicardianShock
              waveNum=0
            }
            if attackTime>=15
            {
              //if attackTime mod 10=0
              if scrModPass(attackTime,10) //60fps change: once each time the count reaches a multiple of it
              {
                mLightWave=instance_create(x,y-32,oMetalLWave)
                mLightWave.spiritPower=spiritPower-20
                mLightWave.bulletSpeed=8
                if newLoc=9
                  //mLightWave.direction=0
                  mLightWave._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                else if newLoc=10
                {
                  //mLightWave.direction=180
                  mLightWave._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                  mLightWave.image_xscale=-1
                }

                waveNum+=1
                if waveNum>=maxLightWaves
                {
                  attackTime=0
                  attackProgress=2
                }
              }
            }
          }
          else if attackProgress=2 //wait time
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
              sprite_index=sMetallicardianIdle
            if attackTime>=round(waitTime*1.5)
              attackProgress=10
          }
          else if attackProgress=10 //end wave
          {
            if doubleAttack!=2
            {
              currentAttack=-1
              attackTime=0
              attackDelay=0
              attackProgress=0
              teleportTimer=timeTillTeleport
            }
            else
            {
              currentAttack=choose(1,3)
              if currentAttack=1
              {
                newLoc=choose(1,3,6,8)
                bChooseNewLocation=true
                if newLoc=1
                  attackType=1
                else if newLoc=3
                  attackType=2
                else if newLoc=6
                  attackType=3
                else if newLoc=7
                  attackType=4
              }
              if currentAttack=3
              {
                newLoc=choose(2,4,5,7)
                bChooseNewLocation=true
                attackType=1
              }
              effect_create_above(ef_smoke,x,y-(sprite_height/2),1,c_gray)
              attackTime=0
              attackProgress=0
              doubleAttack=3
            }
          }
        }
        if currentAttack=3 //metallic tornado ==================================================
        {
          //attackTime+=1
          attackTime+=gDeltaTime //60fps change: counts 30fps ticks
          if attackProgress=0 //attack
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
              sprite_index=sMetallicardianHover
            //if attackTime=25
            if scrCountPass(attackTime,25) //60fps change: once, when the count reaches it
            {
              sprite_index=sMetallicardianShock
              if attackType=0
              {
                mTornado=instance_create(x,y,oDustRScythe)
                mTornado.sprite_index=sMetallicTornado
                mTornado.type=2
                mTornado.spiritPower=spiritPower
                mTornado.bulletSpeed=5
                if newLoc=2 or newLoc=7
                  //mTornado.direction=0
                  mTornado._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                else if newLoc=4 or newLoc=5
                  //mTornado.direction=90
                  mTornado._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)

                mTornado=instance_create(x,y,oDustRScythe)
                mTornado.sprite_index=sMetallicTornado
                mTornado.type=2
                mTornado.spiritPower=spiritPower
                mTornado.bulletSpeed=5
                if newLoc=2 or newLoc=7
                  //mTornado.direction=180
                  mTornado._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                else if newLoc=4 or newLoc=5
                  //mTornado.direction=270
                  mTornado._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              }
              else
              {
                var dir;
                dir=0
                for(i=0;i<4;i+=1)
                {
                  mTornado=instance_create(x,y,oDustRScythe)
                  mTornado.sprite_index=sMetallicTornado
                  mTornado.type=2
                  mTornado.spiritPower=spiritPower
                  mTornado.bulletSpeed=5
                  //mTornado.direction=dir
                  mTornado._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
                  dir+=90
                }
              }
              attackProgress=10
            }
          }
          else if attackProgress=10 //end wave
          {
            if doubleAttack!=2
            {
              currentAttack=-1
              attackTime=0
              attackDelay=0
              attackProgress=0
              teleportTimer=timeTillTeleport
            }
            else
            {
              currentAttack=choose(1,2)
              if currentAttack=1
              {
                newLoc=choose(1,3,6,8)
                bChooseNewLocation=true
                if newLoc=1
                  attackType=1
                else if newLoc=3
                  attackType=2
                else if newLoc=6
                  attackType=3
                else if newLoc=7
                  attackType=4
              }
              if currentAttack=2
              {
                newLoc=choose(9,10)
                bChooseNewLocation=true
              }
              effect_create_above(ef_smoke,x,y-(sprite_height/2),1,c_gray)
              attackTime=0
              attackProgress=0
              doubleAttack=3
            }
          }
        }
        if currentAttack=10 //special: metallic twister ==================================================
        {
          //attackTime+=1
          attackTime+=gDeltaTime //60fps change: counts 30fps ticks
          if attackProgress=0 //attack
          {
            //if attackTime=1
            if scrCountPass(attackTime,1) //60fps change: once, when the count reaches it
              sprite_index=sMetallicardianTwister
            //if attackTime=50
            if scrCountPass(attackTime,50) //60fps change: once, when the count reaches it
            {
              mTornado=instance_create(224,psY3,oMetalTwister)
              mTornado.spiritPower=spiritPower
              //mTornado.direction=0
              mTornado._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              mTornado.twisterPasses=twisterPasses
              mTornado=instance_create(672,psY3,oMetalTwister)
              mTornado.spiritPower=spiritPower
              //mTornado.direction=180
              mTornado._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              mTornado.twisterPasses=twisterPasses
            }
            if attackTime>=55
            {
              if !instance_exists(oMetalTwister)
                attackProgress=10
            }
          }
          else if attackProgress=10
          {
            currentAttack=-1
            attackTime=0
            attackDelay=0
            attackProgress=0
            teleportTimer=timeTillTeleport
          }
        }
      }

      if teleportTimer>=timeTillTeleport //start teleport ==================================================
      {
        bCanTakeDamage=false
        teleportTimer=0
        teleportProgress=1
      }
    }
    else if teleportProgress=1 //teleport away
    {
      //teleportTimer+=1
      teleportTimer+=gDeltaTime //60fps change: counts 30fps ticks
      //if teleportTimer=1
      if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
      {
        playSound(global.snd_Teleport,0,1)
        attackType=0
        sprite_index=sMetallicardianIdle
        if doubleAttack=1
          doubleAttack=2
        else if doubleAttack=3
          doubleAttack=1
      }
      //colorBlend-=15
      colorBlend-=15*gDeltaTime //60fps change: per 30fps tick
      //image_alpha-=0.06
      image_alpha-=0.06*gDeltaTime //60fps change: per 30fps tick
      image_blend=make_color_rgb(colorBlend,colorBlend,colorBlend)
      if teleportTimer>=17 //choose new location
      {
        colorBlend=0
        if specialAttack=1 or specialAttack=3
        {
          currentAttack=10
          specialAttack+=1
          newLoc=11
          bChooseNewLocation=true
          //teleportTimer=0
          teleportTimer=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
          teleportProgress=2
        }

        if currentAttack!=10
        {
          //normal attack teleport spot
          //if teleportTimer=17
          if scrCountPass(teleportTimer,17) //60fps change: once, when the count reaches it
          {
            newLoc=choose(1,2,3,4,5,6,7,8,9,10)    // -final make
            bChooseNewLocation=true
          }
          else if teleportTimer>=18
          {
            if newLoc=1
            {
              currentAttack=1
              if bossProgress>=1
                attackType=1
            }
            else if newLoc=2 or newLoc=4 or newLoc=5 or newLoc=7
            {
              currentAttack=3
              if bossProgress>=1
                attackType=1
            }
            else if newLoc=3
            {
              currentAttack=1
              if bossProgress>=1
                attackType=2
            }
            else if newLoc=6
            {
              currentAttack=1
              if bossProgress>=1
                attackType=3
            }
            else if newLoc=8
            {
              currentAttack=1
              if bossProgress>=1
                attackType=4
            }
            else if newLoc=9 or newLoc=10
            {
              currentAttack=2
            }
            //teleportTimer=0
            teleportTimer=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
            teleportProgress=2
          }
        }
      }
    }
    else if teleportProgress=2 //slight wait time
    {
      if teleportTimer>=10
      {
        //teleportTimer=0
        teleportTimer=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        teleportProgress=3
      }
      else
        //teleportTimer+=1
        teleportTimer+=gDeltaTime //60fps change: counts 30fps ticks
    }
    else if teleportProgress=3 //teleport in
    {
      if newLoc<=8 //normal
      {
        //if teleportTimer=1
        if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
          playSound(global.snd_Teleport,0,1)
        //colorBlend+=15
        colorBlend+=15*gDeltaTime //60fps change: per 30fps tick
        //image_alpha+=0.06
        image_alpha+=0.06*gDeltaTime //60fps change: per 30fps tick
        image_blend=make_color_rgb(colorBlend,colorBlend,colorBlend)
        if teleportTimer>=17
        {
          colorBlend=255
          image_blend=c_white
          bCanTakeDamage=true
          teleportProgress=0
        }
        else
          //teleportTimer+=1
          teleportTimer+=gDeltaTime //60fps change: counts 30fps ticks
      }
      else //rise up
      {
        image_alpha=1
        colorBlend=255
        image_blend=c_white
        attackDelay=waitTime
        bCanTakeDamage=true
        teleportProgress=0
      }
    }
    //choose new location
    if bChooseNewLocation=true
    {
      if newLoc=1
      {
        x=psX1
        y=psY1
        image_xscale=1
      }
      else if newLoc=2
      {
        x=psX2
        y=psY1
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }
      else if newLoc=3
      {
        x=psX3
        y=psY1
        image_xscale=-1
      }
      else if newLoc=4
      {
        x=psX1
        y=psY2
        image_xscale=1
      }
      else if newLoc=5
      {
        x=psX3
        y=psY2
        image_xscale=-1
      }
      else if newLoc=6
      {
        x=psX1
        y=psY3
        image_xscale=1
      }
      else if newLoc=7
      {
        x=psX2
        y=psY3
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }
      else if newLoc=8
      {
        x=psX3
        y=psY3
        image_xscale=-1
      }
      else if newLoc=9
      {
        x=256
        y=384
        image_xscale=1
      }
      else if newLoc=10
      {
        x=640
        y=384
        image_xscale=-1
      }
      else if newLoc=11
      {
        x=448
        y=96
        image_xscale=1
      }
      bChooseNewLocation=false
    }
    //fire start
    if instance_exists(fireCreate)
    {
      //fireCreate.image_angle+=15
      fireCreate.image_angle+=15*gDeltaTime //60fps change: per 30fps tick
      //fireCreate.y+=8
      fireCreate.y+=8*gDeltaTime //60fps change: per 30fps tick
      if fireCreate.y>=psY3
      {
        for(i=232;i<680;i+=16)
        {
          firePit=instance_create(i,psY3,oMarioLava)
          firePit.sprite_index=sFlameUp
        }
        with fireCreate
          instance_destroy()
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.71 and bossProgress=0
    {
      waitTime-=2
      bossProgress+=1
    }
    else if lifePercent<=0.7 and lifePercent>=0.51 and bossProgress=1
    {
      waitTime-=3
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.34 and bossProgress=2
    {
      if global.difficulty=4
      {
        twisterPasses+=2
        waitTime-=5
      }
      else if global.difficulty=3
      {
        twisterPasses+=1
        waitTime-=4
      }
      else
      {
        twisterPasses+=1
        waitTime-=2
      }
      doubleAttack=1
      maxLightWaves+=1
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.33 and lifePercent>=0.13 and bossProgress=3
    {
      fireCreate=instance_create(psX2,0,oMisc)
      fireCreate.type=1
      fireCreate.sprite_index=sALfireball
      fireCreate.image_xscale=2
      fireCreate.image_yscale=2
      fireCreate.image_alpha=0.6
      waitTime-=3
      bossProgress+=1
    }
    else if lifePercent<=0.12 and lifePercent>=0 and bossProgress=4
    {
      if global.difficulty>=3
        maxLightWaves+=1
      waitTime-=2
      bossProgress+=1
    }
  }
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="ROCK SMASH" and sprite_index!=sMetallicardianIdle
{
  inflictStatus(0)
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
  if attackDelay<waitTime
    attackDelay-=round((stunnedTime/2))
}
