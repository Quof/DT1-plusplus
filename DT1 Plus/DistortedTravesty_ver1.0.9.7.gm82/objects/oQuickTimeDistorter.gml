#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-20,-64,28,14)

//Enemy base statistics
eName="Quick Time Distorter"
maxLife=10200
life=maxLife
expWorth=17500
physicalPower=230
physicalDefense=145
spiritPower=240
spiritDefense=255
FIREresist=100
WATERresist=100
WINDresist=100
EARTHresist=100
bIsBoss=true
barAmount=1
questType=1
bCanDealDamage=false
bCanTakeDamage=false
activateBoss=0
currentAttack=0
currentMovement=0
moveChange=150
moveTime=moveChange
elemChangeTimeMax=110
elemChangeTime=0
elementsActive=0
maxElements=1
bFireActive=false
bWaterActive=false
bWindActive=false
bEarthActive=false
if global.difficulty=1
{
  fireWaitTime=110
  waterWaitTime=130
  windWaitTime=100
  earthWaitTime=120
  fireFreq=12
}
else if global.difficulty=2
{
  fireWaitTime=90
  waterWaitTime=110
  windWaitTime=80
  earthWaitTime=100
  fireFreq=10
}
else if global.difficulty=3
{
  fireWaitTime=70
  waterWaitTime=90
  windWaitTime=60
  earthWaitTime=80
  fireFreq=8
}
else if global.difficulty=4
{
  fireWaitTime=60
  waterWaitTime=80
  windWaitTime=50
  earthWaitTime=70
  fireFreq=7
}
fireAttackDelay=0
waterAttackDelay=0
windAttackDelay=0
earthAttackDelay=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">First Level Spells...?#>Full Swing of Same Element#>Any Physical Attack"

xCenter=368
yGround=192
roomSpan=192
fireOrb=instance_create(x+20,y-28,oQTD_Orb)
fireOrb.type=0
fireOrb.sprite_index=sQTD_Orb
fireOrb.image_blend=c_red
fireOrb.image_speed=0
waterOrb=instance_create(x+20,y-28,oQTD_Orb)
waterOrb.type=1
waterOrb.sprite_index=sQTD_Orb
waterOrb.image_blend=c_blue
waterOrb.image_speed=0
windOrb=instance_create(x+20,y-28,oQTD_Orb)
windOrb.type=2
windOrb.sprite_index=sQTD_Orb
windOrb.image_blend=c_green
windOrb.image_speed=0
earthOrb=instance_create(x+20,y-28,oQTD_Orb)
earthOrb.type=3
earthOrb.sprite_index=sQTD_Orb
earthOrb.image_blend=make_color_rgb(150,85,0) //c_gray
earthOrb.image_speed=0
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
    bCanTakeDamage=true
    bShowHealthBar=true
    showBossHP=instance_create(0,0,oBossLifeDisplay)
    showBossHP.bossID=id
    with oQTD_Orb
      bSpinning=true
    combatText="Where to start?... You see those Orbs circling it? When you see one glow and start to spin, that's the Elemental Port that it is opening and using. During that time, it can attack with that element, but with opening ports you are also opening vulnerabilites. If you can't see it's Cripple Point, I can't understand... maybe you can make sense of that."
    sideText="Quite possibly the bane of my existence. How someone made this I don't know, or even why anyone would want such a horrific thing. The fact that this had to be created means that someone actually thought this up and then proceeded to have it developed. This is without a doubt the most asshole thing anyone can do."
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
      currentMovement=choose(0,1)
      if x>xCenter+roomSpan-96
        currentMovement=1
      else if x<xCenter-roomSpan
        currentMovement=0
    }
    else
      //moveTime+=1
      moveTime+=gDeltaTime //60fps change: see above
    if currentMovement=0 or currentMovement=1 //move left or right
    {
      if currentMovement=1 //left
      {
        //xVel-=0.01
        xVel-=0.01*gDeltaTime //60fps change: per 30fps tick
        if xVel<-0.25
          xVel=-0.25
      }
      else if currentMovement=0 //right
      {
        //xVel+=0.01
        xVel+=0.01*gDeltaTime //60fps change: per 30fps tick
        if xVel>0.25
          xVel=0.25
      }
    }
    //elemChangeTime+=1
    elemChangeTime+=gDeltaTime //60fps change: counts 30fps ticks
    if elemChangeTime>=elemChangeTimeMax
    {
      if elementsActive<maxElements
      {
        while(x<100000)
        {
          currentElement=choose(1,2,3,4)
          if currentElement=1 and bFireActive=false
          {
            fireOrb.image_speed=0.25
            bFireActive=true
            FIREresist=-50
            break;
          }
          else if currentElement=2 and bWaterActive=false
          {
            waterOrb.image_speed=0.25
            bWaterActive=true
            WATERresist=-50
            break;
          }
          else if currentElement=3 and bWindActive=false
          {
            windOrb.image_speed=0.25
            bWindActive=true
            WINDresist=-50
            break;
          }
          else if currentElement=4 and bEarthActive=false
          {
            earthOrb.image_speed=0.25
            bEarthActive=true
            EARTHresist=-50
            break;
          }
        }
        elementsActive+=1
      }
      elemChangeTime=0
    }
    //attacks
    if bFireActive=true
    {
      //fireAttackDelay+=1
      fireAttackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if fireAttackDelay>=fireWaitTime
      {
        if fireAttackDelay<1000
          fireAttackDelay=1001
        //if fireAttackDelay mod fireFreq=0
        if scrModPass(fireAttackDelay,fireFreq) //60fps change: once each time the count reaches a multiple of it
        {
          playSound(global.snd_SpellFireball,0,1)
          fireBall=instance_create((xCenter-roomSpan)+random(roomSpan*2),-32,oKreFire)
          fireBall.spiritPower=spiritPower
          fireBall.type=1
          //fireBall.direction=270
          fireBall._direction=270 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        }
        if fireAttackDelay>=1095
        {
          fireAttackDelay=0
          bFireActive=false
          fireOrb.image_speed=0
          fireOrb.image_index=0
          FIREresist=100
          elementsActive-=1
        }
      }
    }
    if bWaterActive=true
    {
      //waterAttackDelay+=1
      waterAttackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if waterAttackDelay>=waterWaitTime
      {
        if waterAttackDelay<1000
        {
          waterAttackDelay=1001
          flood=instance_create(0,room_height+8,oQTD_Flood)
          flood.spiritPower=spiritPower
        }
      }
    }
    if bWindActive=true
    {
      //windAttackDelay+=1
      windAttackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if windAttackDelay>=waterWaitTime
      {
        if windAttackDelay<1000
        {
          windAttackDelay=1001
          playSound(global.snd_SpellWindStorm,0,1)
          tornado=instance_create(oPlayer1.x+160,yGround,oQTD_Tornado)
          tornado.spiritPower=spiritPower
          //tornado.direction=180
          tornado._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          tornado=instance_create(oPlayer1.x-160,yGround,oQTD_Tornado)
          tornado.spiritPower=spiritPower
          //tornado.direction=0
          tornado._direction=0 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        }
        if windAttackDelay>=1010
        {
          windAttackDelay=0
          bWindActive=false
          windOrb.image_speed=0
          windOrb.image_index=0
          WINDresist=100
          elementsActive-=1
        }
      }
    }
    if bEarthActive=true
    {
      //earthAttackDelay+=1
      earthAttackDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if earthAttackDelay>=earthWaitTime
      {
        if earthAttackDelay<1000
        {
          earthAttackDelay=1001
          xDir=choose(0,1)
          if xDir=0
            xCheck=xCenter-roomSpan
          else if xDir=1
            xCheck=xCenter+roomSpan
        }
        //if earthAttackDelay mod 5=0 and earthAttackDelay<=1080
        if scrModPass(earthAttackDelay,5) and earthAttackDelay<=1080 //60fps change: once each time the count reaches a multiple of it
        {
          rockstorm=instance_create(xCheck,room_height+16,oQTD_RockStorm)
          rockstorm.spiritPower=spiritPower
          rockstorm.type=1
          //rockstorm.direction=90
          rockstorm._direction=90 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          if xDir=0
            xCheck+=32
          else if xDir=1
            xCheck-=32
        }
        if earthAttackDelay>=1090
        {
          earthAttackDelay=0
          bEarthActive=false
          earthOrb.image_speed=0
          earthOrb.image_index=0
          EARTHresist=100
          elementsActive-=1
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      elemChangeTimeMax-=7
      fireWaitTime-=8
      waterWaitTime-=8
      windWaitTime-=8
      earthWaitTime-=8
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      elemChangeTimeMax-=7
      fireWaitTime-=8
      waterWaitTime-=8
      windWaitTime-=8
      earthWaitTime-=8
      maxElements+=1
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
      {
        fireWaitTime-=16
        waterWaitTime-=16
        windWaitTime-=16
        earthWaitTime-=16
      }
      else
      {
        fireWaitTime-=8
        waterWaitTime-=8
        windWaitTime-=8
        earthWaitTime-=8
      }
      elemChangeTimeMax-=10
      maxElements+=1
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
      {
        maxElements+=1
        fireWaitTime-=10
        waterWaitTime-=10
        windWaitTime-=10
        earthWaitTime-=10
      }
      else
      {
        fireWaitTime-=8
        waterWaitTime-=8
        windWaitTime-=8
        earthWaitTime-=8
      }
      elemChangeTimeMax-=7
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
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0
{
  if fireAttackDelay<fireWaitTime and fireAttackDelay>0
    fireAttackDelay-=round((stunnedTime/2))
  if waterAttackDelay<waterWaitTime and waterAttackDelay>0
    waterAttackDelay-=round((stunnedTime/2))
  if windAttackDelay<windWaitTime and windAttackDelay>0
    windAttackDelay-=round((stunnedTime/2))
  if earthAttackDelay<earthWaitTime and earthAttackDelay>0
    earthAttackDelay-=round((stunnedTime/2))
}

if cripplePointProgress=0
{
  if damageTime=flashTime and dieFade=0 and other.currentSpell="FIREBALL" and bFireActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.currentSpell="WATER BLAST" and bWaterActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.currentSpell="WIND BURST" and bWindActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
  if damageTime=flashTime and dieFade=0 and other.currentSpell="ROCK SMASH" and bEarthActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=1
  }
}
else if cripplePointProgress=1
{
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=1 and bFireActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=2 and bWaterActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=3 and bWindActive=true
  {
    cripplePointPTime=30
    cripplePointProgress=2
  }
  if damageTime=flashTime and dieFade=0 and other.attackType=other.PART_H_SLASH and other.elementType=4 and bEarthActive=true
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
