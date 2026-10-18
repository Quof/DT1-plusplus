/*
element wheel change (added): Element Wheel Button and Right Stick Element Swap (pause menu, Controls page, under DPad
Spells; both off to begin with). Called by characterStepEvent right after the keys are read, so not while the game is
paused (menus, cutscenes) or in a summon.

Element Wheel: its button (global.ctrlElemWheel / the gamepad's action 23, set in Keyboard / Gamepad Controls) brings
the wheel up around the player as soon as it's pressed (scrElemWheelDraw), and it stays up while the button's held.
While it's up, a direction pressed picks an element: Up Fire, Right Water, Down Wind, Left Earth (a direction already
held when it came up doesn't pick: it has to be pressed). The directions still move the player as usual (the user's
call). When the button's let go with nothing picked: Physical, the middle of the wheel.
No slowdown (the user's call). (A tap no longer goes back to the element before, and the wheel no longer waits for a
hold or stops the player: the user's call.)

Right Stick Element Swap: the right stick flicked picks the same way (Up Fire, Right Water, Down Wind, Left Earth), R3
Physical: scrGamepadPoll's actions 24-28. Game actions set to the right stick or R3 are off then (scrPadRSOff).
*/
var tHeld,tDirs,tNew,tPick;

//---------- Right Stick Element Swap ----------
if global.optRightStickElem
{
  if scrPadPressed(24) {scrElemSet(1)}
  else if scrPadPressed(25) {scrElemSet(2)}
  else if scrPadPressed(26) {scrElemSet(3)}
  else if scrPadPressed(27) {scrElemSet(4)}
  else if scrPadPressed(28) {scrElemSet(0)}
}

//---------- Element Wheel ----------
tHeld=0
if global.optElemWheel {tHeld=(keyboard_check(ord(global.ctrlElemWheel)) or scrPadHeld(23))}
//frames went by without this (the game was paused, or a summon): the wheel closes without doing anything, and a button
//still held has to be let go first. Also the player's first frame (ewFrame starts at -10)
if global.gpFrames>ewFrame+1 {ewOn=0; ewHeld=tHeld}
ewFrame=global.gpFrames //(global.gpFrames counts frames, scrGamepadPoll)
tDirs=kUp+2*kRight+4*kDown+8*kLeft //the directions held, as just read
if tHeld and !ewHeld //pressed: the wheel comes up
{
  ewOn=1
  ewPick=-1
  ewDirs=tDirs //the directions held now don't pick (they have to be pressed)
}
if ewOn
{
  if tHeld
  {
    tNew=tDirs-(tDirs&ewDirs) //the directions pressed since the last frame
    tPick=-1
    if tNew&1 {tPick=1} else if tNew&2 {tPick=2} else if tNew&4 {tPick=3} else if tNew&8 {tPick=4}
    if tPick>=0
    {
      scrElemSet(tPick)
      ewPick=tPick
    }
    ewDirs=tDirs
  }
  else //let go
  {
    if ewPick<0 {scrElemSet(0)} //nothing picked: Physical
    ewOn=0
  }
}
ewHeld=tHeld
