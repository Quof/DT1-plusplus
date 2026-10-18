/*
pad hints change (added): argument0: a menu hint's key token ("J" for [J], "U or I" is split by scrDrawHint). Returns the
sKeyPressPad frame of the gamepad button that does the same in the menus (scrPadIcon), or -1 if it isn't one (it's drawn
as written then). The menus' keys are fixed ([J] confirm, [K] cancel, [L] swap lists, [U]/[I] tabs, [M] teleport, [WASD]
move); the pad's are Menu Confirm/Cancel, Pause Menu and the directions as set, and the fixed Y, L1/R1 and BACK.
*/
var t;
t=argument0
if t="J" {return scrPadIcon(global.gpBind[17])} //Menu Confirm
if t="K" {return scrPadIcon(global.gpBind[18])} //Menu Cancel
if t="L" {return scrPadIcon(4)} //Y: swaps a menu's lists
if t="O" {return scrPadIcon(4)} //Y: Options & Controls on the title screen
if t="U" {return scrPadIcon(5)} //L1: the pause menu's tab before
if t="I" {return scrPadIcon(6)} //R1: the tab after
if t="M" {return scrPadIcon(9)} //BACK: teleport (pause menu)
if t="P" {return scrPadIcon(global.gpBind[16])} //Pause Menu
if t="A" or t="Left" {return scrPadIcon(global.gpBind[1])}
if t="D" or t="Right" {return scrPadIcon(global.gpBind[2])}
if t="W" or t="Up" {return scrPadIcon(global.gpBind[3])}
if t="S" or t="Down" {return scrPadIcon(global.gpBind[4])}
if t="WASD" {return scrPadIcon(13)} //the d-pad
//shmup hints change (added): the game's own actions, for hints written with them (the ship: oEvShipInterface)
if t="Jump" {return scrPadIcon(global.gpBind[5])}
if t="Attack" {return scrPadIcon(global.gpBind[6])}
if t="Tech" {return scrPadIcon(global.gpBind[7])} //Use Tech
return -1
