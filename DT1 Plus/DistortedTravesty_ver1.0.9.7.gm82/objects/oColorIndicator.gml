#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//image_angle+=oColorIndControl.rotateAmt
image_angle+=oColorIndControl.rotateAmt*gDeltaTime //60fps change: per 30fps tick
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//element colors change (added): showing a zone's element (oColorIndControl sets image_blend to the element's colour,
//white otherwise), it's in the colour picked for the element (Element Colors, Options Set 3)
var tBlend; //element colors change (added)
tBlend=image_blend //element colors change (added)
if tBlend!=c_white {tBlend=scrElemColor(oColorIndControl.elementType,tBlend)} //element colors change (added)
if oColorIndControl.warnTime>=oColorIndControl.warnDelay
  //draw_sprite_ext(sprite_index,image_index,x,y,oColorIndControl.visualWarnSize,oColorIndControl.visualWarnSize,image_angle*2,image_blend,oColorIndControl.visualWarnAlpha)
  draw_sprite_ext(sprite_index,image_index,x,y,oColorIndControl.visualWarnSize,oColorIndControl.visualWarnSize,image_angle*2,tBlend,oColorIndControl.visualWarnAlpha) //element colors change: see above
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,tBlend,image_alpha) //element colors change: see above
