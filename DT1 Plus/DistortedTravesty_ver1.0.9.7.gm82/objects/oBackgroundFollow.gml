#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx=0
yy=0
xScrollSpeed=0
yScrollSpeed=0
xMoveScale=1
yMoveScale=1
bgAlpha=1
scrollReset=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0 //stationary background
  draw_background_stretched(backSet,view_xview[0]+x,view_yview[0]+y,wSize,hSize)
else if type=1 //tiled background, stationary/move
  draw_background_tiled_ext(backSet,x+xx,y+yy,image_xscale,image_yscale,c_white,bgAlpha)
else if type=2 //tiled background, move scaled with screen
  draw_background_tiled_ext(backSet,view_xview[0]*xMoveScale,view_yview[0]*yMoveScale,image_xscale,image_yscale,c_white,bgAlpha)
else if type=3 //moving stretched background, blend (Black Rock Fortress Boss)
{
  if blendType=0
    draw_set_blend_mode(bm_add) //draw_set_blend_mode_ext(bm_one,bm_inv_src_color)
  else if blendType=1
    draw_set_blend_mode_ext(bm_dest_color,bm_zero)
  if bScrollType=1 //x scroll
  {
    draw_background_stretched_ext(backSet,view_xview[0]+x+xx,view_yview[0]+y+yy,wSize,hSize,c_white,bgAlpha)
    draw_background_stretched_ext(backSet,view_xview[0]+x+xx+512,view_yview[0]+y+yy,wSize,hSize,c_white,bgAlpha)
    //scrollReset+=xScrollSpeed
    scrollReset+=xScrollSpeed*gDeltaTime //60fps change: per 30fps tick
    if xScrollSpeed>0
    {
      if scrollReset>=wSize
      {
        xx-=wSize
        scrollReset=0
      }
    }
    else if xScrollSpeed<0
    {
      if scrollReset<=-wSize
      {
        xx+=wSize
        scrollReset=0
      }
    }
  }
  if bScrollType=2 //y scroll
  {
    draw_background_stretched_ext(backSet,view_xview[0]+x+xx,view_yview[0]+y+yy,wSize,hSize,c_white,bgAlpha)
    draw_background_stretched_ext(backSet,view_xview[0]+x+xx,view_yview[0]+y+yy+384,wSize,hSize,c_white,bgAlpha)
    //scrollReset+=yScrollSpeed
    scrollReset+=yScrollSpeed*gDeltaTime //60fps change: per 30fps tick
    if yScrollSpeed>0
    {
      if scrollReset>=hSize
      {
        yy-=hSize
        scrollReset=0
      }
    }
    else if yScrollSpeed<0
    {
      if scrollReset<=-hSize
      {
        yy+=hSize
        scrollReset=0
      }
    }
  }
  draw_set_blend_mode(bm_normal)
}
else if type=4 //tiled background, move scaled with screen, screen shake (shakes tile layer 1000000)
{
  draw_background_tiled_ext(backSet,(view_xview[0]*xMoveScale)+xx,(view_yview[0]*xMoveScale)+yy,image_xscale,image_yscale,c_white,bgAlpha)
  if instance_exists(oEvEscapeEffects)
  {
    if gDeltaDoTicks //60fps change (added): the shake once per 30fps tick (it moves the tiles a step each way)
    { //60fps change (added)
    shakeTime+=1
    if shakeTime mod 2=0
    {
      if instance_exists(oSolidOMDestroy)
        oSolidOMDestroy.xx+=2
      xx+=2
      tile_layer_shift(1000000,3,0)
    }
    else
    {
      if instance_exists(oSolidOMDestroy)
        oSolidOMDestroy.xx-=2
      xx-=2
      tile_layer_shift(1000000,-3,0)
    }
    } //60fps change (added)
  }
}

//xx+=xScrollSpeed
xx+=xScrollSpeed*gDeltaTime //60fps change: per 30fps tick
//yy+=yScrollSpeed
yy+=yScrollSpeed*gDeltaTime //60fps change: per 30fps tick
