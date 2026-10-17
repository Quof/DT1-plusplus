//gamepad change (added): returns 1 on the frame any of the gamepad's action buttons is pressed (Jump, Attack, Use Tech,
//Cast Spell, Menu Confirm/Cancel), if Gamepad Input is on. The quick-time events ask for keyboard letters ([X], [F], ...),
//which a gamepad doesn't have, so on a gamepad any of these does
var i;
if !global.optGamePad {return 0}
for(i=5;i<=8;i+=1) {if global.gpPressed[i] {return 1}}
return global.gpPressed[17] or global.gpPressed[18]
