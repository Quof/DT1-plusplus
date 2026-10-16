#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0.95
lineColor=c_white
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_number(oDistortedDiamond)=0
  instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
//draw connecting lines
if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
{
  draw_set_alpha(0.95)
  draw_set_color(lineColor)
  for(i=0;i<instance_number(oDistortedDiamond);i+=1)
  {
    cLine[i]=instance_find(oDistortedDiamond,i)
    draw_line(x+16,y+32,cLine[i].x,cLine[i].y)
  }
}
