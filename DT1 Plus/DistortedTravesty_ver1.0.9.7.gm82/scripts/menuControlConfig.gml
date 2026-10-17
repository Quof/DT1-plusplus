/*
This script is called in the HUD pause menu.
It is used to for setting up the controls.
(This could just go in the execute code, but it takes too long to load all that.)

gamepad change: the page starts on three options (oHUD's ctrlView 0): Keyboard Controls (ctrlView 1), Gamepad Controls
(ctrlView 2, ported from DT3's GAMEPAD list) and Gamepad Input On/Off. [K] (the gamepad's Menu Cancel) goes back to the
three options. In the gamepad list [J] picks an action, then the next button pressed on the pad is set for it
(scrGamepadCapture); an action that can't share that button with it (scrPadClash) gets its old one. [K] or 5 seconds
of nothing cancels.
controls change: Keyboard Controls / Gamepad Controls open a panel over the middle of the screen with every action in
one list (rows: scrControlRows, drawn by menuControlWidget), instead of two lists swapped with [L]. The keyboard list
has Pause Menu ([P], global.ctrlPause) too, and Dash Forward / Dash Back (the Dash Right / Dash Left keys) in that order.
The original keyboard code is at the end, commented out.
*/
var i,ii,tGPCode,tGPAct,tGPOld,tRow,tVar,tOld,keyHelpInfo,keyChange;

//---------- Gamepad Controls: waiting for a button on the pad ---------- //gamepad change (added)
if ctrlView=2 and gpListen=1
{
  gpListenTime+=gDeltaTime //30fps ticks, for the 5 seconds below
  if global.gpDevice<0 {gpListen=0; playSound(global.snd_MenuCancel,0,1)} //the pad was unplugged
  else if gpWaitRelease=1 //everything on the pad has to be let go first (the button that picked the action is still held)
  {
    if scrGamepadCapture()=0 {gpWaitRelease=0}
  }
  else
  {
    tGPCode=scrGamepadCapture()
    if tGPCode>0
    {
      tGPAct=global.gpRowAct[cursorPosY] //controls change: one list (it was [subCursorPos,cursorPosY])
      tGPOld=global.gpBind[tGPAct]
      global.gpBind[tGPAct]=tGPCode
      //an action that can't share this button with it gets its old button, unless something that one can't share a
      //button with is on that one too; then it's left without one (-)
      for(i=1;i<=18;i+=1)
      {
        if i!=tGPAct and global.gpBind[i]=tGPCode and scrPadClash(i,tGPAct)
        {
          global.gpBind[i]=tGPOld
          for(ii=1;ii<=18;ii+=1) {if ii!=i and tGPOld>0 and global.gpBind[ii]=tGPOld and scrPadClash(i,ii) {global.gpBind[i]=0}}
        }
      }
      gpListen=0
      playSound(global.snd_MenuConfirm,0,1)
      //the button is still held, and may now be Menu Confirm or Cancel: count it as already held
      scrGamepadPoll()
      scrGamepadSync()
    }
  }
  //cancel: the keyboard's [K], or 5 seconds of nothing
  if gpListen=1 and (gpListenTime>=150 or keyboard_check_pressed(curCancel))
  {
    gpListen=0
    playSound(global.snd_MenuCancel,0,1)
  }
  exit //nothing else on the page reacts while the pad's buttons are being read
}

//---------- DPad Spells: an element's D-pad panel ---------- //dpad spells change (added)
if ctrlView=3 {menuDPadSpellConfig(); exit}

//if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
if keyboard_check_pressed(curUp) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPosY=1
  {
    cursorPosY=menuMax
    menuCursorY+=cursorIncY*(menuMax-1)
  }
  else
  {
    cursorPosY-=1
    menuCursorY-=cursorIncY
  }
}
//if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
if keyboard_check_pressed(curDown) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //gamepad change: and the gamepad's Down (scrGamepadInit)
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPosY=menuMax
  {
    cursorPosY=1
    menuCursorY-=cursorIncY*(menuMax-1)
  }
  else
  {
    cursorPosY+=1
    menuCursorY+=cursorIncY
  }
}
//---------- back from a panel to the three options ---------- //gamepad change (added)
if ctrlView>0 and (keyboard_check_pressed(curCancel) or scrPadPressed(18))
{
  playSound(global.snd_MenuCancel,0,1)
  tRow=ctrlView //the option that opened the panel
  ctrlView=0
  subCursorPos=1
  menuMax=4+5*global.optDPadSpells //dpad spells change: with DPad Spells and (while it's on) its element rows
  cursorPosY=tRow
  menuCursorX=menuMainX+18
  menuCursorY=menuMainY+28+cursorIncY*(tRow-1) //controls change: the options are at the top of a smaller box now
  exit
}
//if keyboard_check_pressed(curConfirm)
if (keyboard_check_pressed(curConfirm) or scrPadPressed(17)) //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
{
  if ctrlView=0 //gamepad change (added): the three options
  {
    playSound(global.snd_MenuConfirm,0,1)
    if cursorPosY<=2 //Keyboard Controls / Gamepad Controls: open its panel (controls change: one list, menuControlWidget)
    {
      ctrlView=cursorPosY
      subCursorPos=1
      if ctrlView=1 {menuMax=global.kbRowCount+1} else {menuMax=global.gpRowCount+1} //the actions, then Set to Default Controls
      cursorPosY=1
    }
    else if cursorPosY=3 {global.optGamePad=!global.optGamePad} //Gamepad Input On/Off
    else if cursorPosY=4 //dpad spells change (added): DPad Spells (DT2 Style) On/Off; its element rows show under it while it's on
    {
      global.optDPadSpells=!global.optDPadSpells
      menuMax=4+5*global.optDPadSpells
    }
    else //dpad spells change (added): Fire / Water / Wind / Earth / Techniques: open its D-pad panel (menuDPadSpellConfig)
    {
      ctrlView=3
      if cursorPosY=9 {dpsElem=0} else {dpsElem=cursorPosY-4}
      dpsBox=0
      dpsList=0
      dpsListPos=1
    }
  }
  else if ctrlView=2 //gamepad change (added): Gamepad Controls
  {
    if cursorPosY=menuMax //Set to Default Controls
    {
      playSound(global.snd_MenuConfirm,0,1)
      scrGamepadDefaults()
      scrGamepadPoll()
      scrGamepadSync()
    }
    else if global.gpDevice<0 {playSound(global.snd_MenuCancel,0,1)} //no gamepad to read the new button from
    else
    {
      playSound(global.snd_MenuConfirm,0,1)
      gpListen=1
      gpListenTime=0
      gpWaitRelease=1
      for(i=0;i<16;i+=1) {global.gpCapBase[i]=global.gpAxis[i]}
    }
  }
  else //controls change: Keyboard Controls, one list (the original two-list code is at the end, commented out)
  {
    playSound(global.snd_MenuConfirm,0,1)
    if cursorPosY=menuMax {scrKeyboardDefaults()} //Set to Default Controls
    else
    {
      tVar=global.kbRowVar[cursorPosY] //the global the row's key is kept in (scrControlRows)
      tOld=variable_global_get(tVar)
      keyHelpInfo="Enter the key you would like to#change this action to and press Enter."
      keyChange=string_upper(get_string(keyHelpInfo,tOld))
      io_clear() //what was typed into the box doesn't count as pressed in the game
      if keyChange="" {keyChange=tOld} //nothing entered: the key stays
      //Pause Menu can't be one of the pause menu's own keys ([WASD], [J]/[K]/[L], [U]/[I] tabs, [M] teleport, [1]-[9]
      //tabs): pressing that key in the menu would close it
      if tVar="ctrlPause" and (string_length(keyChange)!=1 or string_pos(keyChange,"WASDJKLUIM123456789")>0)
      {
        playSound(global.snd_MenuCancel,0,1)
        keyChange=tOld
      }
      variable_global_set(tVar,keyChange)
    }
  }
}
//dpad spells change (added): the page's cursor, from its row (the element rows under DPad Spells are indented)
if ctrlView=0
{
  menuCursorX=menuMainX+18
  if cursorPosY>=5 {menuCursorX+=12}
  menuCursorY=menuMainY+28+cursorIncY*(cursorPosY-1)
}
//controls change: no lists to swap with [L] any more: each panel has every action in one list
//if keyboard_check_pressed(curChange)
//{
//  playSound(global.snd_MenuCursor,0,1)
//  bChangedMenu=true
//  subCursorPos+=1
//  if subCursorPos>2 {subCursorPos=1}
//}

/* controls change: the original Keyboard Controls code (two lists: subCursorPos 1 and 2)
if keyboard_check_pressed(curConfirm)
{
  playSound(global.snd_MenuConfirm,0,1)
  var keyHelpInfo,keyChange;
  keyHelpInfo="Enter the key you would like to#change this action to and press Enter."
  if subCursorPos=1
  {
    if cursorPosY=1 //Up
    {
      keyChange=get_string(keyHelpInfo,global.ctrlUp)
      global.ctrlUp=string_upper(keyChange)
    }
    else if cursorPosY=2 //Down
    {
      keyChange=get_string(keyHelpInfo,global.ctrlDown)
      global.ctrlDown=string_upper(keyChange)
    }
    else if cursorPosY=3 //Left
    {
      keyChange=get_string(keyHelpInfo,global.ctrlLeft)
      global.ctrlLeft=string_upper(keyChange)
    }
    else if cursorPosY=4 //Right
    {
      keyChange=get_string(keyHelpInfo,global.ctrlRight)
      global.ctrlRight=string_upper(keyChange)
    }
    else if cursorPosY=5 //Attack
    {
      keyChange=get_string(keyHelpInfo,global.ctrlAttack)
      global.ctrlAttack=string_upper(keyChange)
    }
    else if cursorPosY=6 //Jump
    {
      keyChange=get_string(keyHelpInfo,global.ctrlJump)
      global.ctrlJump=string_upper(keyChange)
    }
    else if cursorPosY=7 //Use Tech
    {
      keyChange=get_string(keyHelpInfo,global.ctrlTech)
      global.ctrlTech=string_upper(keyChange)
    }
    else if cursorPosY=8 //Cast Spell
    {
      keyChange=get_string(keyHelpInfo,global.ctrlSpell)
      global.ctrlSpell=string_upper(keyChange)
    }
    else if cursorPosY=9 //Set to default controls
    {
      global.ctrlUp="W"
      global.ctrlDown="S"
      global.ctrlLeft="A"
      global.ctrlRight="D"
      global.ctrlAttack="K"
      global.ctrlJump="J"
      global.ctrlTech="L"
      global.ctrlSpell="O"
      global.ctrlCycleBack="U"
      global.ctrlCycleForward="I"
      global.ctrlRave="M"
      global.ctrlAbilityBack="Z"
      global.ctrlAbilityForward="C"
      global.ctrlDashLeft="Q"
      global.ctrlDashRight="E"
    }
  }
  else if subCursorPos=2
  {
  if cursorPosY=1 //Cycle Element - Back
    {
      keyChange=get_string(keyHelpInfo,global.ctrlCycleBack)
      global.ctrlCycleBack=string_upper(keyChange)
    }
    else if cursorPosY=2 //Cycle Element - Forward
    {
      keyChange=get_string(keyHelpInfo,global.ctrlCycleForward)
      global.ctrlCycleForward=string_upper(keyChange)
    }
    else if cursorPosY=3 //Engage Rave Mode
    {
      keyChange=get_string(keyHelpInfo,global.ctrlRave)
      global.ctrlRave=string_upper(keyChange)
    }
    else if cursorPosY=4 //Cycle Ability - Back
    {
      keyChange=get_string(keyHelpInfo,global.ctrlAbilityBack)
      global.ctrlAbilityBack=string_upper(keyChange)
    }
    else if cursorPosY=5 //Cycle Ability - Forward
    {
      keyChange=get_string(keyHelpInfo,global.ctrlAbilityForward)
      global.ctrlAbilityForward=string_upper(keyChange)
    }
    else if cursorPosY=6 //Dash Left
    {
      keyChange=get_string(keyHelpInfo,global.ctrlDashLeft)
      global.ctrlDashLeft=string_upper(keyChange)
    }
    else if cursorPosY=7 //Dash Right
    {
      keyChange=get_string(keyHelpInfo,global.ctrlDashRight)
      global.ctrlDashRight=string_upper(keyChange)
    }
    else if cursorPosY=8 //Set to default controls
    {
      global.ctrlUp="W"
      global.ctrlDown="S"
      global.ctrlLeft="A"
      global.ctrlRight="D"
      global.ctrlAttack="K"
      global.ctrlJump="J"
      global.ctrlTech="L"
      global.ctrlSpell="O"
      global.ctrlCycleBack="U"
      global.ctrlCycleForward="I"
      global.ctrlRave="M"
      global.ctrlAbilityBack="Z"
      global.ctrlAbilityForward="C"
      global.ctrlDashLeft="Q"
      global.ctrlDashRight="E"
    }
  }
}
*/
