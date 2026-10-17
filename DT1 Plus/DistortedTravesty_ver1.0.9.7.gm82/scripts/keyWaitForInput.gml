/*
This makes the script wait for the next input command.
*/
//if keyboard_check_pressed(ord("J")) and bWaitForInput=true
if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) and bWaitForInput=true //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
{
  io_clear()
  bWaitForInput=false
  with oMessageCutscene
    instance_destroy()
  sceneProgress+=1
}
