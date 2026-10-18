#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
map header change (added): Show Map Headers (Options Set 3), DT3's oDisplayHeaderText: the map's header (the line the
window's title bar shows, room_caption) at the bottom left for 6 seconds as the map starts, fading out over its last 20
30fps ticks. oPlayer1 makes it as the map starts (not after a retry, nor in the save room)
*/
textColorMain=make_color_rgb(240,240,240)
textColorShadow=make_color_rgb(12,12,12)
decayTime=180 //30fps ticks
//drawY=326
drawY=352 //map header change: lower (the user's call), halfway or so to the bottom; the letters (y+4 to +13) end just above the boss bar (y 366)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
decayTime-=gDeltaTime
if decayTime<=20 {image_alpha-=0.05*gDeltaTime}
if decayTime<=0 {instance_destroy()}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if view_current=0
{
  var tX,tY,i,j;
  tX=view_xview[0]+8
  tY=view_yview[0]+drawY
  draw_set_font(fnt_SubMenu)
  draw_set_halign(fa_left)
  draw_set_alpha(image_alpha)
  draw_set_color(textColorShadow) //its shadow, on all 8 sides (DT3's textDropShadowExt type 4), wrapped at 464 pixels
  for(i=-1;i<=1;i+=1)
  {
    for(j=-1;j<=1;j+=1)
    {
      if i!=0 or j!=0 {draw_text_ext(tX+i,tY+j,room_caption,14,464)}
    }
  }
  draw_set_color(textColorMain)
  draw_text_ext(tX,tY,room_caption,14,464)
  draw_set_alpha(1)
}
