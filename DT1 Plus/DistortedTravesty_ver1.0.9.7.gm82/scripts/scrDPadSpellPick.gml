/*
dpad spells change (added): argument0: e (0 techniques, 1-4 fire/water/wind/earth); argument1-4: Up, Down, Left, Right held
returns the spell/technique on that direction's box (the name the game uses, e.g. "FIREBALL"), or the middle box's if
that one isn't learned yet, or "" if neither is (then the one picked with Cycle Ability is used, as with DPad Spells off).
Up or Down counts over Left/Right (left/right is held to run); Up and Down together count as neither.
*/
var e,s,i;
e=argument0
if argument1 and !argument2 {s=1}
else if argument2 and !argument1 {s=3}
else if argument3 or argument4 {s=2}
else {s=0}
i=global.dpsSpell[e,s]
if !scrDPadSpellUnlocked(e,i) {i=global.dpsSpell[e,0]} //that box's isn't learned yet: the middle's
if !scrDPadSpellUnlocked(e,i) {return ""}
return global.dpsCode[e,i]
