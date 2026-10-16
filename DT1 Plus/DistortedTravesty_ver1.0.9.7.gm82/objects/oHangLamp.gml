#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=random(0.1)+0.1
sizeMod=0
bSizeUp=false
findTargetX=0
findTargetY=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
findTargetX=point_distance(oPlayer1.x,0,x,0)
findTargetY=point_distance(0,oPlayer1.y,0,y)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if findTargetX<480 and findTargetY<352
{
  draw_set_alpha(random(0.02)+0.58)
  if bSizeUp=false
  {
    sizeMod-=0.01
    if sizeMod<=-1
      bSizeUp=true
  }
  else
  {
    sizeMod+=0.01
    if sizeMod>=1
      bSizeUp=false
  }
  draw_set_blend_mode(bm_add)
  draw_circle_color(x,y,16+sizeMod,make_color_rgb(240,193,64),c_black,false)
  draw_set_blend_mode(bm_normal)
  draw_sprite(sHangLamp,-1,x,y)
}
