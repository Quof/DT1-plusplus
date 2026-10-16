#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.8
image_speed=0.33
global.recSpellsConnected+=1
lifeTime=400
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
    if point_distance(x,y-40,oPlayer1.x,oPlayer1.y-28)<192 and oPlayer1.life<oPlayer1.maxLife
    {
      oPlayer1.bInsideSoothingSpring=1
    }
    else
    {
      oPlayer1.bInsideSoothingSpring=0
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
    {
      oPlayer1.bInsideSoothingSpring=0
      instance_destroy()
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_set_blend_mode(bm_normal)
draw_set_alpha(0.05)
draw_set_color(c_blue)
draw_circle(x,y-40,192,false)
draw_set_alpha(0.15)
draw_circle(x,y-40,192,true)
