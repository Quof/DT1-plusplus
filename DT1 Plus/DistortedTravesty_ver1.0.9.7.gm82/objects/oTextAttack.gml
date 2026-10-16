#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-1,-1,1,1)

//Enemy base statistics
damageType="SPIRIT"
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
text_Full="" //set within creation
text_New=""
text_Pos=0
size=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if text_Pos>=0
  {
    draw_set_font(fnt_MSWorld)
    draw_set_halign(fa_left)
    draw_set_color(c_black)
    draw_set_alpha(1)
    if text_Pos<string_length(text_Full)
    {
      draw_text_transformed(x,y,text_New,1,1,image_angle)
      text_Pos+=1
      text_New+=string_char_at(text_Full,text_Pos)
      image_xscale=string_width(text_New)
      image_yscale=string_height(text_New)
    }
    else
    {
      draw_text_transformed(x,y,text_Full,1,1,image_angle)
      decayTime-=1
      if decayTime<=0
        instance_destroy()
    }
  }
}
