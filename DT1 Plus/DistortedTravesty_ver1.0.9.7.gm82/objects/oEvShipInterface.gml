#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color_Border1=make_color_rgb(184,104,8)
color_Border2=make_color_rgb(108,49,27)
color_Text=make_color_rgb(213,180,112)
menuMax=4
cursorPos=1
cursorX=88
cursorY=40
cursorInc=28
diffCursorX=0
diffCursorPos=global.difficulty
missionCursorX=24
missionCursorY=180
missionCursorPos=1
missioncursorInc=30
if global.gameProgress<=278
  missionMax=1
else if global.gameProgress>=279
  missionMax=2
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
  missionCursorPos=1
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
  if cursorPos=1
  {
    missionCursorX=24
    missionCursorY=180
  }
  else if cursorPos=3
    diffCursorPos=global.difficulty
}
//key down
if (keyboard_check_pressed(ord(global.ctrlDown)) or keyboard_check_pressed(vk_down))
{
  playSound(global.snd_MenuCursor,0,1)
  missionCursorPos=1
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
  if cursorPos=1
  {
    missionCursorX=24
    missionCursorY=175
  }
  else if cursorPos=3
    diffCursorPos=global.difficulty
}
//key left
if (keyboard_check_pressed(ord(global.ctrlLeft)) or keyboard_check_pressed(vk_left))
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPos=1
  {
    if missionCursorPos=1
    {
      missionCursorPos=missionMax
      missionCursorY+=missioncursorInc*(missionMax-1)
    }
    else
    {
      missionCursorPos-=1
      missionCursorY-=missioncursorInc
    }
  }
  else if cursorPos=3
  {
    if diffCursorPos=1
      diffCursorPos=3
    else
      diffCursorPos-=1
  }
}
//key right
if (keyboard_check_pressed(ord(global.ctrlRight)) or keyboard_check_pressed(vk_right))
{
  playSound(global.snd_MenuCursor,0,1)
  if cursorPos=1
  {
    if missionCursorPos=missionMax
    {
      missionCursorPos=1
      missionCursorY-=missioncursorInc*(missionMax-1)
    }
    else
    {
      missionCursorPos+=1
      missionCursorY+=missioncursorInc
    }
  }
  else if cursorPos=3
  {
    if diffCursorPos=3
      diffCursorPos=1
    else
      diffCursorPos+=1
  }
}
//key confirm
if keyboard_check_pressed(ord(global.ctrlJump))
{
  if cursorPos=1
  {
    //transition_steps=5
    transition_steps=5/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=20
    if missionCursorPos=1
      room_goto(rWindyMountains)
    else if missionCursorPos=2
      room_goto(rDataSegmentEntry)
  }
  else if cursorPos=3
  {
    playSound(global.snd_MenuConfirm,0,1)
    global.difficulty=diffCursorPos
  }
  else if cursorPos=4
  {
    //transition_steps=30
    transition_steps=30/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=20
    if global.location="Windy Slopes"
    {
      global.newMapX=272
      global.newMapY=320
      room_goto(rWindySlopes6)
    }
    else if global.location="Sky Base"
      room_goto(rSkyBase)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1)
draw_set_font(fnt_HUD_Shooter)
draw_set_halign(fa_center)
draw_set_color(c_black)
//up
draw_text(256,12,"SHIP CONTROL INTERFACE")
//down
draw_text(256,14,"SHIP CONTROL INTERFACE")
//left
draw_text(255,13,"SHIP CONTROL INTERFACE")
//right
draw_text(257,13,"SHIP CONTROL INTERFACE")
draw_set_color(color_Text)
draw_text(256,13,"SHIP CONTROL INTERFACE")
draw_set_color(color_Border1)
draw_rectangle(120,13,390,32,true)
//draw menu items
draw_set_font(fnt_Continue)
draw_set_halign(fa_left)
draw_set_color(color_Text)
draw_text(92,43,"Start Mission")
draw_text(92,71,"Controls")
draw_text(92,99,"Change Difficulty")
draw_text(92,127,"Abort")
//draw mid line
draw_set_color(color_Border1)
draw_line(0,159,room_width,159)
draw_line(0,161,room_width,161)
draw_set_color(color_Border2)
draw_line(0,160,room_width,160)
//below mid line
draw_set_font(fnt_HUD_Shooter)
draw_set_color(color_Text)
if cursorPos=1 // ---------- START MISSION ----------
{
  if global.difficulty=1
  {
    targetScore1=1200000
    targetScore2=3000000
  }
  else if global.difficulty=2
  {
    targetScore1=1500000
    targetScore2=3500000
  }
  else if global.difficulty=3
  {
    targetScore1=1650000
    targetScore2=4150000
  }
  else if global.difficulty=4
  {
    targetScore1=2000000
    targetScore2=4600000
  }
  draw_set_font(fnt_showMessage)
  draw_text(28,162,"Location")
  draw_text(340,162,"Hi Score   /   Target Score")
  draw_set_font(fnt_HUD_Shooter)
  if missionMax>=1
  {
    draw_text(28,180,"Windy Mountains")
    draw_set_halign(fa_right)
    draw_text(388,180,global.shotWW_Highscore)
    draw_set_halign(fa_left)
    draw_text(396,180,"/ " +string(targetScore1))
    if global.skillCapsules[73]=1
      draw_sprite(sAllItemIcon,-1,482,189)
  }
  if missionMax=2
  {
    draw_text(28,210,"Data Segment Entry")
    draw_set_halign(fa_right)
    draw_text(388,210,global.shotDSE_Highscore)
    draw_set_halign(fa_left)
    draw_text(396,210,"/ " +string(targetScore2))
    if global.skillCapsules[94]=1
      draw_sprite(sAllItemIcon,-1,482,219)
  }
  draw_set_color(color_Border1)
  //cursor
  draw_rectangle(missionCursorX,missionCursorY,missionCursorX+237,missionCursorY+19,true)
}
else if cursorPos=2 // ---------- CONTROLS ----------
{
  draw_set_font(fnt_showMessage)
  draw_text(16,168,"- The ship can be moved with either was WASD or Arrow Keys.#   (Arrow keys are recommended due to windows 3 key limits.)##- Hold [K] to fire your lasers.##- Hold [J] to bring your ship into focused mode. This will cause#   your ship to move slower and you can see your collision point.##- Press [L] to use a bomb. Your ship is invulnerable during a#   bombs duration.##- These controls reflect your normal controls.")
}
else if cursorPos=3 // ---------- CHANGE DIFFICULTY ----------
{
  if global.difficulty=4
    draw_text(16,168,"- You're playing on Distorted. Don't think you're getting#   out of this that easy.")
  else
  {
    draw_text(16,168,"Change difficulty.")
    draw_text(84,242,"Beginner          Veteran          Hardcore")
    draw_set_color(color_Text)
    draw_set_alpha(0.3)
    if global.difficulty=1
      draw_rectangle(82,244,160,261,false)
    else if global.difficulty=2
      draw_rectangle(202,244,280,261,false)
    else if global.difficulty=3
      draw_rectangle(323,244,401,261,false)

    if diffCursorPos=1
      diffCursorX=82
    else if diffCursorPos=2
      diffCursorX=202
    else if diffCursorPos=3
      diffCursorX=323
    draw_set_color(color_Border1)
    draw_set_alpha(1)
    draw_rectangle(diffCursorX,244,diffCursorX+78,261,true)
  }
}
else if cursorPos=4 // ---------- ABORT ----------
  draw_text(16,168,"Exits back to where you came from.")
//draw cursor
draw_set_color(color_Border1)
draw_rectangle(cursorX,cursorY,cursorX+206,cursorY+28,true)
//draw controls
draw_set_font(fnt_showMessage)
draw_set_halign(fa_center)
draw_set_color(color_Text)
draw_text(448,36,"----- Up & Down -----#Top cursor#________________#----- Left & Right -----#Bottom cursor#________________#----- J [Confirm] -----#Confirm selection")
