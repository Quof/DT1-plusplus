#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Notes for pixel differences - 26
Window Header Bar: 3 pixels down from origin, 4 pixels right from origin, 4 pixels left on right border
Window Header Title: 5 pixels down from top origin, 4 pixels left from (2 tiles right) or 28 right from origin
Directory: 5 pixels down from top input box, 5 pixels left from (2 tiles right) or 29 right from origin
*/
leftWindowS=make_color_rgb(1,1,130)
rightWindowS=make_color_rgb(16,132,208)
helpWindow=make_color_rgb(255,255,225)
wBarHeight=18

if room=rDistortionW2_6 or room=rBR_DemonCursor
{
  bossBackShow=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fnt_MSWBar)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_alpha(1)
//------------------------- window header -------------------------
if room=rDistortionW2_1
{
  draw_rectangle_color(36,35,636,35+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(60,36,"First Window")
  draw_rectangle_color(708,19,1340,19+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(732,20,"Distorted Travesty")
  draw_rectangle_color(1412,19,2076,19+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(1436,20,"Distorted Travesty - Version What?")
}
else if room=rDistortionW2_2
{
  draw_rectangle_color(324,131,924,131+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(348,132,"I'm laughing at you right now.")
  draw_rectangle_color(1348,515,2012,515+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(1372,516,"Temptation is fun... giving in is better.")
}
else if room=rDistortionW2_3
{
  draw_rectangle_color(1028,275,1500,275+wBarHeight,leftWindowS,rightWindowS,rightWindowS,leftWindowS,false)
  draw_text(1052,276,"You can do it!")
}
draw_set_font(fnt_MSWorld)
draw_set_color(c_black)
//------------------------- window directory -------------------------
if room=rDistortionW2_1
{
  draw_text(107,117,"Don't look here... too late.")
  draw_text(779,101,working_directory)
  draw_text(1483,101,"Figuring it out yet?")
}
else if room=rDistortionW2_2
{
  draw_text(395,213,"Objects currently in the area: " +string(instance_count))
  draw_text(1419,597,"Doors Left: "+string(instance_number(oSwitchBarrier)))
}
else if room=rDistortionW2_3
{
  draw_text(1115,357,"Bad stuff in the area: " +string(instance_number(oDamagableBase)))
}
draw_set_color(helpWindow)
//------------------------- pop up info -------------------------
if room=rDistortionW2_1
{
  newString1="You can use shortcuts#to get to different#folders and applications."
  newString2="Sometimes that cursor#can make things easier#or harder for you."
  newString3="You can left click when#the cursor is busy#to force it to move an#app where you want it."
  draw_rectangle(448,336,448+(string_width(newString1)*1.15),336+(string_height(newString1)*1.45),false)
  draw_rectangle(976,144,976+(string_width(newString2)*1.15),144+(string_height(newString2)*1.45),false)
  draw_rectangle(1424,272,1424+(string_width(newString2)*1.15),272+(string_height(newString2)*1.6),false)
  draw_set_color(c_black)
  draw_rectangle(448,336,448+(string_width(newString1)*1.15),336+(string_height(newString1)*1.45),true)
  draw_rectangle(976,144,976+(string_width(newString2)*1.15),144+(string_height(newString2)*1.45),true)
  draw_rectangle(1424,272,1424+(string_width(newString2)*1.15),272+(string_height(newString2)*1.6),true)
  draw_text(456,344,newString1)
  draw_text(984,152,newString2)
  draw_text(1432,280,newString3)
  //shortcut lines
  draw_set_color(make_color_rgb(0,255,0))
  draw_line(560,208,768,480)
  draw_line(1312,160,1478,448)
  draw_line(2048,144,2288,448)
}
else if room=rDistortionW2_2
{
  //shortcut lines
  draw_set_color(make_color_rgb(0,255,0))
  draw_line(240,272,384,272)
  draw_line(896,304,1040,240)
  draw_line(896,528,1040,608)
  draw_line(1328,672,1408,976)
  draw_line(1088,736,1408,1088)
}
else if room=rDistortionW2_3
{
  //shortcut lines
  draw_set_color(make_color_rgb(0,255,0))
  draw_line(1264,48,1056,416)
}
else if room=rDistortionW2_4
{
  //shortcut lines
  draw_set_color(make_color_rgb(0,255,0))
  draw_line(320,1872,64,1424)
  draw_line(32,1712,384,1360)
  draw_line(96,1712,192,1008)
  draw_line(448,1616,288,1168)
  draw_line(256,1872,352,1168)
  draw_line(384,1616,304,848)
  draw_line(128,1424,96,752)
  draw_line(320,1360,480,496)
  draw_line(128,1008,96,432)
  draw_line(400,848,208,592)
  draw_line(16,752,288,272)
}
else if room=rDistortionW2_6 or room=rBR_DemonCursor
{
  if bossBackShow=true
  {
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(0,0,160,384,false)
    draw_rectangle(672,0,704,384,false)
  }
}
