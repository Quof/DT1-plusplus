/*
dpad spells change (added): the HUD's top-right box while DPad Spells is on, drawn by oHUD instead of sTechDisplay with
the spell and technique names: sTechDisplayDPad (sTechDisplay without the technique line's half: the same width and top,
27 tall) with the element on, written as the spell's name was (fnt_SubMenu, its colour, the same place), and the rave
bar (the cast's progress over it while casting) along the box's bottom, under its gold rail: the bar's three rows are
the box's last inner rows, so its ends follow the frame's bottom curve. "RAVE MODE READY" as before.
*/
var tX,tY,tName,tColor,tPass,tSpr,tFrac,tFill,tL,tR,i,tRunY,tRunL,tRunR;
tX=view_xview[0]+295 //where sTechDisplay is
tY=view_yview[0]+4
draw_sprite(sTechDisplayDPad,0,tX,tY)

//the element on, where and as the spell's name was drawn
if global.p1CurrentElement=1 {tName="FIRE"; tColor=make_color_rgb(255,125,125)}
else if global.p1CurrentElement=2 {tName="WATER"; tColor=make_color_rgb(129,171,224)}
else if global.p1CurrentElement=3 {tName="WIND"; tColor=make_color_rgb(33,225,33)}
else if global.p1CurrentElement=4 {tName="EARTH"; tColor=make_color_rgb(220,104,53)}
else {tName="PHYSICAL"; tColor=make_color_rgb(248,192,72)}
tColor=scrElemColor(global.p1CurrentElement,tColor) //element colors change (added): in the colour picked for its element (Element Colors, Options Set 3)
draw_set_color(tColor)
draw_set_halign(fa_center)
draw_set_font(fnt_SubMenu)
draw_text(tX+74,tY+3,tName)

//the bar: rave energy (the rave's time left while it's on), then the cast's progress over it while casting. It fills
//from the left over 130 pixels. Its runs in the sprite (row, x from, x up to): rows 18-20, the box's last inner rows;
//the last one also shows through the bottom corner curls' little loops (x 11-12 and 135-136), which would otherwise
//stay navy, a dark notch in a filled bar
tRunY[0]=0; tRunL[0]=9;   tRunR[0]=139
tRunY[1]=1; tRunL[1]=10;  tRunR[1]=138
tRunY[2]=2; tRunL[2]=11;  tRunR[2]=13
tRunY[3]=2; tRunL[3]=18;  tRunR[3]=130
tRunY[4]=2; tRunL[4]=135; tRunR[4]=137
for(tPass=0;tPass<2;tPass+=1)
{
  if tPass=0
  {
    tSpr=sRaveTrack
    if oPlayer1.bRaveActive=false {tFrac=global.p1RaveEnergy/oPlayer1.raveMax}
    else {tFrac=oPlayer1.raveTime/oPlayer1.raveTimeTotal}
  }
  else
  {
    if oPlayer1.attackState!=oPlayer1.ACT_CASTING {break}
    tSpr=sSpiritTrack
    tFrac=oPlayer1.castPercent
  }
  tFill=tX+9+tFrac*130
  for(i=0;i<5;i+=1)
  {
    tL=tX+tRunL[i]
    tR=min(tX+tRunR[i],tFill)
    if tR>tL {draw_sprite_part_ext(tSpr,0,0,tRunY[i],1,1,tL,tY+18+tRunY[i],tR-tL,1,c_white,1)} //the track sprite's row, stretched
  }
}

draw_set_color(make_color_rgb(248,192,72))
if global.p1RaveEnergy>=oPlayer1.raveMax
  draw_text(tX+74,tY+28,"RAVE MODE READY")
