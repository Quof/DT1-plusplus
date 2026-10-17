//gamepad change (added): argument0: an action (scrGamepadInit). Returns 1 while it's held on the gamepad, if Gamepad
//Input is on (pause menu: Controls). Used next to the keyboard checks: keyboard_check(...) or scrPadHeld(action)
return global.optGamePad and global.gpHeld[argument0]
