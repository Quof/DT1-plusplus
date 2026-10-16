/*
This script is called in the HUD pause menu.
It is used to for setting up the controls.
(This could just go in the execute code, but it takes too long to load all that.)
*/
if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
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
if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
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

if keyboard_check_pressed(curChange)
{
  playSound(global.snd_MenuCursor,0,1)
  bChangedMenu=true
  subCursorPos+=1
  if subCursorPos>2 {subCursorPos=1}
}
