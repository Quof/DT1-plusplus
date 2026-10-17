#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-12,-12,12,24)
baseColor=make_color_rgb(200,200,255)
image_blend=baseColor
y-=8

//Enemy base statistics
eName="Data Bomb Launcher"
maxLife=1600
life=maxLife
expWorth=3800
physicalPower=540
physicalDefense=260
spiritPower=300
spiritDefense=280
FIREresist=25
WATERresist=-75
WINDresist=100
EARTHresist=50
skillResist=15
baseItemChance=75
dropInd=-20
moneyWorth=210
dieEffect=100001
dieSound=global.snd_CASdie
bCanDealDamage=false
if global.difficulty=1
  reShootTime=135
else if global.difficulty=2
  reShootTime=125
else if global.difficulty=3
  reShootTime=115
else if global.difficulty=4
  reShootTime=105
shootTime=reShootTime-30
maxShootDist=10
multishot=0
shotAmt=0
difficultyAdjustments(global.difficulty)
combatText="The Immobile Bomb Launcher. It's job is to limit the target's movement and air space. It supports the aerial units mostly. The only primary function is to fire 3 large Data Bombs. One is aimed directly at you while the other two are set to pin you."
sideText="If you get too close to the Static Sentry, it will fire off 5 Data Bombs in succession around you. If you're too close to the Aerial Sentry, it will do the same thing except it will fire twice as many, meaning 10 Data Bombs in your area. I suggest getting out of the bombing zone or getting some way of shielding that."
cripplePointText=">Jump Attack#>Any Physical Attack"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    if x>oCharacter.x
      image_angle=findTargetX/8+90
    else
      image_angle=-findTargetX/8+90

    //shootTime+=1
    shootTime+=gDeltaTime //60fps change: counts 30fps ticks
    if shootTime>=reShootTime //fire toward player
    {
      if x>oCharacter.x
        offsetShotX=-1
      else
        offsetShotX=1
      playSound(global.snd_GASlaunch,0,0.88)

      if multishot=0
      {
        var idCheck;
        idCheck=instance_nearest(x,y,oStaticSentry)
        if instance_exists(idCheck)
        {
          if point_distance(oPlayer1.x,0,idCheck.x,0)<80
            multishot=1
        }
        var idCheck;
        idCheck=instance_nearest(x,y,oAerialSentry)
        if instance_exists(idCheck)
        {
          if point_distance(oPlayer1.x,0,idCheck.x,0)<80
            multishot=2
        }
      }

      if multishot=0
      {
        newAttack=instance_create(x+offsetShotX,y,oGASGrenade)
        newAttack.sprite_index=sDataBombLauncherGrenade
        newAttack.physicalPower=physicalPower
        newAttack.yVel=-5.75
        //find arc
        tempDist=findTargetX
        tempDist/=64
        if tempDist>maxShootDist
          tempDist=maxShootDist
        newAttack.xVel=tempDist
        if x>oCharacter.x
          newAttack.xVel*=-1
        newAttack=instance_create(x+offsetShotX,y,oGASGrenade)
        newAttack.sprite_index=sDataBombLauncherGrenade
        newAttack.physicalPower=physicalPower
        newAttack.yVel=-5.75
        newAttack.xVel=tempDist+0.5
        if x>oCharacter.x
          newAttack.xVel*=-1
        newAttack=instance_create(x+offsetShotX,y,oGASGrenade)
        newAttack.sprite_index=sDataBombLauncherGrenade
        newAttack.physicalPower=physicalPower
        newAttack.yVel=-5.75
        newAttack.xVel=tempDist-0.5
        if x>oCharacter.x
          newAttack.xVel*=-1
        shootTime=0
      }
      else if multishot=1 //close to Static Sentry
      {
        //if shootTime mod 3=0
        if scrModPass(shootTime,3) //60fps change: once each time the count reaches a multiple of it
        {
          shotAmt+=1
          if shotAmt=1
          {
            tempDist=findTargetX
            tempDist/=64
            if tempDist>maxShootDist
              tempDist=maxShootDist

            tempDist-=2.5
            reverse=0
            if x>oCharacter.x
              reverse=1
          }

          newAttack=instance_create(x+offsetShotX,y,oGASGrenade)
          newAttack.sprite_index=sDataBombLauncherGrenade
          newAttack.physicalPower=physicalPower
          newAttack.yVel=-5.75
          newAttack.xVel=tempDist
          if reverse=1
            newAttack.xVel*=-1
          tempDist+=1.25

          if shotAmt=5
          {
            multishot=0
            shotAmt=0
            shootTime=0
          }
        }
      }
      else if multishot=2 //close to Aerial Sentry
      {
        //if shootTime mod 3=0
        if scrModPass(shootTime,3) //60fps change: once each time the count reaches a multiple of it
        {
          shotAmt+=1
          if shotAmt=1
          {
            tempDist=findTargetX
            tempDist/=64
            if tempDist>maxShootDist
              tempDist=maxShootDist

            tempDist-=2.5
            shiftAmt=1.3
            reverse=0
            if x>oCharacter.x
              reverse=1
          }

          newAttack=instance_create(x+offsetShotX,y,oGASGrenade)
          newAttack.sprite_index=sDataBombLauncherGrenade
          newAttack.physicalPower=physicalPower
          newAttack.yVel=-5.75
          newAttack.xVel=tempDist
          if reverse=1
            newAttack.xVel*=-1
          tempDist+=shiftAmt

          if shotAmt mod 5=0
            shiftAmt*=-1.05
          if shotAmt=10
          {
            multishot=0
            shotAmt=0
            shootTime=0
          }
        }
      }
    }

    //yVel+=0.2
    yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
      yVel=0
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    if isCollisionSolid()
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+30
      instance_destroy()
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
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_JUMP_SLASH_2
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
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
event_inherited()
draw_sprite(sDataBombLauncherStand,-1,x,y+24)
