/*
gamepad change (added): argument0, argument1: two actions (scrGamepadInit). Returns 1 if they can't be on the same
gamepad button (the Gamepad Controls list moves one of them when that happens). The game's actions (1-15) and Pause
Menu (16) each need their own button. Menu Confirm/Cancel (17/18) only count in menus, so they can share one with a
game action, but not with each other, a direction (menus are moved with them) or Pause Menu.
*/
var a,b;
a=argument0
b=argument1
if a=b {return 0}
if a<=16 and b<=16 {return 1}
if a>=17 and b>=17 {return 1}
if a>=17 {return (b<=4 or b=16)}
return (a<=4 or a=16)
