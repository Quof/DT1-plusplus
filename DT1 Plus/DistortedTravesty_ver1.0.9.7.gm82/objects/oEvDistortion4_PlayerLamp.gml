#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rDistortionW4_4
{
  bLowView=1

  vWidth=2048
  vHeight=1536
  vWidthMax=vWidth
  vHeightMax=vHeight
}
else
{
  bLowView=0

  sizeMod=0
  bSizeUp=false
  glowAlpha=0.9
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bLowView=1 and global.gamePaused=false
{
  //decrease view size and keep from going too small
  if vWidth>vWidthMax/2
    vWidth-=1
  if vHeight>vHeightMax/2
    vHeight-=0.75

  //keep view size from going over max size
  if vWidth>vWidthMax
    vWidth=vWidthMax
  if vHeight>vHeightMax
    vHeight=vHeightMax
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bLowView=1
  draw_sprite_stretched(sD4ViewCircle,0,oPlayer1.x-(vWidth/2),oPlayer1.y-(vHeight/2)-26,vWidth,vHeight)
else
{
  draw_set_alpha(glowAlpha)
  if bSizeUp=false
  {
    sizeMod-=0.25
    if sizeMod<=-24
      bSizeUp=true
  }
  else
  {
    sizeMod+=0.25
    if sizeMod>=48
      bSizeUp=false
  }
  draw_set_blend_mode(bm_add)
  draw_circle_color(oPlayer1.x,oPlayer1.y-26,192+sizeMod,make_color_rgb(240,193,64),c_black,false)
  draw_set_blend_mode(bm_normal)
}
