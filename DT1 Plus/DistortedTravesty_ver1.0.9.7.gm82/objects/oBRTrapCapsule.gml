#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bobble=0
bobTime=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if trapped!=1000
{
  bobTime+=1
  if bobTime>=0 and bobTime<=50
    bobble+=0.15
  else if bobTime>=60 and bobTime<=110
    bobble-=0.15
  else if bobTime>=120
    bobTime=0

  draw_sprite(sBRTrapped,trapped,x+4,y-50+bobble)
}
draw_sprite_ext(sBRTrapCapGlass,-1,x+4,y-87,1,80,0,c_white,0.4)
draw_sprite(sprite_index,-1,x,y)
