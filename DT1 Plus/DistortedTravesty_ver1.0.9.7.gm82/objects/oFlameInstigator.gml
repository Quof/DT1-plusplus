#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-18,-42,18,-1)
image_speed=0
//Enemy base statistics
eName="Flame Instigator"
maxLife=10000
life=maxLife
expWorth=12500
physicalPower=215
physicalDefense=100
spiritPower=235
spiritDefense=90
FIREresist=75
WATERresist=-50
WINDresist=40
EARTHresist=-20
skillResist=5
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
attackDelay=0
currentAction=0 //action set
currentAttack=0 //attack set
specialAttack=0
tempVal=0
animChange=-1
inactiveDist=100000
if global.difficulty=1
  waitTime=52
else if global.difficulty=2
  waitTime=45
else if global.difficulty=3
  waitTime=38
else if global.difficulty=4
  waitTime=31
jumpTime=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Water Blast"
bossProgress=0
xCenter=416
yGround=320
roomSpan=256
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  var tJumpAcc; tJumpAcc=0 //60fps change (added): the jump's upward push, added in with the gravity at the end
  makeEnemyActive()
  if activateBoss=1
  {
    oGlobalEvent.enemyCount=1
    image_speed=0.25
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="This guy is fast, can react and counter your every move, and can chain most of his attacks. However, he technically only has 2 attacks. One is them is his Flame Cannon. When he's on the ground, watch for when he lifts his arm. I suggest dashing through it and pounding him in the face! The other is his Ground Shock Wave. Just dash away when you see him start to slam against the ground. I'm also seeing some super attack, a wave of flames style thing."
    sideText="I can't tell who this guy is with. Is he with The Darkness or another group attempting to get the Muffins? One things for sure, he wants you dead. It's pretty easy to tell which world he comes from though, I wonder how much of that we'll be seeing and how many 1-hit kill spikes there will be in the future. That armor he has is interesting, it protects him from Fire and Wind elements, but leaves him vulnerable to Earth and especially Water."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if animChange!=-1
      //animChange+=1
      animChange+=gDeltaTime //60fps change: counts 30fps ticks
    if sprite_index=sKredaeusIdle
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    //========================= choose next action =========================
    if currentAction>=0 and currentAction<=9 //on ground
    {
      //if attackDelay>=waitTime
      //60fps change: it counts in gDeltaTime steps after the check, so the frame that resets it isn't counted (as at
      //30fps): the wait ends that much sooner in the count, so it's the same length (>=waitTime at 30fps)
      if attackDelay>=waitTime+1-gDeltaTime
      {
        if specialAttack=1 or specialAttack=3
        {
          specialAttack+=1
          currentAction=50
          attackDelay=0
        }
        if currentAction=5 //choose new action
        {
          baseJumpDiveChance=(roomSpan-findTargetX)/10
          if baseJumpDiveChance<0
            baseJumpDiveChance=0
          nextAction=round(random(100)+1)
          if x<=xCenter //left side
          {
            if image_xscale=1 //facing right
            {
              if nextAction<baseJumpDiveChance
                currentAction=40
              if currentAction=5
              {
                if nextAction<=70
                  currentAction=20
                else if nextAction>=71 and nextAction<=85
                  currentAction=10
                else
                  currentAction=30
              }
            }
            else //facing right
            {
              if nextAction<baseJumpDiveChance-10
                currentAction=40
              if currentAction=5
              {
                if nextAction<=70
                  currentAction=30
                else if nextAction>=71 and nextAction<=90
                  currentAction=10
                else
                  currentAction=20
              }
            }
          }
          else //right side
          {
            if image_xscale=1 //facing right
            {
              if nextAction<baseJumpDiveChance-10
                currentAction=40
              if currentAction=5
              {
                if nextAction<=70
                  currentAction=30
                else if nextAction>=71 and nextAction<=90
                  currentAction=10
                else
                  currentAction=20
              }
            }
            else //facing left
            {
              if nextAction<baseJumpDiveChance
                currentAction=40
              if currentAction=5
              {
                if nextAction<=70
                  currentAction=20
                else if nextAction>=71 and nextAction<=85
                  currentAction=10
                else
                  currentAction=30
              }
            }
          }
          attackDelay=0
        }
        else if currentAction=0
        {
          currentAttack=10
          currentAction=5
          attackDelay=0
        }
      }
      else
        //attackDelay+=1
        attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
    }
    //========================= actions =========================
    else if currentAction>=10 and currentAction<=19 //jump straight up
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if attackDelay=1
      if scrCountPass(attackDelay,1) //60fps change: once, when the count reaches it
      {
        jumpTime=6
        yVel=-4
        y-=4
      }
      //else if attackDelay=17
      else if scrCountPass(attackDelay,17) //60fps change: once, when the count reaches it
        currentAttack=20
      //else if attackDelay=41
      else if scrCountPass(attackDelay,41) //60fps change: once, when the count reaches it
      {
        if findTargetX>96
        {
          if oPlayer1.y<yGround-16
            tempVal=1
          else
            tempVal=2
        }
        else
          currentAttack=40
      }
      //else if tempVal=1 and attackDelay=45
      else if tempVal=1 and scrCountPass(attackDelay,45) //60fps change: once, when the count reaches it
        currentAttack=10
      //else if tempVal=2 and attackDelay=57
      else if tempVal=2 and scrCountPass(attackDelay,57) //60fps change: once, when the count reaches it
        currentAttack=10
      //else if tempVal!=0 and attackDelay=72
      else if tempVal!=0 and scrCountPass(attackDelay,72) //60fps change: once, when the count reaches it
      {
        tempVal=0
        currentAction=0
      }
    }
    else if currentAction>=20 and currentAction<=29 //jump toward player
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if attackDelay=1
      if scrCountPass(attackDelay,1) //60fps change: once, when the count reaches it
      {
        jumpTime=6
        yVel=-4
        y-=4
        if image_xscale=1
          xVel=4
        else
          xVel=-4
      }
      //else if attackDelay=41
      else if scrCountPass(attackDelay,41) //60fps change: once, when the count reaches it
      {
        if findTargetX>96
        {
          currentAttack=20
          tempVal=4
        }
        else
        {
          currentAttack=40
          tempVal=3
        }
      }
      if findTargetX<64 and currentAction=20 and y<(yGround-96) and sprite_index=sKredaeusJump and attackDelay<20
      {
        currentAttack=30
        currentAction=21
      }
      //if attackDelay=60 and tempVal=4
      if scrCountPass(attackDelay,60) and tempVal=4 //60fps change: once, when the count reaches it
      {
        currentAttack=0
        currentAction=0
        attackDelay=0
      }
    }
    else if currentAction>=30 and currentAction<=39 //jump away from player
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if attackDelay=1
      if scrCountPass(attackDelay,1) //60fps change: once, when the count reaches it
      {
        jumpTime=6
        yVel=-4
        y-=4
        if image_xscale=1
          xVel=-4
        else
          xVel=4
      }
      //else if attackDelay=6
      else if scrCountPass(attackDelay,6) //60fps change: once, when the count reaches it
        currentAttack=20
      //else if attackDelay=29
      else if scrCountPass(attackDelay,29) //60fps change: once, when the count reaches it
        currentAttack=10
      //else if attackDelay=49
      else if scrCountPass(attackDelay,49) //60fps change: once, when the count reaches it
        currentAttack=10
      //else if attackDelay=70
      else if scrCountPass(attackDelay,70) //60fps change: once, when the count reaches it
      {
        if findTargetX<160
          currentAttack=60
        else
        {
          attackDelay=0
          currentAction=0
        }
      }
    }
    else if currentAction>=40 and currentAction<=49 //low jump
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if attackDelay=1
      if scrCountPass(attackDelay,1) //60fps change: once, when the count reaches it
      {
        jumpTime=2
        yVel=-4
        y-=4
        if image_xscale=1
          xVel=8
        else
          xVel=-8
      }
      //else if attackDelay=9
      else if scrCountPass(attackDelay,9) //60fps change: once, when the count reaches it
        currentAttack=40
    }
    else if currentAction>=50 and currentAction<=59 //rain fire
    {
      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if attackDelay=1
      if scrCountPass(attackDelay,1) //60fps change: once, when the count reaches it
      {
        tempVal=6
        if x<xCenter
          image_xscale=1
        else
          image_xscale=-1
        currentAttack=60
      }
    }
    //========================= attacks =========================
    if currentAttack=10 //shoot straight
    {
      if animChange=-1
        animChange=0
      sprite_index=sKredaeusShootStraight
      //if animChange=8
      if scrCountPass(animChange,8) //60fps change: once, when the count reaches it
      {
        currentAttack=0
        if image_xscale=1
          offsetX=12
        else
          offsetX=-12
        playSound(global.snd_SpellFireball,0,1)
        fireBall=instance_create(x+offsetX,y-32,oKreFire)
        fireBall.spiritPower=spiritPower
        fireBall.type=1
        if image_xscale=1
          //fireBall.direction=0
          fireBall._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        else
          //fireBall.direction=180
          fireBall._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
    }
    else if currentAttack=20 //shoot diagonal
    {
      if animChange=-1
        animChange=0
      sprite_index=sKredaeusShootDiagonal
      //if animChange=1
      if scrCountPass(animChange,1) //60fps change: once, when the count reaches it
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }
      //else if animChange=8
      else if scrCountPass(animChange,8) //60fps change: once, when the count reaches it
      {
        currentAttack=0
        if image_xscale=1
          offsetX=12
        else
          offsetX=-12
        playSound(global.snd_SpellFireball,0,1)
        fireBall=instance_create(x+offsetX,y-32,oKreFire)
        fireBall.spiritPower=spiritPower
        fireBall.type=1
        if image_xscale=1
          //fireBall.direction=315
          fireBall._direction=315 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        else
          //fireBall.direction=225
          fireBall._direction=225 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
    }
    else if currentAttack=30 //shoot down
    {
      if animChange=-1
        animChange=0
      sprite_index=sKredaeusShootDown
      //if animChange=8
      if scrCountPass(animChange,8) //60fps change: once, when the count reaches it
      {
        currentAttack=0
        playSound(global.snd_SpellFireball,0,1)
        fireBall=instance_create(x,y-4,oKreFire)
        fireBall.spiritPower=spiritPower
        fireBall.type=1
        //fireBall.direction=270
        fireBall._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
      }
    }
    else if currentAttack>=40 and currentAttack<=49 //shock wave start
    {
      sprite_index=sKredaeusSlamDown
      if currentAttack=40
      {
        playSound(global.snd_RockThrow,0,1)
        yVel=7
        currentAttack=41
      }
      if yVel=0
        currentAttack=50
    }
    else if currentAttack=50 //shock wave end
    {
      if animChange=-1
        animChange=0
      sprite_index=sKredaeusGroundHit
      //if animChange=2
      if scrCountPass(animChange,2) //60fps change: once, when the count reaches it
      {
        playSound(global.snd_BreakOut,0,1)
        currentAttack=0
        effect=instance_create(x,y,oEffect)
        effect.sprite_index=sGroundSmash
        shockwave=instance_create(x,y,oKreShockwave)
        shockwave.spiritPower=spiritPower+30
        //shockwave.direction=0
        shockwave._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        shockwave=instance_create(x,y,oKreShockwave)
        shockwave.spiritPower=spiritPower+30
        //shockwave.direction=180
        shockwave._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        explosion=instance_create(x,y,oGASGExplosion)
        explosion.physicalPower=spiritPower+10
        explosion.sprite_index=sALfirePillar
        explosion.image_speed=0.33
      }
    }
    else if currentAttack=60 //charge
    {
      if animChange=-1
        animChange=0
      if sprite_index=sKredaeusIdle
        sprite_index=sKredaeusChargeStart
      if sprite_index=sKredaeusChargeStart
      {
        //if animChange=12
        if scrCountPass(animChange,12) //60fps change: once, when the count reaches it
        {
          playSound(global.snd_JumpStrike,0,1)
          sprite_index=sKredaeusCharging
          animChange=0
        }
      }
      else if sprite_index=sKredaeusCharging
      {
        if image_xscale=1
          xVel=9
        else
          xVel=-9
        if tempVal!=6
        {
          //if animChange=18
          if scrCountPass(animChange,18) //60fps change: once, when the count reaches it
          {
            animChange=-1
            sprite_index=sKredaeusIdle
            attackDelay=0
            currentAction=0
            currentAttack=0
          }
        }
        else
        {
          centerDist=point_distance(xCenter,0,x,0)
          if centerDist<32
          {
            animChange=-1
            xVel=0
            sprite_index=sKredaeusIdle
            currentAttack=70
          }
        }
      }
    }
    else if currentAttack=70 //rain fire
    {
      if animChange=-1
        animChange=0
      if sprite_index=sKredaeusIdle
      {
        sprite_index=sKredaeusRainFire1
        physicalDefense*=3
        spiritDefense*=3
      }
      if sprite_index=sKredaeusRainFire1
      {
        //if animChange=48
        if scrCountPass(animChange,48) //60fps change: once, when the count reaches it
        {
          sprite_index=sKredaeusRainFire2
          animChange=0
        }
      }
      else if sprite_index=sKredaeusRainFire2
      {
        if tempVal<=15
        {
          //if animChange=4 //left gun
          if scrCountPass(animChange,4) //left gun //60fps change: once, when the count reaches it
          {
            playSound(global.snd_SpellFireball,0,1)
            fireBall=instance_create(x-9,y-56,oKreFire)
            fireBall.spiritPower=spiritPower+10
            fireBall.type=2
            //fireBall.direction=90
            fireBall._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          }
          //else if animChange=8 //right gun
          else if scrCountPass(animChange,8) //right gun //60fps change: once, when the count reaches it
          {
            playSound(global.snd_SpellFireball,0,1)
            fireBall=instance_create(x+9,y-56,oKreFire)
            fireBall.spiritPower=spiritPower+10
            fireBall.type=3
            //fireBall.direction=90
            fireBall._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
            tempVal+=1
            animChange=0
          }
        }
        else
        {
          //if animChange=4
          if scrCountPass(animChange,4) //60fps change: once, when the count reaches it
          {
            sprite_index=sKredaeusRainFire3
            animChange=0
          }
        }
      }
      else if sprite_index=sKredaeusRainFire3
      {
        //if animChange=12
        if scrCountPass(animChange,12) //60fps change: once, when the count reaches it
        {
          tempVal=0
          animChange=-1
          sprite_index=sKredaeusIdle
          physicalDefense/=3
          spiritDefense/=3
          attackDelay=0
          currentAction=0
          currentAttack=0
        }
      }
    }

    //revert animation to idle/jump after shooting
    if sprite_index=sKredaeusShootStraight and animChange>=20
    {
      if yVel=0
        sprite_index=sKredaeusIdle
      else
        sprite_index=sKredaeusJump
      animChange=-1
    }
    else if sprite_index=sKredaeusShootDiagonal and animChange>=20
    {
      if yVel=0
        sprite_index=sKredaeusIdle
      else
        sprite_index=sKredaeusJump
      animChange=-1
    }
    else if sprite_index=sKredaeusShootDown and animChange>=20
    {
      if yVel=0
        sprite_index=sKredaeusIdle
      else
        sprite_index=sKredaeusJump
      animChange=-1
    }
    else if sprite_index=sKredaeusGroundHit and animChange>=8
    {
      sprite_index=sKredaeusIdle
      if tempVal!=3
      {
        attackDelay=0
        currentAction=0
      }
      else if tempVal=3
      {
        if findTargetX<160
        {
          tempVal=0
          currentAttack=60
        }
        else
        {
          tempVal=0
          attackDelay=0
          currentAction=0
        }
      }
      animChange=-1
    }

    //animation fix while in the air or on the ground while not attacking
    if yVel=0
    {
      if currentAttack=0 and sprite_index=sKredaeusJump
        sprite_index=sKredaeusIdle
    }
    else
    {
      if currentAttack=0 and sprite_index=sKredaeusIdle
        sprite_index=sKredaeusJump
    }
    //stop momentum on ground
    if sprite_index=sKredaeusIdle
    {
      if xVel>0
        //xVel-=0.75
        xVel-=0.75*gDeltaTime //60fps change: per 30fps tick
      else if xVel<0
        //xVel+=0.75
        xVel+=0.75*gDeltaTime //60fps change: per 30fps tick

      if xVel>1.5
        xVel=0
      else if xVel<1.5
        xVel=0
    }

    //jumping
    if jumpTime>0
    {
      //jumpTime-=1
      jumpTime-=gDeltaTime //60fps change: counts 30fps ticks
      if yVel>-7
        //yVel-=1
        tJumpAcc=1 //60fps change: per 30fps tick, with the gravity below (one scrGravAcc a frame)
    }

    //afterimage and break "Earth Shift"
    if sprite_index=sKredaeusCharging
    {
      if gDeltaDoTicks //60fps change (added): the afterimage once per 30fps tick
        kreAfterImage=instance_create(x,y,oKreAfterImage)
      if instance_exists(oEarthShift)
      {
        findESX=point_distance(oEarthShift.x,0,x,0)
        if findESX<48
        {
          effect=instance_create(oEarthShift.x,oEarthShift.y,oEffect)
          effect.sprite_index=sGrenadeExplosion
          effect.image_speed=0.9
          effect.image_xscale=1.1
          effect.image_yscale=1.1
          with oEarthShift
            instance_destroy()
        }
      }
    }

    //check touch damage states
    if sprite_index=sKredaeusCharging or sprite_index=sKredaeusSlamDown
      bCanDealDamage=true
    else
      bCanDealDamage=false

    //scripted attacks
    if lifePercent<=0.66 and specialAttack=0
      specialAttack=1
    else if lifePercent<=0.33 and specialAttack=2
      specialAttack=3
    //scale difficulty
    if lifePercent<=1 and lifePercent>=0.76 and bossProgress=0
    {
      waitTime-=5
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      waitTime-=5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
        waitTime-=8
      else
        waitTime-=4
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty=4
        waitTime-=7
      else
        waitTime-=5
      bossProgress+=1
    }
  }
  //yVel+=0.3
  yVel=scrGravAcc(yVel,0.3-tJumpAcc,1) //60fps change: gravity (and the jump's push) per 30fps tick, following the 30fps arc
  if isCollisionBottom(1)
    yVel=0
  if isCollisionLeft(1)
    xVel=1
  if isCollisionRight(1)
    xVel=-1
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
  enemyStepEvent()
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and other.currentSpell="WATER BLAST"
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
  if attackDelay<waitTime and currentAction<10
    attackDelay-=round(stunnedTime/2)
}
