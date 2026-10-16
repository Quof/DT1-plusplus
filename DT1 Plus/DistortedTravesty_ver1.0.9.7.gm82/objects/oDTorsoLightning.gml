#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.3
sprite_index=sNull

//Enemy base statistics
damageType="SPIRIT"
elementType=3
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
bCanDealDamage=false
decayTime=0
lineWarn=0
init=0
lineW=0
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
    decayTime+=1
    if decayTime>=10
      instance_destroy()
  }
  else
  {
    delay-=1
    if delay<=0
    {
      if init=0
      {
        x=oPlayer1.x
        init=1
      }
      if lineWarn<1
        lineWarn+=0.05
      else
      {
        lineWarn+=1
        if lineWarn>=9
        {
          playSound(global.snd_Shock,0,0.7)
          lineWarn=0
          sprite_index=sDTorsoLightning
          bCanDealDamage=true
        }
      }
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
draw_set_color(make_color_rgb(238,157,215))
draw_set_alpha(lineWarn)
lineW=lineWarn*5
if lineW<2
  lineW=2
else if lineW>5
  lineW=5
draw_line_width(x,y,x,y-64,lineW)
