#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
barX=4
barY=4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(bossID)
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_rectangle(barX,barY,barX+201,barY+5,false)
  draw_set_color(make_color_rgb(200,200,200))
  draw_rectangle(barX,barY,barX+201,barY+5,true)
  if bossID.life>0
    lifeTrack=(bossID.life/bossID.maxLife)*200
  else
    lifeTrack=0
  draw_set_color(c_red)
  draw_rectangle(barX+1,barY+1,barX+1+lifeTrack,barY+5,false)
  if bossID.bossLives>1
  {
    for(i=0;i<bossID.bossLives-1;i+=1)
      draw_sprite(sAllItemIcon,-1,barX+6+(i*12),barY+13)
  }
}
else
  instance_destroy()
