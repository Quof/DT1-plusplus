/*
element colors change (added): draws one of the sprites with the element colours in their frames in the colour picked
for the element (Element Colors, Options Set 3): like draw_sprite_ext of frame argument1-1.
argument0: the sprite, 0 sPuzzleCrystal (the switches' crystals), 1 sElementalOrbs (the Neo Guardian's orbs),
           2 sCurrentElement (the HUD's gem), 3 sElementTrack (the HUD's energy bars)
argument1: the element (1 fire, 2 water, 3 wind, 4 earth)
argument2, argument3: x, y; argument4, argument5: x and y scale; argument6: angle; argument7: alpha
With the element's own colour it's the frame itself; changed, it's the frame's layers (scrElemColorInit), each shade of
the colour tinted as scrElemColor makes it.
*/
var tK,tE,tF,i;
tK=argument0
tE=argument1
if tE<1 or tE>4 or global.elemColor[tE]=global.elemColorDef[tE]
{
  draw_sprite_ext(global.ecSprOrig[tK],tE-1,argument2,argument3,argument4,argument5,argument6,c_white,argument7)
  exit
}
tF=global.ecLvFirst[tK,tE]
draw_sprite_ext(global.ecSprMask[tK],tF,argument2,argument3,argument4,argument5,argument6,c_white,argument7) //the rest of it
for(i=1;i<=global.ecLvN[tK,tE];i+=1)
{
  draw_sprite_ext(global.ecSprMask[tK],tF+i,argument2,argument3,argument4,argument5,argument6,scrElemColor(tE,global.ecLvCol[tK,tF+i]),argument7)
}
