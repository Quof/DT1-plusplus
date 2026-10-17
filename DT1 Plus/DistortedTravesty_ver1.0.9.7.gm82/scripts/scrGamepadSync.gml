//gamepad change (added): counts everything held on the gamepad right now as already held, so nothing reads as just
//pressed. Called after the Gamepad Controls list changes the controls (right after scrGamepadPoll), as the button
//that was just set is usually still held and could now be Menu Confirm or Cancel
var i;
for(i=1;i<=global.gpActions;i+=1)
{
  global.gpPrev[i]=global.gpHeld[i]
  global.gpPressed[i]=0
}
