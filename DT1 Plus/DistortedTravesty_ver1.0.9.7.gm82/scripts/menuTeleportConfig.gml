/*
teleport prompt change (added): the pause menu's "Do you want to teleport to the World Map?" question (oHUD's tpAsk;
menuTeleportWidget draws it). It was a Windows dialog (show_question); now it's a box over the menu, like the menu's
other panels: Yes and No (tpPos 1/2), the cursor on Yes as the dialog's default button was. Up/Down (or Left/Right)
move between them, [J] takes the one the cursor is on, [K] or the teleport key ([M], the gamepad's BACK) closes it.
Yes teleports as the dialog's Yes did.
Called by oHUD's Step while it's open (the rest of the menu waits, as it did while the dialog was up).
*/
var tMove,tOK,tBack;
tMove=(keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up) or scrPadPressed(3) or keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down) or scrPadPressed(4) or keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left) or scrPadPressed(1) or keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right) or scrPadPressed(2))
tOK=(keyboard_check_pressed(curConfirm) or scrPadPressed(17))
tBack=(keyboard_check_pressed(curCancel) or scrPadPressed(18) or keyboard_check_pressed(curTeleport) or scrPadPressed(22))

if tBack or (tOK and tpPos=2) //No: back to the menu
{
  playSound(global.snd_MenuCancel,0,1)
  tpAsk=0
  exit
}
if tOK //Yes: what the dialog's Yes did (oHUD's Step, the teleport)
{
  playSound(global.snd_MenuConfirm,0,1)
  tpAsk=0
  io_clear() //the key and button that said yes don't count as held on the World Map
  scrGamepadSync()
  global.gamePaused=false
  global.newMapX=0
  global.newMapY=0
  global.worldMapX=-1000
  global.worldMapY=-1000
  writeToPlayerGlobals()
  transition_kind=20
  transition_steps=30 //60fps change: the original steps: GM plays a room transition at the new room's own speed (30; oGame sets room_speed only once the room runs), so steps/gDeltaTime made it 2x/4x as long at 60/120fps
  scrSettingsSave() //settings change (added): the menu goes with the room
  room_goto(rWorldMap)
  exit
}
if tMove //two choices: any direction goes to the other one
{
  playSound(global.snd_MenuCursor,0,1)
  tpPos=3-tpPos
}
