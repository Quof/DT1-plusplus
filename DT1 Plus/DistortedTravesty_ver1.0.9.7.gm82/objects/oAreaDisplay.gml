#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.showArea=false
image_alpha=0
displayTime=60
fadeIn=false
displayType=0
yDisplay=72
if room=rWindyMountains or room=rDataSegmentEntry
{
  displayType=1
  yDisplay=168
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fadeIn=true
{
  if displayTime<=0
  {
    //image_alpha-=0.05
    image_alpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    if image_alpha<=0
      instance_destroy()
  }
  else
    //displayTime-=1
    displayTime-=gDeltaTime //60fps change: counts 30fps ticks
}
else
{
  //image_alpha+=0.05
  image_alpha+=0.05*gDeltaTime //60fps change: per 30fps tick
  if image_alpha>=1
    fadeIn=true
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if areaString!=""
{
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_center)
  areaColor=make_color_rgb(247,190,74)
  if displayType=0
    centerView=view_xview[0]+256
  if displayType=1
    centerView=view_xview[0]+170
  textWidth1=string_width(areaString)
  draw_sprite_ext(sAreaDisplaySides,1,centerView-textWidth1,view_yview[0]+yDisplay+10,1,1,0,c_white,image_alpha)
  draw_sprite_ext(sAreaDisplaySides,1,centerView+textWidth1,view_yview[0]+yDisplay+10,-1,1,0,c_white,image_alpha)
  draw_sprite_ext(sAreaDisplayMiddle,1,centerView-textWidth1+4,view_yview[0]+yDisplay+10,textWidth1*2-8,1,0,c_white,image_alpha)
  //show area name
  draw_text_color(centerView,view_yview[0]+yDisplay,areaString,areaColor,areaColor,areaColor,areaColor,image_alpha)
}
