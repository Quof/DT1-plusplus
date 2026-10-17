#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-38,40,-1)
image_speed=0
y+=1

//Enemy base statistics
eName="Gorades"
maxLife=1020
life=maxLife
expWorth=1600
physicalPower=290
physicalDefense=105
spiritPower=260
spiritDefense=110
FIREresist=-50
WINDresist=-15
EARTHresist=70
baseItemChance=50
dropInd=-10
moneyWorth=130
bInflictPoison=true
if global.difficulty=1
{
  reJumpTime=80
  rockDist=3
  riseBase=3
}
else if global.difficulty=2
{
  reJumpTime=70
  rockDist=4
  riseBase=4
}
else if global.difficulty=3
{
  reJumpTime=60
  rockDist=5
  riseBase=4
}
else if global.difficulty=4
{
  reJumpTime=50
  rockDist=6
  riseBase=5
}
rockRise=riseBase
currentRock=0
jumpTime=reJumpTime-30
difficultyAdjustments(global.difficulty)
setPAttack=physicalPower
combatText="These have the potential to be scary. If you see it open it's mouth, it is ready to pounce. When it slams back to the ground, it causes a set of rocks to appear out of the ground. The rocks will come out of the ground and come back down. Its skin is also poisonous I might add."
sideText="Almost everything in this place is big. Is it to make it all seem more intimidating? Something I noticed here and with almost everywhere. A single opponent isn't too bad to fight, it seems to be their combined effort that presents a problem."
cripplePointText=">Thrust Attack#>Downward Strike"
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
    //stat changes
    if yVel>0
      physicalPower=round(setPAttack*1.2)
    else
      physicalPower=setPAttack

    if jumpTime<reJumpTime-15 and jumpTime>6
    {
      image_index=0
      if x>oCharacter.x
        image_xscale=-1
      else
        image_xscale=1
    }
    else
      image_index=1

    //jump
    if jumpTime<reJumpTime+5
      //jumpTime+=1
      jumpTime+=gDeltaTime //60fps change: counts 30fps ticks
    if jumpTime>=reJumpTime
    {
      //if jumpTime=reJumpTime
      if scrCountPass(jumpTime,reJumpTime) //60fps change: once, when the count reaches it
      {
        sprite_index=sGoradesJump
        y-=4
        yVel=-9.5
        if image_xscale=1
          xVel=4
        else
          xVel=-4
        xOffset=38
      }
    }

    //yVel+=0.65
    yVel=scrGravAcc(yVel,0.65,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionBottom(1)
    {
      yVel=0
      if jumpTime>=reJumpTime+4 and jumpTime<10000
      {
        xVel=0
        jumpTime=10000
        playSound(global.snd_JumpStrike,0,1)
        sprite_index=sGoradesWait
      }
    }
    //if isCollisionLeft(1)
    //  xVel*=-1
    //if isCollisionRight(1)
    //  xVel*=-1
    //60fps change: only turn around when moving into the wall (it can still touch it on the next frame above 30fps)
    if isCollisionLeftEdit(1)
      xVel*=-1
    if isCollisionRightEdit(1)
      xVel*=-1
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick

    if y>room_height+30
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
    }
  }

  if jumpTime>=10000 //ground hit
  {
    //jumpTime+=1
    jumpTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if jumpTime mod 6=0
    if scrModPass(jumpTime,6) //60fps change: once each time the count reaches a multiple of it
    {
      for(i=0;i<2;i+=1)
      {
        newAttack=instance_create(x+xOffset,y-8,oShotzoBullet)
        newAttack.sprite_index=sSpellRockSmash
        newAttack.damageType="SPIRIT"
        newAttack.spiritPower=spiritPower
        newAttack.elementType=4
        newAttack.image_xscale=0.8
        newAttack.image_yscale=0.8
        newAttack.image_blend=c_gray
        newAttack.yVel=-rockRise
        newAttack.grav=0.4
        xOffset*=-1
      }
      xOffset+=16
      rockRise+=1
      currentRock+=1
      if currentRock>=rockDist
      {
        currentRock=0
        rockRise=riseBase
        jumpTime=0
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_V_SLASH
    inflictStatus(0)
}
