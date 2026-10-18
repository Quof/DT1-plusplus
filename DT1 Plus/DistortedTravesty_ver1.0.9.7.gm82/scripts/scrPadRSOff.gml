/*
element wheel change (added): argument0: an action (scrGamepadInit). Returns 1 if it's off because Right Stick Element
Swap is on (Controls page) and its button is R3 or the right stick, which pick the element then (scrGamepadPoll's
actions 24-28, scrElemWheel). Only the game's actions (1-16, Element Wheel 23): Menu Confirm/Cancel are for the menus,
where the right stick picks nothing. Cycle Ability is on the right stick by default.
*/
var c;
if !global.optRightStickElem {return 0}
if argument0>16 and argument0!=23 {return 0}
c=global.gpBind[argument0]
return (c=12 or (c>=21 and c<=24))
