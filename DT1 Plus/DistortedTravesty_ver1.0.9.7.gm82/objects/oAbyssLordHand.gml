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

//Enemy base statistics
eName="Abyss Lord Hand"
maxLife=2800
life=maxLife
expWorth=0
physicalPower=220
physicalDefense=70
spiritPower=210
spiritDefense=80
FIREresist=-50
WATERresist=30
WINDresist=70
bCanDealDamage=false
activateBoss=0
currentAttack=0
darkballTime=round(random(30))
crushTime=0
crushType=0
crushEffectTime=0
explosion=0
if global.difficulty=1
{
  darkballDelay=240
  crushDelay=390
}
else if global.difficulty=2
{
  darkballDelay=210
  crushDelay=330
}
else if global.difficulty=3
{
  darkballDelay=180
  crushDelay=270
}
else if global.difficulty=4
{
  darkballDelay=160
  crushDelay=240
}
bossProgress=0
difficultyAdjustments(global.difficulty)
cripplePointText=">Fireball"

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
    if type=2
      xCenter=176
    oGlobalEvent.enemyCount=1
    bActive=true
    combatText="The Abyss Lord's hands are capable of two different attacks. One being a Dark Energy Ball, which when it hits any surface, it explodes into more dark energy. Try getting it to fire the Dark Ball to the sides.#The other attack is it's Hand Smash. It will raise up it's hands and BAM! Need I say more?"
    sideText="I could throw in a number of inappropriate jokes, but I've decided to stay mature for this. Anyway, as the first creature to come across with multiple parts, it sure is nasty. I recommend staying away from the Hand Smash attack, it'll do quite a job on you."
    activateBoss=2
  }
  if bActive=true and dieFade=0
  {
    if currentAttack=0
    {
      //darkballTime+=1
      //crushTime+=1
      darkballTime+=gDeltaTime //60fps change: counts 30fps ticks
      crushTime+=gDeltaTime //60fps change: counts 30fps ticks
    }

    if darkballTime>=darkballDelay and currentAttack!=2 //dark ball attack
    {
      if currentAttack=0
      {
        currentAttack=1
        darkballTime=1000
        sprite_index=sAbyssLordHand_Open
      }
      //darkballTime+=1
      darkballTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if darkballTime=1045
      if scrCountPass(darkballTime,1045) //60fps change: once, when the count reaches it
      {
        var xx;
        if image_xscale=1
          xx=21
        else
          xx=-21
        darkBall=instance_create(x+xx,y+64,oALdarkball)
        darkBall.spiritPower=spiritPower
        darkBall.throwSpeed=6
      }
      else if darkballTime>=1075
      {
        sprite_index=sAbyssLordHand_Close
        darkballTime=round(random(30))
        currentAttack=0
      }
    }
    if crushTime>=crushDelay and currentAttack!=1 //crush attack
    {
      if currentAttack=0
      {
        currentAttack=2
        crushTime=1000
        crushType=round(random(1))
        sprite_index=sAbyssLordHand_Crush
      }
      //crushTime+=1
      crushTime+=gDeltaTime //60fps change: counts 30fps ticks
      //if crushTime>=1021 and crushTime<=1070 //crush type
      if crushTime>1020 and crushTime<=1070 //crush type //60fps change: the same 30fps ticks, counted in gDeltaTime steps
      {
        if crushType=0 //center crush
        {
          if x>=xCenter
            //x-=1
            x-=1*gDeltaTime //60fps change: per 30fps tick
          else
            //x+=1
            x+=1*gDeltaTime //60fps change: per 30fps tick
        }
        else //seek crush
        {
          if x>oPlayer1.x and x>xCenter-roomSpan
            //x-=2
            x-=2*gDeltaTime //60fps change: per 30fps tick
          if x<oPlayer1.x and x<xCenter+roomSpan
            //x+=2
            x+=2*gDeltaTime //60fps change: per 30fps tick
        }
      }
      //if crushTime>=1021 and crushTime<=1050
      //  y-=4
      //else if crushTime>=1080 and crushTime<=1999
      //{
      //  y+=14
      //60fps change: the same 30fps ticks, counted in gDeltaTime steps; it moves per 30fps tick
      if crushTime>1020 and crushTime<=1050
        y-=4*gDeltaTime
      else if crushTime>1079 and crushTime<=1999
      {
        y+=14*gDeltaTime
        bCanDealDamage=true
        if y>=yGround-73 //hit the ground
        {
          crushTime=2000
          var xx1, xx2;
          if type=1
          {
            xx1=43
            xx2=73
          }
          else
          {
            xx1=76
            xx2=40
          }
          explosion=instance_create(x-xx1,yGround,oGASGExplosion)
          explosion.damageType="SPIRIT"
          explosion.elementType=1
          explosion.spiritPower=spiritPower+10
          explosion.sprite_index=sALfirePillar
          explosion.image_speed=0.33
          explosion=instance_create(x+xx2,yGround,oGASGExplosion)
          explosion.damageType="SPIRIT"
          explosion.elementType=1
          explosion.spiritPower=spiritPower+10
          explosion.sprite_index=sALfirePillar
          explosion.image_speed=0.33
          bCanDealDamage=false
        }
      }
      //else if crushTime>=2030
      //{
      //  if crushTime=2030
      //    sprite_index=sAbyssLordHand_Close
      //  if x>=xCenter
      //    x-=2
      //  else
      //    x+=2
      //  y-=4
      //60fps change: the same 30fps ticks, counted in gDeltaTime steps (and the sprite once, when it reaches 2030); it moves per 30fps tick
      else if crushTime>2029
      {
        if scrCountPass(crushTime,2030)
          sprite_index=sAbyssLordHand_Close
        if x>=xCenter
          x-=2*gDeltaTime
        else
          x+=2*gDeltaTime
        y-=4*gDeltaTime
        if y<=yNeutral
        {
          crushTime=0
          currentAttack=0
        }
      }
    }

    //scale difficulty
    if lifePercent<=0.9 and lifePercent>=0.76 and bossProgress=0
    {
      darkballDelay-=3
      crushDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.75 and lifePercent>=0.51 and bossProgress=1
    {
      darkballDelay-=3
      crushDelay-=10
      bossProgress+=1
    }
    else if lifePercent<=0.5 and lifePercent>=0.26 and bossProgress=2
    {
      if global.difficulty>=3
        darkballDelay-=7
      else
        darkballDelay-=3
      crushDelay-=15
      bossProgress+=1
    }
    else if lifePercent<=0.25 and lifePercent>=0 and bossProgress=3
    {
      if global.difficulty>=3
      {
        darkballDelay-=7
        crushDelay-=30
      }
      else
      {
        darkballDelay-=3
        crushDelay-=10
      }
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
  if darkballTime<darkballDelay
    darkballDelay-=round((stunnedTime/2))
  if oAbyssLord.fireballTime<oAbyssLord.fireballDelay
  {
    oAbyssLord.fireballTime+=8
    if oAbyssLord.fireballTime>oAbyssLord.fireballDelay
      oAbyssLord.fireballTime=oAbyssLord.fireballDelay
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(explosion)
{
  //oEvDistortionAmbience1.dRx-=2
  oEvDistortionAmbience1.dRx-=2*gDeltaTime //60fps change: per 30fps tick
  var xx1, xx2;
  if type=1
    xh=16
  else
    xh=-16
  draw_set_blend_mode_ext(bm_dest_color,bm_zero)
  draw_set_alpha(1)
  draw_set_color(make_color_rgb(203,63,1))
  draw_triangle(x+xh,yGround,x+xh+60,yGround-160,x+xh-60,yGround-160,false)
  draw_set_blend_mode(bm_normal)
}
event_inherited()
