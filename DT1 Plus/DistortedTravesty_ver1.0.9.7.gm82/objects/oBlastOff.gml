#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_xscale=0.2
image_yscale=0.2
damageType="SPIRIT"
spiritPower=oPlayer1.spiritPower
currentSpell="BLAST OFF"
elementType=1
skillPower=130
lifeTime=5
oPlayer1.yVel=-8
oPlayer1.yVelSetExt=1 //60fps change (added): the player's speed is set every frame: the 30fps formula for it (see pMoveToWrapNew)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  x=oPlayer1.x
  y=oPlayer1.y
  //60fps change: grows and lasts per 30fps tick
  //image_xscale+=0.2
  //image_yscale+=0.2
  image_xscale+=0.2*gDeltaTime
  image_yscale+=0.2*gDeltaTime

  //lifeTime-=1
  lifeTime-=gDeltaTime //60fps change: see above
  if lifeTime<=0
  {
    instance_destroy()
    oPlayer1.yVel=-10
  }
  else
    oPlayer1.yVel=-8
  oPlayer1.yVelSetExt=1 //60fps change (added): see the Create event
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,image_angle,image_blend,image_alpha)
