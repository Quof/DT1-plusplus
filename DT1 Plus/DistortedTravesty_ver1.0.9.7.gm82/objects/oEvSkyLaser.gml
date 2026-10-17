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
waitTime=10
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
    if gDeltaDoTicks //60fps change (added): a new colour once per 30fps tick
      image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
    //decayTime+=1
    decayTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if decayTime>=idleTime
    if ceil(decayTime)>=idleTime //60fps change: the 30fps tick this frame is part of (the same at 30fps)
      instance_destroy()
  }
  else
  {
    //waitTime-=1
    waitTime-=gDeltaTime //60fps change: counts 30fps ticks
    //if waitTime=0
    if scrCountPassDown(waitTime,0) //60fps change: once, when the count reaches 0
    {
      if bShake=1
      {
        playSound(global.snd_Shock,0,0.8)
        instance_create(0,0,oViewShaker)
      }
      sprite_index=sShroudLLaser
      bCanDealDamage=true
    }
  }
}
