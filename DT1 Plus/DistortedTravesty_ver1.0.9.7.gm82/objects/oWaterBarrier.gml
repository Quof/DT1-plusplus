#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_alpha=0.3
image_speed=0.25
image_xscale=1.1
image_yscale=1.1
global.recSpellsConnected+=1
bCanDealDamage=false
maxLife=round(oPlayer1.maxLife/1.5)
life=maxLife
lifeTime=305
bDestroy=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bDestroy=false
  {
    if life<=0
    {
      bDestroy=true
      image_blend=make_color_rgb(254,254,254)
      playSound(global.snd_BarrierDestroy,0,1)
      image_alpha=1
    }
    if lifeTime<=0
    {
      bDestroy=true
      image_blend=make_color_rgb(254,254,254)
      playSound(global.snd_BarrierDestroy,0,1)
      image_alpha=1
    }
    else
      lifeTime-=1
  }
  else
  {
    image_alpha-=0.1
    if image_alpha<=0
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=oPlayer1.x
y=oPlayer1.y-22
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
