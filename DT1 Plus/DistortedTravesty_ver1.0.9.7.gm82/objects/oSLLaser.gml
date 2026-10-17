#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
sprite_index=sNull
image_xscale=room_height
image_yscale=4
image_angle=90
size=2

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
decayTime=0
warnTime=45
warnAlpha=1
alphaChange=0
effectDelay=0
warnToPlayer=y
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("onPlayer")
  warnToPlayer=oPlayer1.y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bCanDealDamage=true
  {
    //effectDelay-=1
    effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
    if effectDelay<=0
    {
      effect_create_above(ef_firework,x,y,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
      effectDelay=7
    }
    if gDeltaDoTicks //60fps change (added): a new colour once per 30fps tick
      image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
    if decayTime<5000
      //decayTime+=1
      decayTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if decayTime>=idleTime
    if ceil(decayTime)>=idleTime //60fps change: the 30fps tick this frame is part of (the same at 30fps)
      instance_destroy()
  }
  else
  {
    //warnTime-=1
    warnTime-=gDeltaTime //60fps change: counts 30fps ticks
    //if warnTime=0
    if scrCountPassDown(warnTime,0) //60fps change: once, when the count reaches 0
    {
      if bShake=1
      {
        playSound(global.snd_Shock,0,0.85)
        instance_create(0,0,oViewShaker)
      }
      sprite_index=sShroudLLaser
      bCanDealDamage=true
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if warnTime>0
{
  draw_sprite_ext(sWarningSymbol,-1,x,warnToPlayer,0.6,0.6,0,c_white,warnAlpha)
  //alphaChange+=1
  alphaChange+=gDeltaTime //60fps change: counts 30fps ticks
  //if alphaChange=8
  if alphaChange>=8 //60fps change: counts 30fps ticks; >= so it still flips if the frame rate changes mid-count
  {
    if warnAlpha=1
      warnAlpha=0
    else
      warnAlpha=1
    alphaChange=0
  }
}
