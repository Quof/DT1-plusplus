#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tileDraw=0
{
  for(i=0;i<image_xscale;i+=1)
  {
    draw_background_part_ext(tilePrimaryMemory,16,32,16,16,x+(i*16),y,1,1,image_blend,image_alpha)
  }
}
if tileDraw=1
{
  for(i=0;i<image_yscale;i+=1)
  {
    draw_background_part_ext(tilePrimaryMemory,16,32,16,16,x,y+(i*16),1,1,image_blend,image_alpha)
  }
}
