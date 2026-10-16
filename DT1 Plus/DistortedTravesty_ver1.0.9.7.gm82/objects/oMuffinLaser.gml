#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_xscale=room_width*1.5
image_yscale=0.9
image_blend=c_red
size=2

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
decayTime=0
warnTime=50
effectDelay=0
noEffect=0
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("effectStop")
  noEffect=1
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
    if noEffect=0
    {
      effectDelay+=1
      if effectDelay mod 9=0
        effect_create_above(ef_firework,x,y,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
    }
    image_blend=make_color_rgb(155+random(100),155+random(100),155+random(100))
    if decayTime<2000
      decayTime+=1
    if decayTime>=idleTime
      instance_destroy()
  }
  else
  {
    warnTime-=1
    if warnTime=0
    {
      if bShake=1
      {
        playSound(global.snd_Shock,0,0.85)
        instance_create(0,0,oViewShaker)
      }
      image_yscale=4
      sprite_index=sShroudLLaser
      bCanDealDamage=true
    }
  }
}
