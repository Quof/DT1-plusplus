/*
dpad spells change (added): the D-pad panel of the pause menu's Controls page (oHUD's ctrlView 3, drawn by
menuDPadSpellWidget): five boxes in a D-pad shape for one element's spells (dpsElem: 0 techniques, 1-4 fire/water/wind/
earth). Directions move between the boxes (dpsBox: 0 middle, 1 up, 2 left, 3 right, 4 down); [J] opens the box's list
(dpsList=1, dpsListPos) and puts the spell picked in it on the box. Left and Right are one box (the same spell). Spells not
learned yet show as "(Spell Inaccessible)" and can't be picked. [K] closes the list, then the panel. Called by
menuControlConfig.
*/
var tUp,tDown,tLeft,tRight,tOK,tBack,tSlot,tNew,tRow;
tUp=(keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up) or scrPadPressed(3))
tDown=(keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down) or scrPadPressed(4))
tLeft=(keyboard_check_pressed(curLeft) or keyboard_check_pressed(vk_left) or scrPadPressed(1))
tRight=(keyboard_check_pressed(curRight) or keyboard_check_pressed(vk_right) or scrPadPressed(2))
tOK=(keyboard_check_pressed(curConfirm) or scrPadPressed(17))
tBack=(keyboard_check_pressed(curCancel) or scrPadPressed(18))
tSlot=global.dpsBoxSlot[dpsBox]

if dpsList=0 //---------- moving between the boxes ----------
{
  if tBack //back to the Controls page, on this element's row
  {
    playSound(global.snd_MenuCancel,0,1)
    if dpsElem=0 {tRow=9} else {tRow=4+dpsElem}
    ctrlView=0
    menuMax=9
    cursorPosY=tRow
    menuCursorX=menuMainX+30
    menuCursorY=menuMainY+28+cursorIncY*(tRow-1)
    exit
  }
  if tOK //open the box's list, on the spell it has
  {
    playSound(global.snd_MenuConfirm,0,1)
    dpsList=1
    dpsListPos=global.dpsSpell[dpsElem,tSlot]
    if dpsListPos<1 or dpsListPos>global.dpsCount[dpsElem] {dpsListPos=1}
    exit
  }
  tNew=dpsBox
  if dpsBox=0 {if tUp {tNew=1} else if tDown {tNew=4} else if tLeft {tNew=2} else if tRight {tNew=3}}
  else if dpsBox=1 {if tDown {tNew=0} else if tLeft {tNew=2} else if tRight {tNew=3}}
  else if dpsBox=4 {if tUp {tNew=0} else if tLeft {tNew=2} else if tRight {tNew=3}}
  else if dpsBox=2 {if tRight {tNew=0} else if tUp {tNew=1} else if tDown {tNew=4}}
  else if dpsBox=3 {if tLeft {tNew=0} else if tUp {tNew=1} else if tDown {tNew=4}}
  if tNew!=dpsBox
  {
    playSound(global.snd_MenuCursor,0,1)
    dpsBox=tNew
  }
}
else //---------- the box's list ----------
{
  if tBack
  {
    playSound(global.snd_MenuCancel,0,1)
    dpsList=0
    exit
  }
  if tUp
  {
    playSound(global.snd_MenuCursor,0,1)
    dpsListPos-=1
    if dpsListPos<1 {dpsListPos=global.dpsCount[dpsElem]}
  }
  if tDown
  {
    playSound(global.snd_MenuCursor,0,1)
    dpsListPos+=1
    if dpsListPos>global.dpsCount[dpsElem] {dpsListPos=1}
  }
  if tOK
  {
    if scrDPadSpellUnlocked(dpsElem,dpsListPos)
    {
      playSound(global.snd_MenuConfirm,0,1)
      global.dpsSpell[dpsElem,tSlot]=dpsListPos
      dpsList=0
    }
    else {playSound(global.snd_MenuCancel,0,1)} //(Spell Inaccessible): not learned yet
  }
}
