/*
dpad spells change (added): the HUD's top right while DPad Spells is on, drawn by oHUD in place of the spell/technique
box (sTechDisplay): the D-pad of the element on as a cross, its spells' names in the element's colour (Physical has no
spells: the Techniques set's D-pad, in PHYSICAL's gold), and RAVE MODE READY centred under it. No rave or cast bar (the
user's call). oHUD calls it before the status effect icons, so they stay on top where a wide cross reaches them
(x 144-215).
*/
var tR,tTop,e,tElemCol,s,tSp,tNm,tCol,tWm,tWl,tVW,tHW,tCX,uL,uR,cL,cR,k,tN,tLearned,tW,tHWmax;
tR=view_xview[0]+442 //the right edge the widest cross reaches: 2px left of the element meter (x+445)
tTop=view_yview[0]+6 //the cross's top row; its edge is the HUD's top line (y+4)
e=global.p1CurrentElement
//the names' colour: the element's, as the box's spell name was (in the colour picked for it: Element Colors, Options
//Set 3)
if e=1 {tElemCol=make_color_rgb(255,125,125)}
else if e=2 {tElemCol=make_color_rgb(129,171,224)}
else if e=3 {tElemCol=make_color_rgb(33,225,33)}
else if e=4 {tElemCol=make_color_rgb(220,104,53)}
else {e=0; tElemCol=make_color_rgb(248,192,72)}
tElemCol=scrElemColor(e,tElemCol)

//the cross: the spells on its four boxes (DPad Spells, Controls page), Up above, Down below, the middle box's in the
//centre with the Left/Right one on both sides of it, on a backdrop shaped like the D-pad (brown edge, gold rail, navy).
//Its centre stays put whichever element is on: it's as far right as the widest of the five sets' crosses lets it be
//(that one's edge at tR), so it only moves when the boxes are changed or a spell on one is learned. Spells not learned
//yet show as "(Hidden)", dimmed (the Controls page's D-pad panel says "(Spell Inaccessible)"); nothing is lit for the
//direction held. Not drawn while the pause menu is open (nor is RAVE MODE READY, which goes with it)
if !(global.gamePaused and menuOpen)
{
  draw_set_font(fnt_SubMenu)
  tHWmax=0
  for(k=0;k<=4;k+=1) //the five sets (0 techniques, 1-4 fire/water/wind/earth): the names their crosses show
  {
    for(s=0;s<4;s+=1) //the boxes' slots: 0 middle, 1 Up, 2 Left/Right, 3 Down
    {
      tSp=global.dpsSpell[k,s]
      tN[k,s]="-" //no spell on that box
      tLearned[k,s]=0
      if tSp>=1 and tSp<=global.dpsCount[k]
      {
        if scrDPadSpellUnlocked(k,tSp) {tN[k,s]=global.dpsName[k,tSp]; tLearned[k,s]=1}
        else {tN[k,s]="(Hidden)"} //not learned yet: its name isn't given away
      }
      if tN[k,s]="Mental Insurrection" {tN[k,s]="Insurrection"} //shortened here (the user's call; the Controls page's D-pad panel has room for the whole name)
    }
    tW=string_width(tN[k,2])*2+string_width(tN[k,0])+7*2+8 //its crossbar (as below)
    tW=max(tW,max(string_width(tN[k,1]),string_width(tN[k,0]),string_width(tN[k,3]))+8) //(or its upright, if wider)
    tHWmax=max(tHWmax,tW)
  }
  tCX=tR-2-ceil(tHWmax/2) //the widest set's crossbar edge ends at tR
  for(s=0;s<4;s+=1) //the element on's
  {
    tNm[s]=tN[e,s]
    if tLearned[e,s] {tCol[s]=tElemCol}
    else {tCol[s]=make_color_rgb(136,104,120)} //not learned yet (or no spell): dimmed
  }
  tWm=string_width(tNm[0])
  tWl=string_width(tNm[2])
  tVW=max(string_width(tNm[1]),tWm,string_width(tNm[3]))+8 //the cross's upright: its widest name, 4px past each side
  tHW=tWl*2+tWm+7*2+8 //its crossbar: the middle row, 7px between the names
  if tHW<tVW {tHW=tVW}
  uL=tCX-floor(tVW/2); uR=uL+tVW
  cL=tCX-floor(tHW/2); cR=cL+tHW
  for(k=2;k>=0;k-=1) //the backdrop: brown edge, gold rail, navy (each the upright and the crossbar, k pixels bigger)
  {
    if k=2 {draw_set_color(make_color_rgb(64,32,16))}
    else if k=1 {draw_set_color(make_color_rgb(248,192,72))}
    else {draw_set_color(make_color_rgb(32,48,64))}
    draw_rectangle(uL-k,tTop-k,uR+k,tTop+33+k,false) //upright: the three rows
    draw_rectangle(cL-k,tTop+11-k,cR+k,tTop+23+k,false) //crossbar: the middle row
  }
  //the names (the font's letters start 4px below where it's drawn)
  draw_set_halign(fa_center)
  draw_set_color(tCol[1]); draw_text(tCX,tTop-1,tNm[1]) //Up
  draw_set_color(tCol[0]); draw_text(tCX,tTop+10,tNm[0]) //middle
  draw_set_color(tCol[3]); draw_text(tCX,tTop+21,tNm[3]) //Down
  draw_set_color(tCol[2])
  draw_set_halign(fa_right); draw_text(tCX-ceil(tWm/2)-7,tTop+10,tNm[2]) //Left
  draw_set_halign(fa_left); draw_text(tCX+ceil(tWm/2)+7,tTop+10,tNm[2]) //Right
  //RAVE MODE READY, centred under the cross, a pixel below it (its bottom edge is y+41; the font's letters start 4px
  //below where it's drawn)
  draw_set_halign(fa_center)
  draw_set_color(make_color_rgb(248,192,72))
  if global.p1RaveEnergy>=oPlayer1.raveMax
    draw_text(tCX,tTop+33,"RAVE MODE READY")
}
draw_set_halign(fa_center) //as the box's text left it (oHUD's status effect numbers come next)
