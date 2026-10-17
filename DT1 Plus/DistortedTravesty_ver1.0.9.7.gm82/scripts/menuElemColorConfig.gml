/*
element colors change (added): the Element Colors panel, opened from the last row of the pause menu's Options Set 3
(oHUD's ecView 1/2; menuElemColorWidget draws it), like DT3's Color Zone Colors.
ecView 1: the four elements and Set to Default Colors (ecPos). [J] on an element changes its colour (ecView 2); on Set to
Default Colors every element gets its own colour back. [K] closes the panel.
ecView 2: the element's Red, Green and Blue (0-255) and Default (ecEditPos). [A]/[D] change the amount by 1; held, it
keeps going after a moment and faster after a second (ecHold: 30fps ticks held). [J] on Default puts the element's own
colour back. [K] goes back to the elements.
Called by oHUD's Step on the Options page while the panel is open (the page's own keys wait).
*/
var tUp,tDown,tOK,tBack,tDir,tStep,tC,tR,tG,tB,i;
tUp=(keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up) or scrPadPressed(3))
tDown=(keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down) or scrPadPressed(4))
tOK=(keyboard_check_pressed(curConfirm) or scrPadPressed(17))
tBack=(keyboard_check_pressed(curCancel) or scrPadPressed(18))

if ecView=1 //---------- the elements ----------
{
  if tBack //back to Options Set 3, on Element Colors
  {
    playSound(global.snd_MenuCancel,0,1)
    ecView=0
    scrElemColorRefresh() //the element enemies already about take the new colours
    exit
  }
  if tUp
  {
    playSound(global.snd_MenuCursor,0,1)
    ecPos-=1
    if ecPos<1 {ecPos=5}
  }
  if tDown
  {
    playSound(global.snd_MenuCursor,0,1)
    ecPos+=1
    if ecPos>5 {ecPos=1}
  }
  if tOK
  {
    playSound(global.snd_MenuConfirm,0,1)
    if ecPos=5 {for(i=1;i<=4;i+=1) {global.elemColor[i]=global.elemColorDef[i]}} //Set to Default Colors
    else
    {
      ecView=2
      ecEditPos=1
      ecHold=0
    }
  }
}
else //---------- changing element ecPos's colour ----------
{
  if tBack
  {
    playSound(global.snd_MenuCancel,0,1)
    ecView=1
    exit
  }
  if tUp
  {
    playSound(global.snd_MenuCursor,0,1)
    ecEditPos-=1
    if ecEditPos<1 {ecEditPos=4}
  }
  if tDown
  {
    playSound(global.snd_MenuCursor,0,1)
    ecEditPos+=1
    if ecEditPos>4 {ecEditPos=1}
  }
  if tOK and ecEditPos=4 //Default
  {
    playSound(global.snd_MenuConfirm,0,1)
    global.elemColor[ecPos]=global.elemColorDef[ecPos]
  }

  //Red/Green/Blue: [A]/[D] change it by 1 when pressed; held, by 1 a 30fps tick after 8 ticks and 5 a tick after 30
  tDir=0
  if ecEditPos<=3
  {
    if keyboard_check(curLeft) or keyboard_check(vk_left) or scrPadHeld(1) {tDir=-1}
    else if keyboard_check(curRight) or keyboard_check(vk_right) or scrPadHeld(2) {tDir=1}
  }
  if tDir=0 {ecHold=0}
  else
  {
    tStep=0
    if ecHold=0
    {
      tStep=1
      playSound(global.snd_MenuCursor,0,1)
    }
    else if gDeltaDoTicks and ecHold>8
    {
      if ecHold>30 {tStep=5} else {tStep=1}
    }
    ecHold+=gDeltaTime
    if tStep>0
    {
      tC=global.elemColor[ecPos]
      tR=color_get_red(tC)
      tG=color_get_green(tC)
      tB=color_get_blue(tC)
      if ecEditPos=1 {tR=median(0,tR+tDir*tStep,255)}
      else if ecEditPos=2 {tG=median(0,tG+tDir*tStep,255)}
      else {tB=median(0,tB+tDir*tStep,255)}
      global.elemColor[ecPos]=make_color_rgb(tR,tG,tB)
    }
  }
}
