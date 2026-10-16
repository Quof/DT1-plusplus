#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0.52
global.recSpellsConnected+=1
bCanDealDamage=false
lifeTime=8
image_xscale=oPlayer1.image_xscale
if image_xscale=1
  facing=0
else
  facing=1
image_xscale*=1.1
image_yscale*=1.1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_alpha-=0.05
  if lifeTime<=0
    instance_destroy()
  else
    lifeTime-=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if facing=0
  x=oPlayer1.x+28
else
  x=oPlayer1.x-28
y=oPlayer1.y-26
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_blend_mode(bm_normal)
