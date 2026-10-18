#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-40,-66,40,-1)
image_speed=0.23

//Enemy base statistics
eName="Dark Variant"
maxLife=1350
life=maxLife
expWorth=1900
physicalPower=325
physicalDefense=135
spiritPower=290
spiritDefense=165
WATERresist=70
WINDresist=-10
EARTHresist=-65
skillResist=5
baseItemChance=70
moneyWorth=140
detectDistX=320
if global.difficulty=1
{
  runAcc=2.8
  lungeWait=70
}
else if global.difficulty=2
{
  runAcc=3
  lungeWait=55
}
else if global.difficulty=3
{
  runAcc=3.2
  lungeWait=50
}
else if global.difficulty=4
{
  runAcc=3.5
  lungeWait=40
}
lungeTime=20
maxProximity=128
bLunge=false
lungeMultiplier=0

difficultyAdjustments(global.difficulty)
combatText="Watch them closely. They have a behavior similar to the Shrouds, namely, the lunge attack. If you try to run, it will lunge faster though, so keep that a consideration. It can also perform a hi jump if it needs to get up a ledge to get you. When it's lunging, it will inflict Spirit Drain too. Quite a nuisance."
sideText="These are from a game on the DS called Draglade. I don't know anything about it aside from that though. It kinda looks like a Pokemon to me. It could be called DRAGONBLADE... hmm, that's lame. DRAGLADE actually sounds like a Pokemon name, so we'll just go with that. I'm just trying to make these things seem less threatening to you."
cripplePointText=">Thrust Attack#>Upward Strike#>Full Swing"
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
    if lungeTime>=lungeWait //lunge
    {
      //lungeTime+=1
      lungeTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if lungeTime=lungeWait+1
      if scrCountPass(lungeTime,lungeWait+1) //60fps change: once, when the count reaches it
      {
        xVel=0
        bLunge=true
        sprite_index=sDarkVariantReady
      }
      //else if lungeTime=lungeWait+18 //start lunge
      else if scrCountPass(lungeTime,lungeWait+18) //start lunge //60fps change: once, when the count reaches it
      {
        var jumpPower;
        if y>oPlayer1.y+28
        {
          if random(10)>3
            jumpPower=10
          else
            jumpPower=6
        }
        else
          jumpPower=6
        sprite_index=sDarkVariantUp
        y-=2
        yVel=-jumpPower
        if point_distance(x,0,oPlayer1.x,0)>maxProximity*1.75
          lungeMultiplier=4
        else
          lungeMultiplier=2.75
      }
    }
    else //not lunging
    {
      if bLunge=false
      {
        //lungeTime+=1
        lungeTime+=gDeltaTime //60fps change: counts 30fps ticks
        //movement
        if point_distance(x,0,oPlayer1.x,0)>maxProximity
        {
          if x>oPlayer1.x //go left
            xVel=-runAcc
          else //go right
            xVel=runAcc
        }
        else
          xVel=0

        if xVel>0
          image_xscale=1
        else if xVel<0
          image_xscale=-1

        if xVel=0
          sprite_index=sDarkVariantIdle
        else
          sprite_index=sDarkVariantWalk
      }
    }

    if bLunge=true and lungeMultiplier!=0 //keep in motion when lunging
    {
      if image_xscale=1 //go right
        xVel=runAcc*lungeMultiplier
      else //go left
        xVel=-runAcc*lungeMultiplier
    }

    if sprite_index=sDarkVariantUp or sprite_index=sDarkVariantAttack //check if inflicting Spirit Drain
      bInflictSpiritDrain=true
    else
      bInflictSpiritDrain=false

    if bLunge=true and yVel>0 and sprite_index=sDarkVariantUp //change to attack frame when coming down
      sprite_index=sDarkVariantAttack

    //yVel+=0.6
    yVel=scrGravAcc(yVel,0.6,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if isCollisionTop(1)
      yVel=0
    if isCollisionBottom(1)
    {
      yVel=0
      if bLunge=true and sprite_index!=sDarkVariantReady
      {
        xVel=0
        lungeTime=irandom(10)
        lungeMultiplier=0
        bLunge=false
      }
    }
    if isCollisionLeft(1)
      xVel=runAcc
    if isCollisionRight(1)
      xVel=-runAcc
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    //if isCollisionSolid()
    if isCollisionSolid() and gDeltaDoTicks //60fps change: once per 30fps tick (it ran every frame, so a unit stuck in a wall was pushed out 2x as fast at 60fps, 4x at 120fps)
      y-=2
    if y>room_height+64
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
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_UP_SLASH
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
}
else if cripplePointProgress=2
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH
    inflictStatus(0)
}
