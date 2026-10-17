#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.8
image_speed=0.5
image_xscale=0.8
image_yscale=1.25
global.recSpellsConnected+=1
lifeTime=50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //lifeTime-=1
  lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if lifeTime>0
  if lifeTime>=1 //60fps change: the same 30fps ticks (it counts down in gDeltaTime steps; the same as >0 in whole ticks)
    //x+=xVel
    x+=xVel*gDeltaTime //60fps change: per 30fps tick
  else
  {
    //image_alpha-=0.1
    image_alpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    if image_alpha<=0
      instance_destroy()
  }
  if xVel>0
    //xVel-=0.05
    xVel-=0.05*gDeltaTime //60fps change: per 30fps tick
  else
    //xVel+=0.05
    xVel+=0.05*gDeltaTime //60fps change: per 30fps tick
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.sprite_index=sPlayerAirDash or other.sprite_index=sPlayerJumpForward or other.sprite_index=sPlayerJumpForward
{
  if xVel>0
    other.hurricaneDash=10
  else
    other.hurricaneDash=-10
  other.airDashRecovery=10
  other.dashInvulnerabilityTime=10
}
#define Collision_oEProjectileBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
other.xVel=xVel*3
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
