#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bFadeOut=0
typingSpeed=0
text_New=""
text_Pos=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type=0
{
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_center)
  draw_set_color(image_blend)
  draw_set_alpha(image_alpha)
  if text_Pos<string_length(text_Full)
  {
    draw_text(x,y,text_New)
    //typingSpeed-=1
    typingSpeed-=gDeltaTime //60fps change: counts 30fps ticks
    if typingSpeed<=0
    {
      text_Pos+=1
      text_New+=string_char_at(text_Full,text_Pos)
      typingSpeed=2
    }

  }
  else
  {
    draw_text(x,y,text_Full)
    if bFadeOut=1
    {
      //image_alpha-=0.02
      image_alpha-=0.02*gDeltaTime //60fps change: per 30fps tick
      if image_alpha<=0
        instance_destroy()
    }
  }
}
else if type=1
{

}
