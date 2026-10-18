/*
element wheel change (added): argument0: the element to switch to (0 physical, 1 fire, 2 water, 3 wind, 4 earth), the
way the Cycle Element keys switch (characterStepEvent): their sound, and the spell equipped with it. Nothing happens if
it's on already. Used by the Element Wheel and Right Stick Element Swap (scrElemWheel).
*/
var e;
e=argument0
if e=global.p1CurrentElement {exit}
playSound(global.snd_MenuCancel,0,1)
global.p1CurrentElement=e
if e=0 {global.p1SpellEquip=""}
else if e=1 {global.p1SpellEquip=global.p1FireEquip}
else if e=2 {global.p1SpellEquip=global.p1WaterEquip}
else if e=3 {global.p1SpellEquip=global.p1WindEquip}
else if e=4 {global.p1SpellEquip=global.p1EarthEquip}
