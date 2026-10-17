/*
dpad spells change (added): draws the D-pad panel (oHUD's ctrlView 3; input: menuDPadSpellConfig) over the middle of the
screen: five boxes in a D-pad shape (middle, up, left, right, down) with the spell on each, styled like the menu's other
boxes, and the open box's list (dpsList=1) under it. Spells not learned yet are grey "(Spell Inaccessible)". Called at the end of
oHUD's pause menu Draw, after the map quote, so it's on top of the rest of the menu, which is dimmed behind it.
*/
var tW,tH,tX,tY,bw,bh,g,tBX,tBY,tB,i,e,tSpell,lx,ly,lw,lh,tGrey;
e=dpsElem
bw=112 //box (wide enough for "(Spell Inaccessible)")
bh=28
g=4
tW=3*bw+2*g+24
tH=144
tX=view_xview[0]+(view_wview[0]-tW) div 2
tY=view_yview[0]+(view_hview[0]-tH) div 2
tGrey=make_color_rgb(192,192,192) //spells not learned yet
//the boxes: 0 middle, 1 up, 2 left, 3 right, 4 down
tBX[0]=tX+12+bw+g; tBY[0]=tY+18+bh+g
tBX[1]=tBX[0];     tBY[1]=tY+18
tBX[2]=tX+12;      tBY[2]=tBY[0]
tBX[3]=tBX[0]+bw+g; tBY[3]=tBY[0]
tBX[4]=tBX[0];     tBY[4]=tBY[0]+bh+g
draw_set_font(fnt_SubMenu)

//the rest of the menu, dimmed
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

//the panel
draw_set_alpha(0.9)
draw_set_color(colorDarkPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,false)
draw_set_alpha(1)
draw_set_color(colorLightPink)
draw_rectangle(tX,tY,tX+tW,tY+tH,true)
draw_line(tX,tY+10,tX+tW,tY+10)
draw_line(tX,tY+116,tX+tW,tY+116)
draw_set_halign(fa_center)
draw_text(tX+tW/2,tY-2,global.dpsTitle[e])

//the D-pad: a darker cross behind the five boxes
draw_set_alpha(0.35)
draw_set_color(colorDarkPurple)
draw_rectangle(tBX[1]-3,tBY[1]-3,tBX[1]+bw+3,tBY[4]+bh+3,false)
draw_rectangle(tBX[2]-3,tBY[2]-3,tBX[3]+bw+3,tBY[3]+bh+3,false)
draw_set_alpha(1)
for(tB=0;tB<=4;tB+=1)
{
  draw_set_color(colorDarkPink)
  draw_rectangle(tBX[tB],tBY[tB],tBX[tB]+bw,tBY[tB]+bh,false)
  draw_set_color(colorLightPink)
  draw_rectangle(tBX[tB],tBY[tB],tBX[tB]+bw,tBY[tB]+bh,true)
  draw_set_color(colorDarkPurple)
  draw_text(tBX[tB]+bw/2,tBY[tB]+1,global.dpsBoxLabel[tB])
  i=global.dpsSpell[e,global.dpsBoxSlot[tB]]
  if scrDPadSpellUnlocked(e,i) {draw_text(tBX[tB]+bw/2,tBY[tB]+14,global.dpsName[e,i])}
  else if i>=1 and i<=global.dpsCount[e] {draw_set_color(tGrey); draw_text(tBX[tB]+bw/2,tBY[tB]+14,"(Spell Inaccessible)")}
  else {draw_text(tBX[tB]+bw/2,tBY[tB]+14,"-")}
}
//cursor on the box
draw_set_color(colorLightPink)
draw_rectangle(tBX[dpsBox]-2,tBY[dpsBox]-2,tBX[dpsBox]+bw+2,tBY[dpsBox]+bh+2,true)

//help
draw_set_halign(fa_left)
draw_set_color(colorDarkPurple)
if dpsList=0 {draw_text(tX+4,tY+117,"[J]: Choose for this box     [K]: Back")}
else {draw_text(tX+4,tY+117,"[J]: Put it on the box     [K]: Close the list")}
if e=0 {draw_text(tX+4,tY+129,"Hold a direction + Use Tech to use that box's technique")}
else {draw_text(tX+4,tY+129,"Hold a direction + Cast Spell to cast that box's spell")}

//the open box's list, under the box
if dpsList=1
{
  lw=128
  lh=global.dpsCount[e]*12+6
  lx=min(tBX[dpsBox],tX+tW-lw)
  ly=tBY[dpsBox]+bh+4
  draw_set_color(colorDarkPink)
  draw_rectangle(lx,ly,lx+lw,ly+lh,false)
  draw_set_color(colorLightPink)
  draw_rectangle(lx,ly,lx+lw,ly+lh,true)
  for(i=1;i<=global.dpsCount[e];i+=1)
  {
    if scrDPadSpellUnlocked(e,i)
    {
      if global.dpsSpell[e,global.dpsBoxSlot[dpsBox]]=i //the box's spell now
      {
        draw_set_color(colorLightPink)
        draw_rectangle(lx+4,ly+6+(i-1)*12,lx+12,ly+14+(i-1)*12,false)
      }
      draw_set_color(colorDarkPurple)
      draw_rectangle(lx+4,ly+6+(i-1)*12,lx+12,ly+14+(i-1)*12,true)
      draw_text(lx+16,ly+3+(i-1)*12,global.dpsName[e,i])
    }
    else
    {
      draw_set_color(tGrey)
      draw_text(lx+16,ly+3+(i-1)*12,"(Spell Inaccessible)")
    }
  }
  //cursor on the list's row
  draw_set_color(colorLightPink)
  draw_rectangle(lx+2,ly+4+(dpsListPos-1)*12,lx+14,ly+16+(dpsListPos-1)*12,true)
}
