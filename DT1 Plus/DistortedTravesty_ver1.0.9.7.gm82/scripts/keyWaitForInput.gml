/*
This makes the script wait for the next input command.
*/
if keyboard_check_pressed(ord("J")) and bWaitForInput=true
{
  io_clear()
  bWaitForInput=false
  with oMessageCutscene
    instance_destroy()
  sceneProgress+=1
}
