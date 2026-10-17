#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-16,59,16,67)
image_speed=0.1
effectDelay=0

//Enemy base statistics
eName="Shroud Lord Hand"
maxLife=7500
life=maxLife
expWorth=0
physicalPower=420
physicalDefense=120
spiritPower=390
spiritDefense=140
FIREresist=100
WATERresist=-30
WINDresist=-65
bCanDealDamage=false
activateBoss=1
if global.difficulty=1
{
  slamWait=390
}
else if global.difficulty=2
{
  slamWait=330
}
else if global.difficulty=3
{
  slamWait=300
}
else if global.difficulty=4
{
  slamWait=250
}
slamTime=90+irandom(90)
slamDelay=0
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Any attack while slamming"

xCenter=432
yNeutral=176
yGround=288
roomSpan=64
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
    var eInfo;
    if type=1
      eInfo="right"
    if type=2
      eInfo="left"
    combatText="The Shroud Lord's " +string(eInfo) +string(" hand. It performs a hand slam. This is a very fast attack and the only way to dodge it is by carefully watching it's hands. When it's hand shakes, it is getting ready to slam it's hand onto the ground. The moment it stops, it will strike at lightning speeds. As long as you are not on the ground or dodge when it stops shaking, it won't hit you.")
    sideText="These come in handy, har har... What? I didn't have much else to say!#I suppose my only other comment is a complaint. We've already come across an enemy like this."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    //hand slam attack
    //slamTime+=1
    slamTime+=gDeltaTime //60fps change: counts 30fps ticks
    if slamDelay=0
    {
      if slamTime>=slamWait
        slamDelay=slamWait
    }
    if slamTime>=slamDelay and slamDelay!=0
    {
      //if slamTime=slamDelay+1
      if scrCountPass(slamTime,slamDelay+1) //60fps change: once, when the count reaches it
      {
        image_speed=0.83
        sprite_index=sShroudLArmFist
      }
      //else if slamTime=slamDelay+30
      else if scrCountPass(slamTime,slamDelay+30) //60fps change: once, when the count reaches it
        sprite_index=sShroudLArmUp
      //else if slamTime=slamDelay+40
      else if scrCountPass(slamTime,slamDelay+40) //60fps change: once, when the count reaches it
      {
        bCanDealDamage=true
        image_speed=0.1
        sprite_index=sShroudLArmSlam
        yVel=64
        var xDist;
        xDist=point_distance(x,0,oPlayer1.x,0)
        xDist/=3
        if xDist>20
          xDist=20
        if x>oPlayer1.x
          xVel=-xDist
        else
          xVel=xDist
      }
      //else if slamTime>=slamDelay+60 and slamTime<=slamDelay+79
      else if slamTime>slamDelay+59 and slamTime<=slamDelay+79 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        if effectDelay<=0
        {
          effect_create_above(ef_smoke,x,y,1,c_black)
          effect_create_above(ef_smokeup,x,y,1,c_black)
          //effectDelay=3
          effectDelay=4-gDeltaTime //60fps change: counts down 30fps ticks; the frame that makes the smoke counts as a whole tick, as at 30fps (it doesn't count down), so the count starts that much lower (3 at 30fps)
        }
        else
          //effectDelay-=1
          effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
      }
      //else if slamTime=slamDelay+80
      else if slamTime>=slamDelay+80 //60fps change: >= so it still resets if the frame rate changes mid-count
      {
        var handOffset;
        if type=1
          handOffset=88
        else if type=2
          handOffset=-88
        bCanDealDamage=false
        sprite_index=sShroudLArm
        x=oShroudLordLv1.x+handOffset
        y=oShroudLordLv1.y-18
        effect_create_above(ef_smoke,x,y,1,c_black)
        slamTime=irandom(60)
        slamDelay=0
      }
    }

    if slamTime>=slamDelay+40 and slamDelay!=0
    {
      if isCollisionBottom(1) and yVel>0
      {
        xVel=0
        yVel=0
        playSound(global.snd_BreakOut,0,1)
        instance_create(0,0,oViewShaker)
      }
      if isCollisionLeft(1)
        xVel=0
      if isCollisionRight(1)
        xVel=0
      //moveTo(xVel,yVel)
      moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      slamWait-=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      slamWait-=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      slamWait-=global.difficulty*5
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      slamWait-=global.difficulty*5
      bossProgress+=1
    }
  }
  if instance_exists(oShroudLordLv1)
  {
    var handOffset;
    if type=1
      handOffset=88
    else if type=2
      handOffset=-88
    if slamTime<slamWait+40
    {
      x=oShroudLordLv1.x+handOffset
      y=oShroudLordLv1.y-18
    }
  }
  enemyStepEvent()
}
#define Collision_oAttackBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if damageTime=flashTime and dieFade=0 and sprite_index=sShroudLArmSlam
{
  inflictStatus(0)
}
