/*
dpad spells change (added): argument0: e (0 techniques, 1-4 fire/water/wind/earth), argument1: spell number (scrDPadSpellInit)
returns 1 if the player has learned it (its techLv/element level, as the Techniques page of the pause menu shows them)
*/
var lv;
if argument1<1 or argument1>global.dpsCount[argument0] {return 0}
if argument0=0 {lv=global.techLv}
else if argument0=1 {lv=global.fireLv}
else if argument0=2 {lv=global.waterLv}
else if argument0=3 {lv=global.windLv}
else {lv=global.earthLv}
return (lv>=global.dpsReq[argument0,argument1])
