#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-8,-32,8,-1)
image_speed=0
bCanTakeDamage=false
bActive=true

//Enemy base statistics
eName="Omega Metroid"
maxLife=10000
life=maxLife
expWorth=0
physicalPower=600
physicalDefense=200
spiritPower=400
spiritDefense=250
bossProgress=0
progressTime=0
jumpTime=0
samusAppears=0

difficultyAdjustments(global.difficulty)
combatText="It is immune to all of your attacks, just try to run from it. Do your best to avoid taking damage from this thing, it has massive power. I would get rid of it, but Hex seems to be locking that out. Must be some last ditch effort of his."
sideText="It's the Omega Metroid from Metroid Fusion.#Ugh, why can't Hex just stop. If I can just find a way to remove him from this place, or send him somewhere else. The Darkness could handle him once we have this whole ordeal over with."
cripplePointText=">None"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bActive=true and dieFade=0
  {
    if bossProgress=0 //fall into room
    {
      if y<304
        //y+=12
        y+=12*gDeltaTime //60fps change: per 30fps tick
      else
      {
        playSound(global.snd_BreakOut,0,1)
        effect=instance_create(x,y,oEffect)
        effect.sprite_index=sGroundDust
        effect.image_xscale=2.5
        effect.image_yscale=1.5
        effect.image_speed=0.45
        effect.image_alpha=0.75
        bossProgress+=1
      }
    }
    else if bossProgress=1 //roar
    {
      //progressTime+=1
      progressTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if progressTime=30
      if scrCountPass(progressTime,30) //60fps change: once, when the count reaches it
        sprite_index=sOmegaMetroidRoar1
      //else if progressTime=40
      else if scrCountPass(progressTime,40) //60fps change: once, when the count reaches it
        image_index=1
      //else if progressTime=50
      else if scrCountPass(progressTime,50) //60fps change: once, when the count reaches it
      {
        sprite_index=sOmegaMetroidRoar2
        image_index=0
        image_speed=0.66
        playSound(global.snd_EnemyRoar2,0,1)
      }
      //else if progressTime=100
      else if scrCountPass(progressTime,100) //60fps change: once, when the count reaches it
      {
        sprite_index=sOmegaMetroidIdle
        image_speed=0.13
      }
      //else if progressTime=140
      else if scrCountPass(progressTime,140) //60fps change: once, when the count reaches it
        bossProgress+=1
    }
    else if bossProgress=2 //normal behavior
    {
      if jumpTime=0
      {
        if x>oCharacter.x
          image_xscale=-1
        else
          image_xscale=1
        distPlayer=point_distance(x,0,oPlayer1.x,0)
        if distPlayer<=48 //--------------- close to player: stop ---------------
        {
          sprite_index=sOmegaMetroidIdle
          image_speed=0.13
          if isCollisionBottom(1)
            xVel=0
        }
        else if distPlayer>49 and distPlayer<287 //--------------- away from player: walk ---------------
        {
          sprite_index=sOmegaMetroidWalk
          image_speed=0.16
          if image_xscale=1 //walk right
            xVel=2.8
          else //walk left
            xVel=-2.8
        }
        else if distPlayer>=288 //--------------- far from player: jump ---------------
          jumpTime=1

        if x>=3040 //--------------- gets to the end ---------------
          jumpTime=1
      }
      else if jumpTime>=1
      {
        //jumpTime+=1
        jumpTime+=gDeltaTime //60fps change: counts 30fps ticks
        //if jumpTime=2
        if scrCountPass(jumpTime,2) //60fps change: once, when the count reaches it
        {
          xVel=0
          sprite_index=sOmegaMetroidRoar1
        }
        //else if jumpTime=12
        else if scrCountPass(jumpTime,12) //60fps change: once, when the count reaches it
          image_index=1
        //else if jumpTime=22
        else if scrCountPass(jumpTime,22) //60fps change: once, when the count reaches it
        {
          sprite_index=sOmegaMetroidRoar2
          image_index=0
          image_speed=0.66
          playSound(global.snd_EnemyRoar2,0,1)
        }
        //else if jumpTime=72
        else if scrCountPass(jumpTime,72) //60fps change: once, when the count reaches it
        {
          sprite_index=sOmegaMetroidRoar1
          image_index=0
          image_speed=0
        }
        //else if jumpTime=82
        else if scrCountPass(jumpTime,82) //60fps change: once, when the count reaches it
        {
          sprite_index=sOmegaMetroidJump
          y-=4
          yVel=-9
          if image_xscale=1 //walk right
            xVel=11
          else //walk left
            xVel=-11
        }
      }

      //yVel+=0.4
      yVel=scrGravAcc(yVel,0.4,1) //60fps change: gravity per 30fps tick, following the 30fps arc
      if isCollisionBottom(1)
      {
        yVel=0
        if sprite_index=sOmegaMetroidJump
        {
          sprite_index=sOmegaMetroidIdle
          image_speed=0.13
          jumpTime=0
        }
      }
      if isCollisionLeft(1)
        xVel=0
      if isCollisionRight(1)
        xVel=0
      if isCollisionSolid()
        y-=2

      //moveTo(xVel,yVel)
      moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    }
  }

  if samusAppears=0 //-------------------- Samus appears --------------------
  {
    if x>=3184
    {
      effect=instance_create(3648,y-52,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.newBlend=1
      npcSamus=instance_create(3648,y-52,oMisc)
      npcSamus.sprite_index=sSamusShineSparkSide
      npcSamus.image_xscale=-1
      npcSamus.image_speed=0
      npcSamus.type=3
      samusAppears+=1
    }
  }
  else if samusAppears=1
  {
    //npcSamus.x-=16
    npcSamus.x-=16*gDeltaTime //60fps change: per 30fps tick
    if y-52>=npcSamus.y
      //npcSamus.y+=2
      npcSamus.y+=2*gDeltaTime //60fps change: per 30fps tick
    else
      //npcSamus.y-=2
      npcSamus.y-=2*gDeltaTime //60fps change: per 30fps tick

    if x>npcSamus.x
    {
      playSound(global.snd_EnemyRoar2,0,1)
      effect=instance_create(x,y-52,oEffect)
      effect.sprite_index=sMetroidExp3
      effect.image_speed=0.5
      effect.image_xscale=3
      effect.image_yscale=3
      with npcSamus
        instance_destroy()
      with oEventBarrier
        instance_destroy()
      instance_destroy()
    }
  }
  enemyStepEvent()
}
#define Collision_oSolidOMDestroy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect=instance_create(other.x+8,other.y+8,oEffect)
effect.image_speed=0.5
effect.image_xscale=0.8
effect.image_yscale=0.8
effect.sprite_index=sMetroidExp2
playSound(global.snd_MetroidBomb,0,0.75)
with other
  instance_destroy()
