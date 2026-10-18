#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrowX=x
arrowY=y-32
pointTime=0
activate=0
floorMenuX=213
floorMenuY=173
bShowArrow=true
colorBorder=make_color_rgb(213,180,112)
colorBack=make_color_rgb(184,104,8)
colorText=make_color_rgb(88,32,11)
floorChoice=1
curUp=ord("W")
curDown=ord("S")
curConfirm=ord("J")
curCancel=ord("K")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if activate=1
{
  //if keyboard_check_pressed(curUp) or keyboard_check_pressed(vk_up)
  if keyboard_check_pressed(curUp) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //gamepad change: and the gamepad's Up (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if floorChoice<(global.sofsMax*5)+1
      floorChoice+=5
    else
      floorChoice=1
  }
  //if keyboard_check_pressed(curDown) or keyboard_check_pressed(vk_down)
  if keyboard_check_pressed(curDown) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //gamepad change: and the gamepad's Down (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if floorChoice>1
      floorChoice-=5
    else
      floorChoice=(global.sofsMax*5)+1
  }
  //if keyboard_check_pressed(curConfirm)
  if (keyboard_check_pressed(curConfirm) or scrPadPressed(17)) //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
  {
    scrGamepadSync() //input bleed fix (added): the pad's buttons held now (A is also Jump) don't count as held until let go, or the player jumps on the floor it goes to
    playSound(global.snd_MenuConfirm,0,1)
    global.recUsedAreaExit+=1
    global.newMapX=0
    global.newMapY=0
    writeToPlayerGlobals()
    //transition_steps=15
    transition_steps=15 //60fps change: the original steps: GM plays a room transition at the new room's own speed (30; oGame sets room_speed only once the room runs), so steps/gDeltaTime made it 2x/4x as long at 60/120fps
    transition_kind=5
    if floorChoice=1
      toRoom=rSoFS_Floor1
    else if floorChoice=6
      toRoom=rSoFS_Floor6
    else if floorChoice=11
      toRoom=rSoFS_Floor11
    else if floorChoice=16
      toRoom=rSoFS_Floor16
    else if floorChoice=21
      toRoom=rSoFS_Floor21
    else if floorChoice=26
      toRoom=rSoFS_Floor26
    else if floorChoice=31
      toRoom=rSoFS_Floor31
    else if floorChoice=36
      toRoom=rSoFS_Floor36
    else if floorChoice=41
      toRoom=rSoFS_Floor41
    else if floorChoice=46
      toRoom=rSoFS_Floor99
    else if floorChoice=51
      toRoom=rSoFS_Floor100
    else if floorChoice=56
      toRoom=rSoFS_TopFloor
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    global.gamePaused=false
    room_goto(toRoom)
  }
  //if keyboard_check_pressed(curCancel)
  if (keyboard_check_pressed(curCancel) or scrPadPressed(18)) //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
  {
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
    playSound(global.snd_MenuCancel,0,1)
    global.gamePaused=false
    activate=0
  }
}
#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Spire of Forgotten Souls door script.
This will move the player inside the spire.
*/
//if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and activate=0 and global.gamePaused=false
if (keyboard_check_pressed(ord(global.ctrlUp)) or (keyboard_check_pressed(vk_up) or scrPadPressed(3))) and activate=0 and global.gamePaused=false //gamepad change: and the gamepad's Up (scrGamepadInit)
{
  global.gamePaused=true
  activate=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,-1,x,y)
if bShowArrow=true
{
  //pointTime+=1
  pointTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if pointTime=20
  if scrCountPass(pointTime,20) //60fps change: once, when the count reaches it
    arrowY+=1
  //else if pointTime=40
  else if scrCountPass(pointTime,40) //60fps change: once, when the count reaches it
  {
    arrowY-=1
    pointTime=0
  }
  draw_sprite(sExitArrow,0,arrowX,arrowY)
}
if activate=1
{
  draw_set_alpha(1)
  draw_set_font(fnt_SubMenu)
  draw_set_color(colorBack)
  draw_rectangle(floorMenuX,floorMenuY,floorMenuX+83,floorMenuY+28,0)
  draw_set_color(colorBorder)
  draw_rectangle(floorMenuX,floorMenuY,floorMenuX+83,floorMenuY+28,1)
  draw_line(floorMenuX,floorMenuY+10,floorMenuX+83,floorMenuY+10)
  draw_set_halign(fa_center)
  draw_text(floorMenuX+41,floorMenuY-2,"CHOOSE FLOOR")
  draw_set_halign(fa_left)
  draw_set_color(colorText)
  draw_triangle(floorMenuX+73,floorMenuY+15,floorMenuX+78,floorMenuY+15,floorMenuX+76,floorMenuY+12,0)
  //draw_triangle(floorMenuX+74,floorMenuY+14,floorMenuX+78,floorMenuY+14,floorMenuX+76,floorMenuY+12,0)
  draw_triangle(floorMenuX+74,floorMenuY+24,floorMenuX+78,floorMenuY+24,floorMenuX+76,floorMenuY+26,0)
  draw_text(floorMenuX+3,floorMenuY+12,"Floor")
  draw_set_halign(fa_right)
  draw_set_color(colorBorder)
  if floorChoice=46
    draw_text(floorMenuX+82,floorMenuY+12,99)
  else if floorChoice=51
    draw_text(floorMenuX+82,floorMenuY+12,100)
  else if floorChoice=56
    draw_text(floorMenuX+82,floorMenuY+12,"Top Floor")
  else
    draw_text(floorMenuX+82,floorMenuY+12,floorChoice)
}
