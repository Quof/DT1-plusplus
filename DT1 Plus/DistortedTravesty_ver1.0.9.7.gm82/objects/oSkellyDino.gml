#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=1
makeActive()
setCollisionBounds(-24,-38,24,-1)
image_speed=0.1

//Enemy base statistics
eName="Skelly Dino"
maxLife=700
life=maxLife
expWorth=410
physicalPower=210
physicalDefense=60
spiritDefense=70
FIREresist=-25
WATERresist=-50
WINDresist=50
EARTHresist=25
skillResist=5
baseItemChance=70
dropInd=-5
moneyWorth=52
attackTime=0
bAttacking=false
attacking=0
jumpAttackTime=0
if global.difficulty=1
{
  runAcc=1.7
  attackDelay=90
}
else if global.difficulty=2
{
  runAcc=2
  attackDelay=70
}
else if global.difficulty=3
{
  runAcc=2.3
  attackDelay=50
}
else if global.difficulty=4
{
  runAcc=2.6
  attackDelay=30
}
difficultyAdjustments(global.difficulty)
combatText="These are either going to be very annoying or very easy. I suggest that if you see a group of them, to use your Fire Pillar, it'll get rid of them all easily. When you get close, it will swing it's sword at you. Nothing special in that regard."
sideText="Did the animation budget suddenly get low or something? Everything in here is so lame as far as animation goes. Seriously, take a closer look!"
cripplePointText=">Fireball#>Thrust Attack"
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
    if bAttacking=false and jumpAttackTime<500
    {
      if x>oCharacter.x
      {
        image_xscale=-1
        xVel=-runAcc
      }
      else
      {
        image_xscale=1
        xVel=runAcc
      }
    }
    if attackTime<attackDelay
      //jumpAttackTime+=1
      jumpAttackTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if jumpAttackTime=30
    if jumpAttackTime>=30 and jumpAttackTime<500 //60fps change: the same as =30 in whole ticks (it's reset or set to 1000 there), and still happens if the frame rate changes mid-count
    {
      if random(200)-findTargetX>=60
      {
        jumpAttackTime=1000
        sprite_index=sSkellyDinoSwing
        image_speed=0
        image_index=0
        xVel=0
        y-=8
        yVel=-6
      }
      else
      {
        jumpAttackTime=0
      }
    }

    //attackTime+=1
    attackTime+=gDeltaTime //60fps change: counts 30fps ticks
    if attackTime>=attackDelay and findTargetX<=48 and findTargetY<=72 and bAttacking=false and jumpAttackTime<500
    {
      image_speed=0.15
      sprite_index=sSkellyDinoSwing
      xVel=0
      physicalPower+=20
      bAttacking=true
    }
    if bAttacking=true
    {
      //attacking+=1
      attacking+=gDeltaTime //60fps change: counts 30fps ticks
      if attacking>=15
      {
        image_speed=0.1
        sprite_index=sSkellyDinoWalk
        attacking=0
        physicalPower-=20
        attackTime=0
        bAttacking=false
      }
    }
    //yVel+=0.2
    //if yVel>=0 and jumpAttackTime>=1000
    //{
    //  yVel+=1.2
    //  image_index=2
    //}
    //60fps change: gravity per 30fps tick, following the 30fps arc (one scrGravAcc a frame, so both parts together;
    //the extra 1.2 when falling in the jump attack is decided on the speed after the 0.2, as before)
    var tGrav;
    tGrav=0.2
    if yVel+0.2>=0 and jumpAttackTime>=1000
    {
      tGrav+=1.2
      image_index=2
    }
    yVel=scrGravAcc(yVel,tGrav,1)
    if isCollisionBottom(1)
    {
      yVel=0
      if jumpAttackTime>=1000
      {
        jumpAttackTime=-15
        groundHit=instance_create(x,y,oGASGExplosion)
        groundHit.physicalPower=physicalPower+10
        groundHit.sprite_index=sPartisanJumpSlash
        groundHit.image_xscale=2
        groundHit.image_yscale=1.5
        groundHit.image_speed=0.5
        image_speed=0.1
        sprite_index=sSkellyDinoWalk
        playSound(global.snd_JumpStrike,0,1)
      }
    }
    if isCollisionTop(1)
    {
      yVel=0
      y+=8
    }
    if isCollisionLeft(1)
      xVel=0
    if isCollisionRight(1)
      xVel=0
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    if y>room_height+24
    {
      if questType>0
        enemyQuest(questType)
      instance_destroy()
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
if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_STAB
    inflictStatus(0)
}
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL"
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
