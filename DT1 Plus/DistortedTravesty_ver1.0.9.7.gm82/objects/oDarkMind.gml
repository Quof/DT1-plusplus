#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-35,40,35)
image_speed=0.15
image_xscale=-1

//Enemy base statistics
eName="Dark Mind"
maxLife=6500
life=maxLife
expWorth=2000
physicalPower=180
physicalDefense=45
spiritPower=200
spiritDefense=50
FIREresist=-10
WINDresist=-40
EARTHresist=10
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
activateBoss=0
currentAttack=0
attackDelay=0
ballThrow=0
specialAttack=0
if global.difficulty=1
{
  waitTime=40
  ballDelay=30
  tossDelay=10
}
else if global.difficulty=2
{
  waitTime=35
  ballDelay=20
  tossDelay=8
}
else if global.difficulty=3
{
  waitTime=30
  ballDelay=10
  tossDelay=6
}
else if global.difficulty=4
{
  waitTime=25
  ballDelay=7
  tossDelay=5
}
bossProgress=0
difficultyAdjustments(global.difficulty)
setPDefense=physicalDefense
setSDefense=spiritDefense
cripplePointText=">Fireball while Angered"

xCenter=408
yGround=304
roomSpan=216
teleportProgress=0
teleportTimer=0
timeTillTeleport=90
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
    combatText="This is quite an opponent you've got here. The original is made of pure darkness, now it's combined with some other form of dark energy. The best way to learn to fight your opponent is to be observant. Try to stay away from the Dark Vortex it sends out. When it closes it's arms, it's defenses go way up, however if you use a fireball on it when it looks angered, you can cripple it. I'm also detecting a weakness to Wind."
    sideText="I don't know what this dark entity is that we've been seeing. Maybe a symbiote of some sort, but that doesn't seem to be it though. I need to further analyze what it is that this is. Keep fighting, you can bring this thing down, you've been through worse."
    activateBoss=2
  }
  if sprite_index=sDarkMindIdle
  {
    physicalDefense=setPDefense*5
    spiritDefense=setSDefense*5
  }
  else
  {
    physicalDefense=setPDefense
    spiritDefense=setSDefense
  }
  if sprite_index=sDarkMindAnger
  {
    background_vspeed[0]=12
    background_hspeed[0]=-9
  }
  else
  {
    background_vspeed[0]=1
    background_hspeed[0]=-1
  }
  if bActive=true and dieFade=0
  {
    if teleportProgress=0
    {
      if currentAttack!=2
      {
        if currentAttack!=3
        {
          if x>oCharacter.x
            image_xscale=-1
          else
            image_xscale=1
        }
      }

      //attackDelay+=1
      attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if attackDelay>=waitTime
      {
        if currentAttack=0 //throw Dark Ball toward player
        {
          if ballThrow=0
            sprite_index=sDarkMindArmsUp
          //ballThrow+=1
          ballThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if ballThrow=10+ballDelay
          if scrCountPass(ballThrow,10+ballDelay) //60fps change: once, when the count reaches it
          {
            effect_create_above(ef_ring,x-39,y-13,0,c_black)
            effect_create_above(ef_ring,x+34,y-2,0,c_black)
          }
          //if ballThrow=10+ballDelay*3
          if scrCountPass(ballThrow,10+ballDelay*3) //60fps change: once, when the count reaches it
          {
            ballAttack[0]=instance_create(x-39,y-39,oDMDarkBall)
            ballAttack[0].spiritPower=spiritPower
            ballAttack[0].type=1
            ballAttack[1]=instance_create(x+34,y-2,oDMDarkBall)
            ballAttack[1].spiritPower=spiritPower
            ballAttack[1].type=1
            sprite_index=sDarkMindAnger
          }
          //if ballThrow=10+ballDelay*4
          if scrCountPass(ballThrow,10+ballDelay*4) //60fps change: once, when the count reaches it
          {
            attackDelay=0
            sprite_index=sDarkMindIdle
            ballThrow=0
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=1 //throw Dark Ball that spiral
        {
          if ballThrow=0
            sprite_index=sDarkMindArmsUp
          //ballThrow+=1
          ballThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if ballThrow=10+ballDelay
          if scrCountPass(ballThrow,10+ballDelay) //60fps change: once, when the count reaches it
          {
            effect_create_above(ef_ring,x-39,y-13,0,c_black)
            effect_create_above(ef_ring,x+34,y-2,0,c_black)
          }
          //if ballThrow=10+ballDelay*4
          if scrCountPass(ballThrow,10+ballDelay*4) //60fps change: once, when the count reaches it
          {
            ballAttack[0]=instance_create(x-39,y-39,oDMDarkBall)
            ballAttack[0].spiritPower=spiritPower
            ballAttack[0].type=2
            ballAttack[1]=instance_create(x+34,y-2,oDMDarkBall)
            ballAttack[1].spiritPower=spiritPower
            ballAttack[1].type=3
            sprite_index=sDarkMindAnger
          }
          //if ballThrow=10+ballDelay*5
          if scrCountPass(ballThrow,10+ballDelay*5) //60fps change: once, when the count reaches it
          {
            attackDelay=0
            sprite_index=sDarkMindIdle
            ballThrow=0
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=2 //throw Dark Ball that bounce
        {
          if ballThrow=0
            sprite_index=sDarkMindArmsUp
          //ballThrow+=1
          ballThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if ballThrow=10+ballDelay
          if scrCountPass(ballThrow,10+ballDelay) //60fps change: once, when the count reaches it
          {
            effect_create_above(ef_ring,x,y,0,c_black)
            effect_create_above(ef_ring,x,y,1,c_black)
          }
          //if ballThrow=10+ballDelay*3
          if scrCountPass(ballThrow,10+ballDelay*3) //60fps change: once, when the count reaches it
          {
            dir=0
            for (i=0;i<4;i+=1)
            {
              ballAttack[i]=instance_create(x,y,oDMDarkBall)
              ballAttack[i].spiritPower=spiritPower
              ballAttack[i].type=4
              ballAttack[i].dir=dir
              dir+=1
            }
            sprite_index=sDarkMindAnger
          }
          //if ballThrow=10+ballDelay*4
          if scrCountPass(ballThrow,10+ballDelay*4) //60fps change: once, when the count reaches it
          {
            attackDelay=0
            sprite_index=sDarkMindIdle
            ballThrow=0
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=3 //speed across room and throw Dark Ball down
        {
          if ballThrow=0
          {
            tossDownDelay=0
            sprite_index=sDarkMindArmsUp
            if x>xCenter
            {
              slideAttackX=-8
              image_xscale=-1
            }
            else
            {
              slideAttackX=8
              image_xscale=1
            }
          }
          //ballThrow+=1
          ballThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if ballThrow=10+ballDelay
          if scrCountPass(ballThrow,10+ballDelay) //60fps change: once, when the count reaches it
          {
            effect_create_above(ef_ring,x,y,0,c_black)
            effect_create_above(ef_ring,x,y,1,c_black)
          }
          //if ballThrow=29+ballDelay
          if scrCountPass(ballThrow,29+ballDelay) //60fps change: once, when the count reaches it
            sprite_index=sDarkMindAnger
          //if ballThrow>=30+ballDelay
          if ballThrow>29+ballDelay //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          {
            //x+=slideAttackX
            x+=slideAttackX*gDeltaTime //60fps change: per 30fps tick
            if tossDownDelay<=0
            {
              ballAttack=instance_create(x,y,oDMDarkBall)
              ballAttack.spiritPower=spiritPower
              ballAttack.type=5
              //ballAttack.direction=270
              ballAttack._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
              //tossDownDelay=tossDelay
              //60fps change: counts down 30fps ticks; the frame that drops the ball counts as a whole tick, as at
              //30fps (it doesn't count down), so the count starts that much lower (tossDelay at 30fps)
              tossDownDelay=tossDelay+1-gDeltaTime
            }
            else
              //tossDownDelay-=1
              tossDownDelay-=gDeltaTime //60fps change: see above
          }
          //if ballThrow=70+ballDelay
          if scrCountPass(ballThrow,70+ballDelay) //60fps change: once, when the count reaches it
          {
            attackDelay=0
            sprite_index=sDarkMindIdle
            ballThrow=0
            teleportTimer=timeTillTeleport
          }
        }
        else if currentAttack=4 //use Dark Vortex
        {
          if ballThrow=0
            sprite_index=sDarkMindAnger
          //ballThrow+=1
          ballThrow+=gDeltaTime //60fps change: counts 30fps ticks
          //if ballThrow=15+ballDelay
          if scrCountPass(ballThrow,15+ballDelay) //60fps change: once, when the count reaches it
          {
            vortexAttack=instance_create(x,y,oDMDarkVortex)
            vortexAttack.spiritPower=spiritPower*1.5
          }
          //if ballThrow=30+ballDelay
          if scrCountPass(ballThrow,30+ballDelay) //60fps change: once, when the count reaches it
          {
            attackDelay=0
            sprite_index=sDarkMindIdle
            ballThrow=0
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
      }
    }
    else if teleportProgress=1 //teleport away
    {
      image_blend=make_color_rgb(30,30,30)
      //image_yscale-=0.1
      image_yscale-=0.1*gDeltaTime //60fps change: per 30fps tick
      //if teleportTimer=1
      if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
        playSound(global.snd_Teleport,0,1)
      if teleportTimer>=10 //choose new location
      {
        image_yscale=0.01
        visible=false
        if specialAttack=1
        {
          currentAttack=4
          specialAttack+=1
        }
        else
        {
          //0: To player, 1: Spiral, 2:Bounce, 3: Across room
          if currentAttack=1
            currentAttack=choose(0,2,3)
          else if currentAttack=2
            currentAttack=choose(0,2,3)
          else if currentAttack=3
            currentAttack=0
          else
            currentAttack=choose(0,1,2,3)
        }
        //find x teleport spot
        teleStartX=xCenter-(roomSpan-8)
        teleStartX+=random((roomSpan-8)*2)
        x=teleStartX
        //find y teleport spot
        upliftY=100-(64*lifePercent)
        ranUpliftY=random(upliftY)
        y=yGround-32-ranUpliftY
        if currentAttack=3
        {
          if round(random(4))>=2
            x=xCenter+(roomSpan/1.5)
          else
            x=xCenter-(roomSpan/1.5)
          y-=32
        }
        else if currentAttack=4
        {
          y=yGround-156
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
      //image_yscale+=0.05
      image_yscale+=0.05*gDeltaTime //60fps change: per 30fps tick
      //if teleportTimer=1
      if scrCountPass(teleportTimer,1) //60fps change: once, when the count reaches it
      {
        visible=true
        playSound(global.snd_Teleport,0,1)
      }
      if teleportTimer>=10
      {
        image_blend=c_white
        image_yscale=1
        bCanTakeDamage=true
        teleportProgress=0
      }
      else
        //teleportTimer+=1
        teleportTimer+=gDeltaTime //60fps change: counts 30fps ticks
    }
    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      waitTime-=1
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      waitTime-=1
      tossDelay-=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
        waitTime-=2
      else
        waitTime-=1
      tossDelay-=2
      specialAttack+=1
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
        waitTime-=2
      else
        waitTime-=1
      tossDelay-=1
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
if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL" and sprite_index=sDarkMindAnger
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
