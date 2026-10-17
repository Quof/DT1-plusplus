#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effectSize[0]=0
effectSize[1]=0.25
effectSize[2]=0.5
effectAlpha[0]=0.75
effectAlpha[1]=0.5
effectAlpha[2]=0.25
glowSize=48
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<3;i+=1)
{
  if effectSize[i]<0.75
  {
    //effectSize[i]+=0.01
    effectSize[i]+=0.01*gDeltaTime //60fps change: per 30fps tick
    //effectAlpha[i]-=0.01
    effectAlpha[i]-=0.01*gDeltaTime //60fps change: per 30fps tick
  }
  else
  {
    effectSize[i]=0
    effectAlpha[i]=0.75
  }
}
draw_set_blend_mode(bm_add)
draw_set_alpha(0.75)
draw_circle_color(x,y,glowSize,make_color_rgb(240,160,70),c_black,false)
draw_sprite_ext(sprite_index,muffinType,x,y,image_xscale+effectSize[0],image_yscale+effectSize[0],0,image_blend,effectAlpha[0])
draw_sprite_ext(sprite_index,muffinType,x,y,image_xscale+effectSize[1],image_yscale+effectSize[1],0,image_blend,effectAlpha[1])
draw_sprite_ext(sprite_index,muffinType,x,y,image_xscale+effectSize[2],image_yscale+effectSize[2],0,image_blend,effectAlpha[2])
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprite_index,muffinType,x,y,image_xscale,image_yscale,0,image_blend,1)
