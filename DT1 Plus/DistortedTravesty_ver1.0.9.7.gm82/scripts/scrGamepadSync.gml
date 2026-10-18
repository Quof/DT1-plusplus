//gamepad change (added): counts everything held on the gamepad right now as already held, so nothing reads as just
//pressed. Called after the Gamepad Controls list changes the controls (right after scrGamepadPoll), as the button
//that was just set is usually still held and could now be Menu Confirm or Cancel
//input bleed fix: and next to every io_clear() (and wherever a menu hands control back: Game Over, the world map, a new
//game): what's held now doesn't count as held at all until it's let go (global.gpLock, scrGamepadPoll), as io_clear
//makes GM forget held keys. Clearing only the presses wasn't enough: the player reads its own presses from held
//going on, so a still-held A jumped once the player had control again
var i;
for(i=1;i<=global.gpActions;i+=1)
{
  //global.gpPrev[i]=global.gpHeld[i]
  global.gpLock[i]=(global.gpLock[i] or global.gpHeld[i]) //input bleed fix: (one already locked stays locked)
  global.gpHeld[i]=0 //input bleed fix: from now on this frame too
  global.gpPrev[i]=0 //input bleed fix
  global.gpPressed[i]=0
}
