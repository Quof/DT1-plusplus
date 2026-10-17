/*
pad hints change (added): textDropShadow for a menu hint (scrDrawHint): the shadow's passes are the text only, then the
text in its colour with the gamepad buttons' icons while the gamepad is in use. Without it, or without a [key] in the
text, it's textDropShadow itself.
argument0: string, argument1: x, argument2: y, argument3: text colour, argument4: shadow colour,
argument5: type of drop shadow (as textDropShadow), argument6: fa_left, fa_center or fa_right
*/
var s,tX,tY,tCol,tSh,tType,tA;
s=argument0
tX=argument1
tY=argument2
tCol=argument3
tSh=argument4
tType=argument5
tA=argument6
draw_set_halign(tA)
if global.gpLastUsed!=1 or string_pos("[",s)=0 {textDropShadow(s,tX,tY,tCol,tSh,tType); exit}
draw_set_color(tSh)
if tType=0 {scrDrawHint(tX,tY+1,s,tA,0)}
else if tType=1 {scrDrawHint(tX,tY+1,s,tA,0); scrDrawHint(tX+1,tY,s,tA,0); scrDrawHint(tX+1,tY+1,s,tA,0)}
else if tType=2 {scrDrawHint(tX,tY+1,s,tA,0); scrDrawHint(tX+1,tY,s,tA,0); scrDrawHint(tX,tY-1,s,tA,0); scrDrawHint(tX-1,tY,s,tA,0)}
else if tType=3 {scrDrawHint(tX+1,tY+1,s,tA,0); scrDrawHint(tX+1,tY-1,s,tA,0); scrDrawHint(tX-1,tY+1,s,tA,0); scrDrawHint(tX-1,tY-1,s,tA,0)}
else
{
  scrDrawHint(tX,tY+1,s,tA,0); scrDrawHint(tX+1,tY,s,tA,0); scrDrawHint(tX,tY-1,s,tA,0); scrDrawHint(tX-1,tY,s,tA,0)
  scrDrawHint(tX+1,tY+1,s,tA,0); scrDrawHint(tX+1,tY-1,s,tA,0); scrDrawHint(tX-1,tY+1,s,tA,0); scrDrawHint(tX-1,tY-1,s,tA,0)
}
draw_set_color(tCol)
scrDrawHint(tX,tY,s,tA,1)
