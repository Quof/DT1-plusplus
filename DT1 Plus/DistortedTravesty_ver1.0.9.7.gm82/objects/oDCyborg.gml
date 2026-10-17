#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-23,13,-1)
image_speed=0.2
image_xscale=-1

//Enemy base statistics
eName="Displaced Cyborg"
maxLife=4400
life=maxLife
expWorth=700
physicalPower=170
physicalDefense=35
spiritPower=170
FIREresist=-30
WATERresist=-10
WINDresist=10
EARTHresist=30
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
attackDelay=0
if global.difficulty=1
{
  rockFixed=1
  waitTime=35
}
else if global.difficulty=2
{
  rockFixed=2
  waitTime=30
}
else if global.difficulty=3
{
  rockFixed=3
  waitTime=25
}
else if global.difficulty=4
{
  rockFixed=5
  waitTime=15
}
specialRockAttack=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Fireball"

teleportProgress=0
teleportTimer=0
timeTillTeleport=90
//teleport spots
xTele[0]=192
xTele[1]=352
xTele[2]=512
xTele[3]=272
xTele[4]=432
yTele[0]=240
yTele[1]=304
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
    combatText="Wow, simply wow. This thing uses some nifty technology. It can call up what appears to be rocks, though the truth is that they have magnetic properties which explains it's ability to control them. It also utilizes displacement technology in order to appear to be teleporting around the room. Due to some mechanical failures, this thing has a weakness to water and especially fire."
    sideText="I'm not really sure why they made this thing. I mean, it does utilitize some decent technology, but still, I can think of better ways to use it. Oh well, I'm glad you're going to go kick the CEO's ass now for the failure they have presented before us."
    activateBoss=2
  }
  if sprite_index=sNeteryuArmOut
    bCanDealDamage=true
  else
    bCanDealDamage=false
  if bActive=true and dieFade=0
  {
    if teleportProgress=0
    {
      if currentAttack!=2
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
      }

      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if attackDelay>=waitTime
      {
        if currentAttack=0 //normal rock throw
        {
          //if attackDelay=waitTime
          if scrCountPass(attackDelay,waitTime) //60fps change: once, when the count reaches it
          {
            sprite_index=sNeteryuArmRaise
            image_index=0
            rockAmount=round(random(2)+rockFixed)
            rockThrow=0
          }
          if image_index=1
            image_speed=0
          //rockThrow+=1
          rockThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if rockThrow=10
          if scrCountPass(rockThrow,10) //60fps change: once, when the count reaches it
          {
            for (i=0;i<rockAmount;i+=1)
            {
              rockAttack[rockAmount]=instance_create(x-48+random(96),y+random(96),oNetRock)
              rockAttack[rockAmount].spiritPower=spiritPower
              rockAttack[rockAmount].throwDelay=(i*7)+20
            }
          }
          //if rockThrow=50
          if scrCountPass(rockThrow,50) //60fps change: once, when the count reaches it
            sprite_index=sNeteryuArmOut
          //if rockThrow=85
          if rockThrow>=85 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
          {
            attackDelay=0
            image_speed=0.2
            sprite_index=sNeteryuIdle
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=1 //big rock
        {
          //if attackDelay=waitTime
          if scrCountPass(attackDelay,waitTime) //60fps change: once, when the count reaches it
            sprite_index=sNeteryuArmIn
          //else if attackDelay=waitTime+20
          else if scrCountPass(attackDelay,waitTime+20) //60fps change: once, when the count reaches it
          {
            sprite_index=sNeteryuArmOut
            bigRockAttack=instance_create(x,y-128,oNetBigRock)
            bigRockAttack.spiritPower=spiritPower+50
            bigRockAttack.xVel=2
            bigRockAttack=instance_create(x,y-128,oNetBigRock)
            bigRockAttack.spiritPower=spiritPower+50
            bigRockAttack.xVel=-2
          }
          //else if attackDelay=waitTime+45
          else if attackDelay>=waitTime+45 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
          {
            attackDelay=0
            sprite_index=sNeteryuIdle
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=2 //special rock throw
        {
          //if attackDelay=waitTime
          if scrCountPass(attackDelay,waitTime) //60fps change: once, when the count reaches it
          {
            sprite_index=sNeteryuArmIn
            centerY=y+52
            delayBase=27
            sRockAttack=instance_create(x+48,centerY+16,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x+64,centerY,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x+48,centerY-16,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x+16,centerY-48,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x,centerY-64,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x-16,centerY-48,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x-48,centerY-16,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x-64,centerY,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x-48,centerY+16,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x-16,centerY+48,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x,centerY+64,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
            sRockAttack=instance_create(x+16,centerY+48,oNetRock)
            sRockAttack.spiritPower=spiritPower
            sRockAttack.throwDelay=delayBase
            delayBase+=7
          }
          //else if attackDelay=waitTime+115
          else if attackDelay>=waitTime+115 //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
          {
            bigRockAttack=instance_create(x,y,oNetBigRock)
            bigRockAttack.spiritPower=spiritPower+50
            bigRockAttack.xVel=2
            bigRockAttack=instance_create(x,y,oNetBigRock)
            bigRockAttack.spiritPower=spiritPower+50
            bigRockAttack.xVel=-2
            attackDelay=0
            sprite_index=sNeteryuIdle
            teleportTimer=timeTillTeleport
          }
        }
      }

      if teleportTimer>=timeTillTeleport
      {
        bCanTakeDamage=false
        //teleportTimer=0
        teleportTimer=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        teleportProgress=1
        //spike attack
        spikeAttack=instance_create(random(448)+128,64,oNetSpike)
        spikeAttack.spiritPower=spiritPower
        spikeAttack.amount=rockFixed
      }
      else
        teleportTimer+=0 //1 (do not use)
    }
    else if teleportProgress=1 //teleport away
    {
      //if image_xscale>0
      //  image_xscale-=0.025
      //else
      //  image_xscale+=0.025
      //image_yscale+=0.15
      //60fps change: per 30fps tick
      if image_xscale>0
        image_xscale-=0.025*gDeltaTime
      else
        image_xscale+=0.025*gDeltaTime
      image_yscale+=0.15*gDeltaTime

      //if teleportTimer=1
      if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
        playSound(global.snd_Teleport,0,1)
      if teleportTimer>=40 //choose new location
      {
        image_xscale=0
        if specialRockAttack=1 or specialRockAttack=3
        {
          currentAttack=2
          x=352
          y=176
          specialRockAttack+=1
        }
        else
        {
          currentAttack=round(random(1))
          xTeleSpot=round(random(4))
          x=xTele[xTeleSpot]
          y=yTele[currentAttack]
        }
        //teleportTimer=0
        teleportTimer=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        teleportProgress=2
      }
      else
        //teleportTimer+=1
        teleportTimer+=gDeltaTime //60fps change: see above
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
        teleportTimer+=gDeltaTime //60fps change: see above
    }
    else if teleportProgress=3 //teleport in
    {
      //image_xscale+=0.025
      //image_yscale-=0.15
      image_xscale+=0.025*gDeltaTime //60fps change: per 30fps tick
      image_yscale-=0.15*gDeltaTime //60fps change: per 30fps tick

      //if teleportTimer=1
      if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
        playSound(global.snd_Teleport,0,1)
      if teleportTimer>=40
      {
        image_xscale=1
        image_yscale=1
        bCanTakeDamage=true
        teleportProgress=0
      }
      else
        //teleportTimer+=1
        teleportTimer+=gDeltaTime //60fps change: counts 30fps ticks
    }
    //scripted attacks
    if lifePercent<=0.66 and specialRockAttack=0
      specialRockAttack+=1
    else if lifePercent<=0.33 and specialRockAttack=2
      specialRockAttack+=1
    //scale difficulty
    if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=0
    {
      rockFixed+=1
      waitTime-=2
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=1
    {
      if global.difficulty>=3
      {
        rockFixed+=2
        waitTime-=2
      }
      else
      {
        rockFixed+=1
        waitTime-=1
      }
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=2
    {
      rockFixed+=1
      waitTime-=1
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
if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL"
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
    attackDelay-=round((stunnedTime/1.25))
}
