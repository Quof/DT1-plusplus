/*
gamepad change (added): argument0, argument1: two actions (scrGamepadInit). Returns 1 if they can't be on the same
gamepad button (the Gamepad Controls list moves one of them when that happens). The game's actions (1-15) and Pause
Menu (16) each need their own button. Menu Confirm/Cancel (17/18) only count in menus, so they can share one with a
game action, but not with each other, a direction (menus are moved with them) or Pause Menu.
element wheel change: Element Wheel (23) is one of the game's actions too.
*/
var a,b,ga,gb;
a=argument0
b=argument1
if a=b {return 0}
//if a<=16 and b<=16 {return 1}
//if a>=17 and b>=17 {return 1}
//if a>=17 {return (b<=4 or b=16)}
//return (a<=4 or a=16)
ga=(a<=16 or a=23) //element wheel change (added): a game action (or Pause Menu), Element Wheel included
gb=(b<=16 or b=23) //element wheel change (added)
if ga and gb {return 1} //element wheel change: (as a<=16 and b<=16 was)
if !ga and !gb {return 1} //element wheel change: Menu Confirm and Cancel (as a>=17 and b>=17 was)
if !ga {return (b<=4 or b=16)} //element wheel change: (as a>=17 was)
return (a<=4 or a=16)
