/*
This makes the script wait for the next input command.
*/
//if keyboard_check_pressed(ord("J")) and bWaitForInput=true
if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) and bWaitForInput=true //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
{
  io_clear()
  scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
  bWaitForInput=false
  with oMessageCutscene
    instance_destroy()
  sceneProgress+=1
}
