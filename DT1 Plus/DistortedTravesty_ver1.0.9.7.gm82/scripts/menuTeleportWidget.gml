/*
teleport prompt change (added): draws the teleport question (oHUD's tpAsk; input: menuTeleportConfig) over the middle of
the screen: a TELEPORT box with the question, Yes and No, and its keys. Styled like the menu's other boxes (the System
page's). Called at the end of oHUD's pause menu Draw, so it's on top of the rest of the menu, which is dimmed behind it.
*/
var tQ,tW,tH,tX,tY,tFY,tRow;
tQ="Do you want to teleport to the World Map?"
draw_set_font(fnt_SubMenu)
tW=max(124,string_width(tQ)+12)
tH=65 //title bar, the question, Yes, No, the help line
tX=view_xview[0]+(view_wview[0]-tW) div 2
tY=view_yview[0]+(view_hview[0]-tH) div 2
tFY=tY+50 //the line above the help

//the rest of the menu, dimmed
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

draw_set_alpha(0.9)
draw_set_color(colorDarkPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,false)
draw_set_alpha(1)
draw_set_color(colorLightPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,true)
draw_line(tX,tY+10,tX+tW,tY+10)
draw_line(tX,tFY,tX+tW,tFY)
draw_set_halign(fa_center)
draw_text(tX+tW div 2,tY-2,"TELEPORT")
draw_set_color(colorDarkPurple)
draw_text(tX+tW div 2,tY+11,tQ)
draw_set_halign(fa_left)
for(tRow=1;tRow<=2;tRow+=1)
{
  draw_rectangle(tX+4,tY+14+tRow*12,tX+12,tY+22+tRow*12,true)
  if tRow=1 {draw_text(tX+16,tY+11+tRow*12,"Yes")} else {draw_text(tX+16,tY+11+tRow*12,"No")}
}
scrDrawHint(tX+4,tFY+1,"[J]: Select     [K]: Back",fa_left,1) //the gamepad's buttons while it's in use
draw_set_halign(fa_left)
draw_set_color(colorLightPink)
draw_rectangle(tX+2,tY+12+tpPos*12,tX+14,tY+24+tpPos*12,true) //cursor (the page's own is dimmed behind the box)
draw_set_alpha(1)
