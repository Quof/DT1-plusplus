/*
controls change (added): the Keyboard Controls / Gamepad Controls panel of the pause menu's Controls page (oHUD's
ctrlView 1/2), drawn over the middle of the screen with every action in one list (rows: scrControlRows), styled like the
menu's other boxes. menuControlConfig moves through it and changes the keys/buttons. Called at the end of oHUD's pause
menu Draw, after the map quote, so it's on top of the rest of the menu, which is dimmed behind it.
*/
var tN,tFoot,tW,tH,tX,tY,tFY,tRow,tName,tText,tR;
//if ctrlView=1 {tN=global.kbRowCount; tFoot=1} else {tN=global.gpRowCount; tFoot=2}
//element wheel change: Element Wheel's row only while it's on (the lines are rows through scrCtrlRow), and one help line
//for the gamepad too: the pad isn't named any more (the user's call)
if ctrlView=1 {tN=global.kbRowCount} else {tN=global.gpRowCount}
tN-=1-global.optElemWheel
tFoot=1
tW=240
tH=31+(tN+1)*12+tFoot*12 //title bar, the rows and Set to Default Controls, then the help lines
tX=view_xview[0]+(view_wview[0]-tW) div 2
tY=view_yview[0]+(view_hview[0]-tH) div 2
tFY=tY+28+(tN+1)*12 //the line above the help
draw_set_font(fnt_SubMenu)

//the rest of the menu, dimmed
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

//the box
draw_set_alpha(0.9)
draw_set_color(colorDarkPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,false)
draw_set_alpha(1)
draw_set_color(colorLightPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,true)
draw_line(tX,tY+10,tX+tW,tY+10)
draw_line(tX,tFY,tX+tW,tFY)
draw_set_halign(fa_center)
if ctrlView=1 {draw_text(tX+tW/2,tY-2,"KEYBOARD CONTROLS")} else {draw_text(tX+tW/2,tY-2,"GAMEPAD CONTROLS")}

//the rows: action on the left, key/button on the right
draw_set_color(colorDarkPurple)
draw_set_halign(fa_left)
draw_text(tX+16,tY+11,"Action")
draw_set_halign(fa_right)
if ctrlView=1 {draw_text(tX+tW-5,tY+11,"Key")} else {draw_text(tX+tW-5,tY+11,"Button")}
draw_set_halign(fa_left)
for(tRow=1;tRow<=tN+1;tRow+=1)
{
  draw_rectangle(tX+4,tY+16+tRow*12,tX+12,tY+24+tRow*12,true)
  if tRow>tN {draw_text(tX+16,tY+13+tRow*12,"Set to Default Controls")}
  else
  {
    tR=scrCtrlRow(tRow) //element wheel change (added): the row on this line
    //tName=global.ctrlRowName[tRow]
    tName=global.ctrlRowName[tR] //element wheel change: see above
    if global.optRightIsForward=0 //"Right is Forward" off (Options Set 3): the dash keys go left/right
    {
      if tName="Dash Forward" {tName="Dash Right"}
      else if tName="Dash Back" {tName="Dash Left"}
    }
    draw_text(tX+16,tY+13+tRow*12,tName)
    if ctrlView=1
    {
      //tText=variable_global_get(global.kbRowVar[tRow])
      tText=variable_global_get(global.kbRowVar[tR]) //element wheel change: see above
      if tText=" " {tText="Space"}
      if tRow<=4 {tText+=" / Arrow " +tName} //the arrow keys always move too
    }
    else
    {
      //tText=scrGamepadName(global.gpBind[global.gpRowAct[tRow]])
      tText=scrGamepadName(global.gpBind[global.gpRowAct[tR]]) //element wheel change: see above
      if scrPadRSOff(global.gpRowAct[tR]) {tText+=" (off)"} //element wheel change (added): on the right stick or R3 while Right Stick Element Swap is on (they pick the element)
      if gpListen=1 and tRow=cursorPosY {tText="Press..."}
    }
    draw_set_halign(fa_right)
    draw_text(tX+tW-5,tY+13+tRow*12,tText)
    draw_set_halign(fa_left)
  }
}

//help (element wheel change: no longer the pad being read under it, see above)
if ctrlView=1 {scrDrawHint(tX+4,tFY+1,"[J]: Change key     [K]: Back",fa_left,1)} //pad hints change: the gamepad's buttons while it's in use
else
{
  if gpListen=1 {draw_text(tX+4,tFY+1,"Press a gamepad button...     [K]: Cancel")} //(the keyboard's [K]: the pad's buttons are being read)
  else {scrDrawHint(tX+4,tFY+1,"[J]: Change button     [K]: Back",fa_left,1)} //pad hints change: see above
  //element wheel change: the pad isn't named (the user's call)
  //if global.gpDevice<0 {tText="Gamepad: None found"}
  //else
  //{
  //  tText=global.gpName
  //  if string_length(tText)>30 {tText=string_copy(tText,1,29) +"."}
  //  tText="Gamepad: " +tText
  //}
  //if global.optGamePad=0 {tText+=" (Input: Off)"}
  //draw_text(tX+4,tFY+13,tText)
}

//cursor (the menu's own cursor isn't drawn while the panel is open)
draw_set_color(colorLightPink)
draw_rectangle(tX+2,tY+14+cursorPosY*12,tX+14,tY+26+cursorPosY*12,true)
