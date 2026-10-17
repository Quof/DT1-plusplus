#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
displayTime=60
yDisplay=32
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//displayTime-=1
displayTime-=gDeltaTime //60fps change: counts 30fps ticks
if displayTime<=0
{
  //image_alpha-=0.05
  image_alpha-=0.05*gDeltaTime //60fps change: per 30fps tick
  if image_alpha<=0
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fnt_AreaName)
draw_set_halign(fa_center)
textColor=make_color_rgb(247,190,74)
centerView=view_xview[0]+256
textWidth1=string_width(attackString)
draw_sprite_ext(sAreaDisplaySides,1,centerView-textWidth1,view_yview[0]+yDisplay+10,1,1,0,c_white,image_alpha)
draw_sprite_ext(sAreaDisplaySides,1,centerView+textWidth1,view_yview[0]+yDisplay+10,-1,1,0,c_white,image_alpha)
draw_sprite_ext(sAreaDisplayMiddle,1,centerView-textWidth1+4,view_yview[0]+yDisplay+10,textWidth1*2-8,1,0,c_white,image_alpha)
//show attack name
draw_text_color(centerView,view_yview[0]+yDisplay,attackString,textColor,textColor,textColor,textColor,image_alpha)
