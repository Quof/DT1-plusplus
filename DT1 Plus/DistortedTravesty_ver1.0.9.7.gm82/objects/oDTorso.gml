#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-64,-64,64,64)

//Enemy base statistics
eName="Distorted Torso"
maxLife=7600
life=maxLife
expWorth=4000
physicalPower=170
physicalDefense=60
spiritPower=215
spiritDefense=70
FIREresist=-10
WINDresist=60
EARTHresist=-40
bIsBoss=true
barAmount=1
questType=1
activateBoss=0
currentAttack=0
currentMovement=0
moveTime=0
moveChange=300
moveDuration=0
if global.difficulty=1
{
  waitTime=200
  slamSpeed=3.3
  lightningTime=400
  lightningAmount=1
  fireRate=10
  fireAmount=3
}
else if global.difficulty=2
{
  waitTime=190
  slamSpeed=3.5
  lightningTime=360
  lightningAmount=1
  fireRate=9
  fireAmount=4
}
else if global.difficulty=3
{
  waitTime=170
  slamSpeed=3.7
  lightningTime=320
  lightningAmount=2
  fireRate=8
  fireAmount=5
}
else if global.difficulty=4
{
  waitTime=150
  slamSpeed=4.2
  lightningTime=300
  lightningAmount=2
  fireRate=7
  fireAmount=7
}
lightningProgressTime=0
lightningProgressMax=0
lightningDelay=0
attackDelay=0
attackProgress=0
fatFrame=0
fFrameTime=0
heartFrame=0
hFrameTime=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Rock Smash while Furious"

xCenter=512
yGround=304
roomSpan=192
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
    combatText="This is quite an enemy you have here. Touching it will hurt you as it has toxins on it's body. It has a few different attacks. One in which it will spew fireballs constantly. Just be attentive and it won't be a problem. Another one with fireballs, except it will make them bounce around the room. This one can get quite rough, so just remember your dashing skills. It has a lightning attack, which you can see before-hand with a stream of light on you. Quickly move out of the way with this. When it tosses it's body around the room, it is vulnerable to being crippled."
    sideText="This thing from Gynoug is pretty random for an area like this. I don't know what kind of powers this Informant guy borrowed from whoever they are, but it's pretty intense if it can do this. This thing doesn't seem to be itself anymore. This Darkness thing seems to corrupt the mind. Anyway, be careful."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //movement
    if moveTime>=moveChange
    {
      //moveTime=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
      moveTime=gDeltaTime-1
      xVel=0
      yVel=0
      currentMovement=round(random(2))
    }
    else
      //moveTime+=1
      moveTime+=gDeltaTime //60fps change: see above
    if currentMovement=0 //slide to player, slight up & down movement
    {
      if moveDuration>=0 and moveDuration<=90
      {
        if x>=oPlayer1.x
        {
          //xVel-=0.01
          xVel-=0.01*gDeltaTime //60fps change: per 30fps tick
          if xVel<-0.5
            xVel=-0.5
        }
        else
        {
          //xVel+=0.01
          xVel+=0.01*gDeltaTime //60fps change: per 30fps tick
          if xVel>0.5
            xVel=0.5
        }
        if y>yGround-96
          yVel=-0.25
      }
    }
    else if currentMovement=1 //random direction
    {
      changer1=frac(moveTime/10)
      if changer1=0.1
      {
        xVel=random(0.4)
        yVel=random(0.4)
        if round(random(10))>=6
          xVel*=-1
        if round(random(10))>=6
          yVel*=-1
      }
    }
    else if currentMovement=2 //bounce around room
    {
      if moveTime>=0 and moveTime<=20
      {
        if gDeltaDoTicks //60fps change (added): the smoke once per 30fps tick
          effect_create_above(ef_smoke,(x-(sprite_width/2))+random(sprite_width),(y-(sprite_height/2))+random(sprite_height),0,c_black)
        //if moveTime=20
        if scrCountPass(moveTime,20) //60fps change: once, when the count reaches it
        {
          xVel=slamSpeed
          yVel=slamSpeed
          if round(random(10))>=6
            xVel*=-1
          if round(random(10))>=6
            yVel*=-1
          moveTime=100
        }
      }
    }
    //attacks
    //attackDelay+=1
    attackDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if attackDelay>=waitTime
    {
      if currentAttack=0 //bouncing fireballs
      {
        for (i=0;i<=fireAmount;i+=1)
        {
          fireAttack[i]=instance_create(x,y,oDTorsoFire)
          fireAttack[i].spiritPower=spiritPower
          fireAttack[i].type=1
        }
        currentAttack=round(random(1))
        attackDelay=-15
      }
      if currentAttack=1 //falling fireballs
      {
        //attackProgress+=1
        attackProgress+=gDeltaTime //60fps change: counts 30fps ticks
        //if attackProgress mod fireRate=0
        if scrModPass(attackProgress,fireRate) //60fps change: once each time the count reaches a multiple of it
        {
          fireAttack=instance_create(x,y,oDTorsoFire)
          fireAttack.spiritPower=spiritPower
          fireAttack.type=0
        }
        if attackProgress>=120
        {
          attackProgress=0
          currentAttack=round(random(1))
          attackDelay=0
        }
      }
    }
    //lightning attack
    //lightningDelay+=1
    lightningDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if lightningDelay>=lightningTime
    {
      for (ii=0;ii<=lightningAmount;ii+=1)
      {
        for (i=0;i<=5;i+=1)
        {
          lightPos=64*i
          lightningAttack=instance_create(oPlayer1.x,64+lightPos,oDTorsoLightning)
          lightningAttack.spiritPower=spiritPower+20
          lightningAttack.delay=(ii*10)
        }
      }
      lightningDelay=0
    }
    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      waitTime-=2
      lightningTime-=5
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      waitTime-=5
      lightningTime-=5
      lightningAmount+=1
      fireAmount+=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
      {
        waitTime-=10
        lightningTime-=10
        lightningAmount+=2
        fireAmount+=2
      }
      else
      {
        waitTime-=5
        lightningTime-=5
        lightningAmount+=1
        fireAmount+=1
      }
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
      {
        waitTime-=8
        lightningTime-=20
      }
      else
      {
        waitTime-=4
        lightningTime-=10
      }
      fireRate-=1
      lightningAmount+=1
      bossProgress+=1
    }
  }
  //if isCollisionTop(1)
  if isCollisionTop(1) and (gDeltaTime==1 or yVel<0) //60fps change: above 30fps, only bounce off what it's moving into (it can still be touching it on the next frame)
    yVel*=-1
  //if isCollisionBottom(1)
  if isCollisionBottom(1) and (gDeltaTime==1 or yVel>0) //60fps change: see above
    yVel*=-1
  //if isCollisionLeft(1)
  if isCollisionLeft(1) and (gDeltaTime==1 or xVel<0) //60fps change: see above
    xVel*=-1
  //if isCollisionRight(1)
  if isCollisionRight(1) and (gDeltaTime==1 or xVel>0) //60fps change: see above
    xVel*=-1
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
if damageTime=flashTime and dieFade=0 and other.currentSpell="ROCK SMASH" and currentMovement=2
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
    attackDelay-=round((stunnedTime/1.5))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//fFrameTime+=1
fFrameTime+=gDeltaTime //60fps change: counts 30fps ticks
//hFrameTime+=1
hFrameTime+=gDeltaTime //60fps change: counts 30fps ticks
if fFrameTime=9
  fatFrame=1
else if fFrameTime=18
  fatFrame=2
else if fFrameTime=27
  fatFrame=1
//else if fFrameTime=36
else if fFrameTime>=36 //60fps change: >= so it still resets if the frame rate changes mid-count
{
  fatFrame=0
  fFrameTime=0
}
if hFrameTime=8
  heartFrame=1
else if hFrameTime=16
  heartFrame=2
else if hFrameTime=24
  heartFrame=1
//else if hFrameTime=32
else if hFrameTime>=32 //60fps change: >= so it still resets if the frame rate changes mid-count
{
  heartFrame=0
  hFrameTime=0
}
draw_sprite_ext(sDTorsoFat,fatFrame,x-16,y+32,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sDTorsoHeart,heartFrame,x+52,y+36,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
