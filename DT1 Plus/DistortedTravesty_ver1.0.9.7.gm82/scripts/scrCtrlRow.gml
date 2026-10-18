/*
element wheel change (added): argument0: a line of the Keyboard Controls / Gamepad Controls panel (menuControlWidget,
menuControlConfig). Returns the row of scrControlRows on that line: Element Wheel (row 17) is only in the panels while
Element Wheel Button is on (Controls page), so while it's off the lines from 17 on are the rows after it.
*/
if argument0>=17 and global.optElemWheel=0 {return argument0+1}
return argument0
