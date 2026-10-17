#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color_Back=make_color_rgb(88,32,11)
color_Border1=make_color_rgb(184,104,8)
color_Border2=make_color_rgb(108,49,27)
color_Text=make_color_rgb(213,180,112)

menuXpos=96
menuYpos=146
menuWidth=144
menuHeight=69
menuMax=2
cursorPos=1
cursorX=menuXpos+15
cursorY=menuYpos+27
cursorInc=21
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//key up
if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up))
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPos=1
  {
    cursorPos=menuMax
    cursorY+=cursorInc*(menuMax-1)
  }
  else
  {
    cursorPos-=1
    cursorY-=cursorInc
  }
}
//key down
if (keyboard_check_pressed(ord(global.ctrlDown)) or keyboard_check_pressed(vk_down))
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPos=menuMax
  {
    cursorPos=1
    cursorY-=cursorInc*(menuMax-1)
  }
  else
  {
    cursorPos+=1
    cursorY+=cursorInc
  }
}
//key confirm
if keyboard_check_pressed(ord(global.ctrlJump))
{
  global.gamePaused=false
  if cursorPos=1
  {
    if topWord="Game Over"
      room_restart()
    else
      instance_destroy()
  }
  else if cursorPos=2
  {
    //transition_steps=30
    transition_steps=30/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=20
    room_goto(rShipInterface)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw back fade
if topWord="Game Over"
  draw_set_alpha(0.75)
else
  draw_set_alpha(0.25)
draw_set_color(color_Back)
draw_rectangle(0,0,view_shooter_x,room_height,false)
//draw menu
draw_set_alpha(1)
draw_rectangle(menuXpos,menuYpos,menuXpos+menuWidth,menuYpos+menuHeight,false)
draw_set_color(color_Border1)
draw_rectangle(menuXpos,menuYpos,menuXpos+menuWidth,menuYpos+menuHeight,true)
draw_rectangle(menuXpos+2,menuYpos+2,menuXpos+menuWidth-2,menuYpos+menuHeight-2,true)
draw_line(menuXpos+2,menuYpos+23,menuXpos+menuWidth-2,menuYpos+23)
draw_line(menuXpos+2,menuYpos+25,menuXpos+menuWidth-2,menuYpos+25)
draw_set_color(color_Border2)
draw_rectangle(menuXpos+1,menuYpos+1,menuXpos+menuWidth-1,menuYpos+menuHeight-1,true)
draw_line(menuXpos+2,menuYpos+24,menuXpos+menuWidth-2,menuYpos+24)
//draw text
draw_set_font(fnt_HUD_Shooter)
draw_set_color(color_Text)
draw_set_halign(fa_center)
draw_text(menuXpos+72,menuYpos+3,topWord)
draw_set_halign(fa_left)
draw_text(menuXpos+18,menuYpos+25,bottomWord +string("#Back to Base"))
//draw cursor
draw_set_alpha(0.35)
draw_set_color(color_Border2)
draw_rectangle(cursorX,cursorY,cursorX+110,cursorY+15,false)
draw_set_alpha(1)
draw_set_color(color_Border1)
draw_rectangle(cursorX,cursorY,cursorX+110,cursorY+15,true)
