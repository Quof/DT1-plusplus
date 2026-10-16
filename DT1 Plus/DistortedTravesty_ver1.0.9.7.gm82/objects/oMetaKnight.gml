#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-15,-20,15,-1)
image_speed=0.33
//Enemy base statistics
eName="Meta-Knight"
maxLife=6500
life=maxLife
expWorth=7000
physicalPower=190
physicalDefense=60
spiritPower=180
spiritDefense=55
FIREresist=-5
WATERresist=5
WINDresist=10
EARTHresist=-10
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
attackDelay=0
moveProgress=0
walkSpeed=1.75
runSpeed=4.75
if global.difficulty=1
  waitTime=75
else if global.difficulty=2
  waitTime=65
else if global.difficulty=3
  waitTime=60
else if global.difficulty=4
  waitTime=50
jumpTime=0
currentAction=5 //action set
currentAttack=0 //attack set
specialAttack=0
tempVal=0
flyUp=false
extraSwdWave=false
xCenter=360
yGround=320
roomSpan=200
animChange=-1
inactiveDist=100000
bossProgress=0
bActive=true
bShowHealthBar=true
activateBoss=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Downward Strike#>Full Swing#>Any Physical Attack"
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
    bActive=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    combatText="He has quite a few attacks. If he runs at you, be prepared for either a quick swing or a jump strike. If he walks, he may charge his sword or fly up and try a powerful downward strike. Be careful when he does charge his sword, he is able to make two projectile sword waves. Careful when he has been idle for too long as he will block your attacks and counter."
    sideText="Well look who it is, it's everyone's favorite Kirby rival. Wonder why he wants these Muffins? I doubt we're gonna get an answer out of him, so just kick his ass and take it. He definitely has one, I'm detecting a large amount of tasty energy."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if animChange!=-1
      animChange+=1
    if sprite_index!=sMetaKnightCharging or sprite_index!=sMetaKnightStandSlash or sprite_index!=sMetaKnightRunSlash or sprite_index!=sMetaKnightDownStab
    {
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    //========================= choose next action =========================
    if currentAction>=0 and currentAction<=9 //on ground
    {
      if attackDelay>=waitTime
      {
        if currentAction=5 //choose new action
        {
          nextAction=round(random(100)+1)
          if nextAction>=1 and nextAction<=41
            currentAction=10
          else if nextAction>=42 and nextAction<=84
            currentAction=20
          else if nextAction>=85 and nextAction<=101
            currentAction=30

          if currentAction=5
            currentAction=10
          flyUp=false
          tempVal=0
          attackDelay=0
          moveProgress=0
        }
        else if currentAction=0
        {
          if bossProgress>=4
          {
            if extraSwdWave=true
              currentAttack=10
            else
              currentAttack=0
          }
          else
            currentAttack=10
          currentAction=5
          flyUp=false
          tempVal=0
          attackDelay=0
          moveProgress=0
        }
      }
      else
        attackDelay+=1
    }
    //========================= actions =========================
    else if currentAction>=10 and currentAction<=19 //walk toward player
    {
      attackDelay+=1; moveProgress+=1
      if attackDelay=1
      {
        sprite_index=sMetaKnightWalk
        if random(10)>=9
        {
          moveProgress=30
          xVel=0
          currentAttack=40
        }
      }

      if sprite_index=sMetaKnightWalk
      {
        if x>=oPlayer1.x
          xVel=-walkSpeed
        else
          xVel=walkSpeed
      }

      if findTargetX<=48 and tempVal=0 and moveProgress<30
      {
        tempVal=1
        xVel=0
        currentAttack=10
      }

      if moveProgress=30 and tempVal=0
      {
        xVel=0
        if random(10)>=6
          currentAttack=40
        else
        {
          attackDelay=0
          moveProgress=0
          currentAction=30
        }
      }
    }
    else if currentAction>=20 and currentAction<=29 //run toward player
    {
      attackDelay+=1; moveProgress+=1
      if attackDelay=1
      {
        sprite_index=sMetaKnightRun
        if random(10)>=9
        {
          moveProgress=22
          animChange=0
          sprite_index=sMetaKnightJump
          image_index=0
          tempVal=2
          jumpTime=3
          yVel=-4
          y-=4
          if image_xscale=1
            xVel=4
          else
            xVel=-4
        }
      }

      if sprite_index=sMetaKnightRun
      {
        if x>=oPlayer1.x
          xVel=-runSpeed
        else
          xVel=runSpeed
      }
      if findTargetX<=64 and tempVal=0
      {
        tempVal=1
        currentAttack=20
      }

      if moveProgress=22 and tempVal=0
      {
        animChange=0
        sprite_index=sMetaKnightJump
        image_index=0
        tempVal=2
        jumpTime=3
        yVel=-4
        y-=4
        if image_xscale=1
          xVel=4
        else
          xVel=-4
      }
      if tempVal=2
      {
        if findTargetX<16
        {
          tempVal=3
          currentAttack=30
        }
      }
    }
    else if currentAction>=30 and currentAction<=39 //fly up
    {
      attackDelay+=1; moveProgress+=1
      if attackDelay=1 and currentAttack!=40
      {
        sprite_index=sMetaKnightFly
        flyUp=true
        image_index=0
        y-=6
      }

      if sprite_index=sMetaKnightFly and currentAttack!=40
      {
        if moveProgress>=1 and moveProgress<=15
          yVel=-6
        if moveProgress=16
          sprite_index=sMetaKnightFall
      }

      if sprite_index!=sMetaKnightDownStab and currentAttack!=40
      {
        if animChange<1000
        {
          if x>=oPlayer1.x
            xVel=-walkSpeed/2
          else
            xVel=walkSpeed/2

          if moveProgress>=31
          {
            if findTargetX<16
              currentAttack=30
          }
        }
      }
    }
    //========================= attacks =========================
    if currentAttack=10 //standing slash
    {
      if animChange=-1
        animChange=0
      if animChange=0
      {
        sprite_index=sMetaKnightStandSlash
        image_index=0
      }
      if animChange=6
      {
        currentAttack=0
        if extraSwdWave=true
        {
          extraSwdWave=false
          currentAttack=0
          playSound(global.snd_BreakOut,0,1)
          if image_xscale=1
            offsetX=2
          else
            offsetX=-2
          mAttack=instance_create(x+offsetX,y-8,oMetaKSlashes)
          mAttack.type=2
          mAttack.sprite_index=sMetaKARunSlash
          mAttack.physicalPower=physicalPower
          mAttack.image_xscale=image_xscale
          mAttack.decayTime=60
        }
        else
        {
          if image_xscale=1
            offsetX=2
          else
            offsetX=-2
          playSound(global.snd_PlayerAtk[0],0,1)
          mAttack=instance_create(x+offsetX,y-8,oMetaKSlashes)
          mAttack.type=1
          mAttack.physicalPower=physicalPower-10
          mAttack.image_xscale=image_xscale
          mAttack.decayTime=14
          if tempVal=1
            currentAction=0
        }
      }
    }
    else if currentAttack=20 //running slash
    {
      if animChange=-1
        animChange=0
      if animChange=0
      {
        sprite_index=sMetaKnightStandSlash
        image_index=0
      }
      if animChange=6
      {
        currentAttack=0
        if image_xscale=1
          offsetX=2
        else
          offsetX=-2
        playSound(global.snd_PlayerAtk[1],0,1)
        mAttack=instance_create(x+offsetX,y-8,oMetaKSlashes)
        mAttack.type=1
        mAttack.physicalPower=physicalPower-10
        mAttack.sprite_index=sMetaKARunSlash
        mAttack.image_xscale=image_xscale
        mAttack.decayTime=11
        if tempVal=1
          currentAction=0
      }
    }
    else if currentAttack=30 //downward stab
    {
      if animChange=-1
        animChange=0
      if animChange=0
      {
        sprite_index=sMetaKnightDownStab
        playSound(global.snd_RockThrow,0,1)
        xVel=0
        yVel=12
      }

      if yVel=0
      {
        playSound(global.snd_BreakOut,0,1)
        currentAttack=0
        effect=instance_create(x,y,oEffect)
        effect.sprite_index=sGroundSmash
        shockwave=instance_create(x,y,oMetaKStabAir)
        shockwave.spiritPower=spiritPower
        shockwave.direction=0
        shockwave=instance_create(x,y,oMetaKStabAir)
        shockwave.spiritPower=spiritPower
        shockwave.direction=180
        shockwave.image_xscale=-1
        animChange=1000
      }
    }
    else if currentAttack=40 //charge sword
    {
      if animChange=-1
        animChange=0

      var efOffset;
      if image_xscale=1
        efOffset=-26
      else
        efOffset=26
      effect_create_above(ef_star,x+efOffset,y-33,0,c_yellow)
      xVel=0

      if animChange=0
      {
        sprite_index=sMetaKnightCharging
        playSound(global.snd_RockThrow,0,1)
        if random(10)>=6
        {
          effect=instance_create(x,y+2,oEffect)
          effect.sprite_index=sSpellCast
          jumpTime=3
          yVel=-4
          y-=4
        }
      }
      else if animChange=35
      {
        extraSwdWave=true
        tempVal=10
        animChange=0
        sprite_index=sMetaKnightStandSlash
        playSound(global.snd_BreakOut,0,1)
        currentAttack=0
        if image_xscale=1
          offsetX=2
        else
          offsetX=-2
        playSound(global.snd_PlayerAtk[0],0,1)
        mAttack=instance_create(x+offsetX,y-8,oMetaKSlashes)
        mAttack.type=2
        mAttack.sprite_index=sMetaKARunSlash
        mAttack.physicalPower=physicalPower
        mAttack.image_xscale=image_xscale
        mAttack.decayTime=60
      }
    }

    //revert animation to idle/jump after attacking
    //6(frames)*3(steps per frame)
    if sprite_index=sMetaKnightStandSlash and animChange>=18
    {
      if yVel=0
        sprite_index=sMetaKnightIdle
      else
        sprite_index=sMetaKnightIdle
      if tempVal=10
        currentAction=0
      animChange=-1
    }
    else if sprite_index=sMetaKnightRunSlash and animChange>=15
    {
      if yVel=0
        sprite_index=sMetaKnightIdle
      else
        sprite_index=sMetaKnightIdle
      currentAction=0
      animChange=-1
    }
    else if sprite_index=sMetaKnightDownStab and animChange>=1010
    {
      if yVel=0
      {
        sprite_index=sMetaKnightIdle
        if flyUp=true and findTargetX>=160
          currentAttack=40
        else
          currentAction=0
        flyUp=false
      }
      animChange=-1
    }
    else if sprite_index=sMetaKnightJump and animChange>=23
    {
      if yVel=0
      {
        sprite_index=sMetaKnightIdle
        currentAction=0
      }
      else
        sprite_index=sMetaKnightFall
      animChange=-1
    }

    //animation fix while in the air or on the ground while not attacking
    if yVel=0
    {
      if currentAttack=0 and sprite_index=sMetaKnightJump
        sprite_index=sMetaKnightIdle
      if currentAttack=0 and sprite_index=sMetaKnightFall
      {
        sprite_index=sMetaKnightIdle
        if tempVal=2 or tempVal=3
          currentAction=0
        if flyUp=true
          currentAction=0
      }
    }
    //stop momentum on ground
    if sprite_index=sMetaKnightIdle or sprite_index=sMetaKnightStandSlash
    {
      if xVel>0
        xVel-=0.5
      else if xVel<0
        xVel+=0.5

      if xVel<1.1 and xVel>0
        xVel=0
      else if xVel>-1.1 and xVel<0
        xVel=0
    }

    //jumping
    if jumpTime>0
    {
      jumpTime-=1
      if yVel>-7
        yVel-=1
    }

    //check touch damage states
    if sprite_index=sMetaKnightDownStab
      bCanDealDamage=true
    else
      bCanDealDamage=false

    //scripted attacks
    /*if lifePercent<=0.5 and specialAttack=0
      specialAttack=1*/

    //scale difficulty
    if lifePercent<=1 and lifePercent>=0.76 and bossProgress=0
    {
      waitTime-=3
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      waitTime-=3
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
        waitTime-=7
      else
        waitTime-=3
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
        waitTime-=9
      else
        waitTime-=5
      bossProgress+=1
    }
  }
  yVel+=0.3
  if isCollisionBottom(1)
    yVel=0
  if isCollisionLeft(1)
    xVel=1
  if isCollisionRight(1)
    xVel=-1
  moveTo(xVel,yVel)
  enemyStepEvent()
}
#define Collision_oPartSlashes
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0
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
  {
    attackDelay-=stunnedTime
    if attackDelay<2
      attackDelay=2
  }
}
