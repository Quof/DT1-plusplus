#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=random(0.1)+0.3
sizeMod=0
bSizeUp=false
bBurning=true
findTargetX=0
findTargetY=0
sprite_index=sBRF_TorchFire
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
findTargetX=point_distance(oPlayer1.x,0,x,0)
findTargetY=point_distance(0,oPlayer1.y,0,y)
#define Collision_oSpell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.elementType=1 and bBurning=false
  bBurning=true
else if other.elementType=2 and bBurning=true
  bBurning=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if findTargetX<480 and findTargetY<352
{
  draw_set_alpha(1)
  draw_sprite(sBRF_TorchStand,-1,x,y)
  if bBurning=true
  {
    draw_sprite(sBRF_TorchFire,-1,x,y)
    draw_set_alpha(random(0.05)+0.27)
    if bSizeUp=false
    {
      sizeMod-=0.1
      if sizeMod<=-2
        bSizeUp=true
    }
    else
    {
      sizeMod+=0.1
      if sizeMod>=4
        bSizeUp=false
    }
    draw_set_blend_mode(bm_add)
    draw_circle_color(x,y-8,32+sizeMod,make_color_rgb(240,193,64),c_black,false)
    draw_set_blend_mode(bm_normal)
  }
}
