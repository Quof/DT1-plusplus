/*
element colors change (added): the Element Colors panel (oHUD's ecView 1/2; menuElemColorConfig): over the middle of the
screen, the four elements (each with its HUD gem) and their colours, and Set to Default Colors; while one is being
changed (ecView 2), a second box under it with its Red/Green/Blue bars, Default, and that element's things in the colour
(a colour zone, an element door, a switch's crystal, the Neo Guardian's orb, the HUD's gem, energy bar and spell name).
Styled like the menu's other boxes. Called at the end of oHUD's pause menu Draw, so it's on top of the rest of the menu,
which is dimmed behind it.
*/
var tW,tH1,tH2,tX,tY,tY2,tFY,tRow,tTY,tC,tV,tL,tR,tX1,tX2,tM,tName,tE,tPY,tZ,tD,tT;
tW=240
tH1=103 //title bar, header row, the four elements and Set to Default Colors, the help line
tH2=112 //title bar, Red/Green/Blue/Default, the preview, the help line
tX=view_xview[0]+(view_wview[0]-tW) div 2
tY=view_yview[0]+(view_hview[0]-(tH1+6+tH2)) div 2 //placed with room for the second box (it doesn't move when that opens)
draw_set_font(fnt_SubMenu)

//the rest of the menu, dimmed
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

//---------- the elements ----------
tFY=tY+88 //the line above the help
draw_set_alpha(0.9)
draw_set_color(colorDarkPink)
draw_rectangle(tX,tY,tX+tW,tY+tH1,false)
draw_set_alpha(1)
draw_set_color(colorLightPink)
draw_rectangle(tX,tY,tX+tW,tY+tH1,true)
draw_line(tX,tY+10,tX+tW,tY+10)
draw_line(tX,tFY,tX+tW,tFY)
draw_set_halign(fa_center)
draw_text(tX+tW/2,tY-2,"ELEMENT COLORS")
draw_set_color(colorDarkPurple)
draw_set_halign(fa_left)
draw_text(tX+16,tY+11,"Element")
draw_set_halign(fa_right)
draw_text(tX+tW-5,tY+11,"Color")
draw_set_halign(fa_left)
for(tRow=1;tRow<=5;tRow+=1)
{
  tTY=tY+13+tRow*12 //the row's text
  draw_set_color(colorDarkPurple)
  draw_rectangle(tX+4,tTY+3,tX+12,tTY+11,true)
  if tRow=5 {draw_text(tX+16,tTY,"Set to Default Colors")}
  else
  {
    scrDrawElemSprite(2,tRow,tX+16,tTY+2,1,1,0,1) //its HUD gem, in its colour
    draw_set_color(colorDarkPurple)
    draw_text(tX+30,tTY,global.elemName[tRow])
    draw_line(tX+34+string_width(global.elemName[tRow]),tTY+9,tX+tW-50,tTY+9) //out to its colour
    draw_rectangle(tX+tW-46,tTY+3,tX+tW-5,tTY+11,false) //the colour (a border, then the colour)
    draw_set_color(global.elemColor[tRow])
    draw_rectangle(tX+tW-45,tTY+4,tX+tW-6,tTY+10,false)
  }
}
draw_set_color(colorDarkPurple)
if ecView=1 {scrDrawHint(tX+4,tFY+1,"[J]: Change color     [K]: Back",fa_left,1)} //pad hints change: the gamepad's buttons while it's in use
else {draw_text(tX+4,tFY+1,"Changing " +global.elemName[ecPos] +"'s color (below)")}
draw_set_halign(fa_left)
draw_set_color(colorLightPink)
draw_rectangle(tX+2,tY+14+ecPos*12,tX+14,tY+26+ecPos*12,true) //cursor (the menu's own isn't drawn while the panel's open)

//---------- changing one: its Red/Green/Blue, Default, and what its things look like ----------
if ecView=2
{
  tE=ecPos
  tY2=tY+tH1+6
  tFY=tY2+100
  draw_set_alpha(0.9)
  draw_set_color(colorDarkPink)
  draw_rectangle(tX,tY2,tX+tW,tY2+tH2,false)
  draw_set_alpha(1)
  draw_set_color(colorLightPink)
  draw_rectangle(tX,tY2,tX+tW,tY2+tH2,true)
  draw_line(tX,tY2+10,tX+tW,tY2+10)
  draw_line(tX,tFY,tX+tW,tFY)
  draw_set_halign(fa_center)
  draw_text(tX+tW/2,tY2-2,string_upper(global.elemName[tE]) +" COLOR")
  draw_set_halign(fa_left)
  tC=global.elemColor[tE]
  tX1=tX+52 //the bars
  tX2=tX+tW-34
  for(tRow=1;tRow<=4;tRow+=1)
  {
    tTY=tY2+1+tRow*12
    draw_set_color(colorDarkPurple)
    draw_rectangle(tX+4,tTY+3,tX+12,tTY+11,true)
    if tRow=1 {tName="Red"; tV=color_get_red(tC); tL=make_color_rgb(0,color_get_green(tC),color_get_blue(tC)); tR=make_color_rgb(255,color_get_green(tC),color_get_blue(tC))}
    else if tRow=2 {tName="Green"; tV=color_get_green(tC); tL=make_color_rgb(color_get_red(tC),0,color_get_blue(tC)); tR=make_color_rgb(color_get_red(tC),255,color_get_blue(tC))}
    else if tRow=3 {tName="Blue"; tV=color_get_blue(tC); tL=make_color_rgb(color_get_red(tC),color_get_green(tC),0); tR=make_color_rgb(color_get_red(tC),color_get_green(tC),255)}
    else {tName="Default"}
    draw_text(tX+16,tTY,tName)
    if tRow<=3
    {
      //a bar from none of this one to all of it (the other two as they are), a marker on it, and the amount
      draw_rectangle(tX1-1,tTY+3,tX2+1,tTY+10,false)
      draw_rectangle_color(tX1,tTY+4,tX2,tTY+9,tL,tR,tR,tL,false)
      tM=tX1+round(tV*(tX2-tX1)/255)
      draw_set_color(colorDarkPurple)
      draw_rectangle(tM-1,tTY+1,tM+1,tTY+12,false)
      draw_set_color(colorLightPink)
      draw_line(tM,tTY+2,tM,tTY+11)
      draw_set_color(colorDarkPurple)
      draw_set_halign(fa_right)
      draw_text(tX+tW-5,tTY,string(tV))
      draw_set_halign(fa_left)
    }
    else
    {
      //the element's own colour, to compare with
      draw_rectangle(tX+tW-46,tTY+3,tX+tW-5,tTY+11,false)
      draw_set_color(global.elemColorDef[tE])
      draw_rectangle(tX+tW-45,tTY+4,tX+tW-6,tTY+10,false)
    }
  }

  //its things in the colour, on a dark backdrop like the game's: colour zone, element door, switch crystal, the Neo
  //Guardian's orb, the HUD's gem and energy bar, and the spell's name as the HUD shows it (the game's own colours: tZ, tD, tT)
  if tE=1 {tZ=c_red; tD=c_red; tT=make_color_rgb(255,125,125)}
  else if tE=2 {tZ=c_blue; tD=c_blue; tT=make_color_rgb(129,171,224)}
  else if tE=3 {tZ=c_green; tD=c_green; tT=make_color_rgb(33,225,33)}
  else {tZ=make_color_rgb(120,60,0); tD=make_color_rgb(175,77,30); tT=make_color_rgb(220,104,53)}
  tPY=tY2+64
  draw_set_alpha(0.85)
  draw_set_color(c_black)
  draw_rectangle(tX+4,tPY,tX+tW-4,tPY+33,false)
  draw_set_alpha(1)
  draw_set_color(colorLightPink)
  draw_rectangle(tX+4,tPY,tX+tW-4,tPY+33,true)
  draw_set_color(scrElemColor(tE,tZ)) //colour zone, drawn as oColorZone draws them
  draw_set_alpha(0.5)
  draw_rectangle(tX+12,tPY+5,tX+35,tPY+28,false)
  draw_set_alpha(0.9)
  draw_rectangle(tX+12,tPY+5,tX+35,tPY+28,true)
  draw_set_alpha(1)
  draw_sprite_ext(sElementBarrier,0,tX+46,tPY+1,1,0.5,0,scrElemColor(tE,tD),1) //element door (half height)
  scrDrawElemSprite(0,tE,tX+73,tPY+16,1,1,0,1) //switch crystal
  scrDrawElemSprite(1,tE,tX+101,tPY+17,1,1,0,1) //the Neo Guardian's orb
  scrDrawElemSprite(2,tE,tX+122,tPY+12,1,1,0,1) //HUD gem
  scrDrawElemSprite(3,tE,tX+139,tPY+29,1,-24,0,1) //HUD energy bar
  draw_set_color(scrElemColor(tE,tT)) //the spell's name on the HUD
  draw_text(tX+152,tPY+11,string_upper(global.elemName[tE]))

  draw_set_color(colorDarkPurple)
  if ecEditPos<=3 {scrDrawHint(tX+4,tFY+1,"[A] [D]: Change     [K]: Back",fa_left,1)} //pad hints change: the gamepad's buttons while it's in use
  else {scrDrawHint(tX+4,tFY+1,"[J]: Its own color     [K]: Back",fa_left,1)}
  draw_set_halign(fa_left)
  draw_set_color(colorLightPink)
  draw_rectangle(tX+2,tY2+2+ecEditPos*12,tX+14,tY2+14+ecEditPos*12,true) //cursor
}
draw_set_alpha(1)
draw_set_halign(fa_left)
