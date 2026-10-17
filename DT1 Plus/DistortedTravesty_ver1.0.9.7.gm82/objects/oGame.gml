#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gameCreateEvent()
bStatRender=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//gDeltaTime/gDeltaDoTicks are worked out in the Begin Step, so every Step event this frame agrees on whether it's a 30fps tick
if global.gamePaused=false
  gameStepEvent()

//60fps change (added): GM adds image_speed (and the built-in speed, hspeed/vspeed) in full every frame; take back the
//excess above 30fps so animations run at the 30fps rate (from DT3 60FPS)
if gDeltaTime != 1.0
{
  var tDtM1;
  tDtM1 = gDeltaTime - 1.0
  with (all)
  {
    image_index += image_speed * tDtM1
    //objects with friction are visual effects; gameplay objects shouldn't use friction
    if friction != 0
    {
      x += hspeed * tDtM1
      y += vspeed * tDtM1
      if speed != 0 {speed -= friction * tDtM1}
    }
  }
  //effects spawned with the built-in speed/direction (purely visual)
  with (oEffect) if friction == 0 and speed != 0 {x += hspeed * tDtM1; y += vspeed * tDtM1}
}
//60fps change (added): GM scrolls every background layer by its full background_hspeed/vspeed every frame; take back the
//excess above 30fps, so background speeds (set in the room editor or in code, in 30fps units) scroll at the 30fps rate
if gDeltaTime != 1.0
{
  var bgi;
  for(bgi=0;bgi<8;bgi+=1)
  {
    background_x[bgi] -= background_hspeed[bgi] * (1.0 - gDeltaTime)
    background_y[bgi] -= background_vspeed[bgi] * (1.0 - gDeltaTime)
  }
}

//play time
//if global.playTimeFrameCount>=30
//60fps change: counts frames, 30/gDeltaTime of them, and the frame that resets the count starts the next second
//1/gDeltaTime-1 frames back (0 at 30fps), so a second is 31 ticks at every frame rate as at 30fps
if global.playTimeFrameCount>=30/gDeltaTime
{
  //global.playTimeFrameCount=0
  global.playTimeFrameCount=1-1/gDeltaTime //60fps change: see above
  global.playTimeSecond+=1
  global.sessionPlayTime+=1
  if global.playTimeSecond>=60
  {
    global.playTimeSecond=0
    global.playTimeMinute+=1
    if global.playTimeMinute>=60
    {
      global.playTimeMinute=0
      global.playTimeHour+=1
    }
  }
}
else
  global.playTimeFrameCount+=1

//close the game
if keyboard_check_pressed(vk_escape)
{
  var closeGame;
  closeGame=show_question("Do you want to quit the game? :(")
  if closeGame=true
    game_end()
}

//windowed mode 1x/2x swap
if keyboard_check_pressed(vk_f3)
{
  if global.screenWindowDouble=false
  {
    window_set_size(1024,768)
    window_center()
    global.screenWindowDouble=true
  }
  else
  {
    window_set_size(512,384)
    window_center()
    global.screenWindowDouble=false
  }
  scrSettingsSaveDisplay() //settings change (added): the game starts at this size next time (Settings.ini)
}
//windowed/fullscreen mode
/*if keyboard_check_pressed(vk_f4)
{
  if window_get_fullscreen()
  {
    window_set_fullscreen(false)
    window_center()
  }
  else
  {
    window_set_fullscreen(true)
    window_center()
  }
}*/

if global.debugMenu=true //debug commands
{
  if keyboard_check_pressed(vk_f2)
  {
    if bStatRender=false
      bStatRender=true
    else
      bStatRender=false
  }
  if keyboard_check_pressed(vk_f6)
  {
    global.difficulty+=1
    if global.difficulty=5
      global.difficulty=1
  }
  if keyboard_check_pressed(vk_f8)
  {
    if global.gamePaused=0
      global.gamePaused=1
    else
      global.gamePaused=0
  }
  if keyboard_check_pressed(ord("B"))
  {
    oPlayer1.life=oPlayer1.maxLife
  }
  if keyboard_check_pressed(ord("N"))
  {
    if oInvisibleSolid.visible=false
    {
      oInvisibleSolid.visible=true
      oInvisibleSlimSolid.visible=true
      oInvisibleRupLowSlope.visible=true
      oInvisibleLupLowSlope.visible=true
      oInvisibleRCeilingLowSlope.visible=true
      oInvisibleLCeilingLowSlope.visible=true
      oInvisibleRupSlope.visible=true
      oInvisibleLupSlope.visible=true
      oInvisibleRCeilingSlope.visible=true
      oInvisibleLCeilingSlope.visible=true
      oInvisiblePlatform.visible=true
    }
    else
    {
      oInvisibleSolid.visible=false
      oInvisibleSlimSolid.visible=false
      oInvisibleRupLowSlope.visible=false
      oInvisibleLupLowSlope.visible=false
      oInvisibleRCeilingLowSlope.visible=false
      oInvisibleLCeilingLowSlope.visible=false
      oInvisibleRupSlope.visible=false
      oInvisibleLupSlope.visible=false
      oInvisibleRCeilingSlope.visible=false
      oInvisibleLCeilingSlope.visible=false
      oInvisiblePlatform.visible=false
    }
  }

  if keyboard_check_pressed(vk_numpad1)
  {
    stopLoopingSounds()
    room_restart()
  }
  if keyboard_check_pressed(vk_numpad3)
  {
    stopLoopingSounds()
    writeToPlayerGlobals()
    room_restart()
  }
  else if keyboard_check_pressed(vk_numpad7)
  {
    if room!=room_first
    {
      writeToPlayerGlobals()
      room_goto_previous()
    }
  }
  else if keyboard_check_pressed(vk_numpad8)
  {
    if room!=room_last
    {
      writeToPlayerGlobals()
      room_goto_next()
    }
  }
  else if keyboard_check_pressed(vk_numpad9)
  {
    stopLoopingSounds()
    stopAllMusic()
    room_goto(rIntro)
  }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//60fps change (added): Begin Step (from DT3 60FPS): decide whether this frame is a 30fps tick before any instance's
//Step event runs. F2 cycles the frame rate between 30, 60 and 120 (scrSetFrameRate)
if !variable_global_exists("gameFrameRateNext") {global.gameFrameRateNext=global.gameFrameRate}
if keyboard_check_pressed(vk_f2)
{
  if global.gameFrameRateNext==30 {global.gameFrameRateNext=60}
  else if global.gameFrameRateNext==60 {global.gameFrameRateNext=120}
  else {global.gameFrameRateNext=30}
  scrSettingsSaveDisplay() //settings change (added): the game starts at this rate next time (Settings.ini)
}
//the new rate starts with a 30fps tick (the last frame finished one): timers count 30fps ticks in gDeltaTime steps
//and check for exact counts, so they have to stay on the same steps (0.25 steps switching to 0.5 halfway through a
//0.5 step would skip the whole numbers)
if global.gameFrameRateNext!=global.gameFrameRate and gDeltaDoTicks>0 {scrSetFrameRate(global.gameFrameRateNext)}
if global.vsyncPending {scrVSyncApply()} //vsync change (added): a VSync change waiting for a screen effect's surface to be done with (scrVSyncApply)
room_speed=global.gameFrameRate*global.debugSpeedMul
gDeltaTime=30/global.gameFrameRate

gDeltaDoTicks = 0
gDeltaTick += gDeltaTime
while (gDeltaTick >= 1.0)
{
    gDeltaDoTicks += 1
    gDeltaTick -= 1.0
}
if gDeltaTime == 1.0 { gDeltaDoTicks = 1; gDeltaTick = 0.999999 }
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
SS_Unload()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bStatRender=true and instance_exists(oPlayer1)
{
  xSet=view_xview[0]+4
  ySet=view_yview[0]+64
  draw_set_color(make_color_rgb(0,255,0))
  draw_set_alpha(1)
  draw_set_halign(fa_left)
  draw_set_font(fnt_StatRender)
  //draw_text(xSet,ySet,"> fps: " +string(fps))
  draw_text(xSet,ySet,"> fps: " +string(fps)+" / "+string(global.gameFrameRate)) //60fps change: and the frame rate it's set to (F2)
  draw_text(xSet,ySet+9,"> Object Num: " +string(instance_count))
  draw_text(xSet,ySet+18,"> Player X Vel: " +string(oPlayer1.xVel))
  draw_text(xSet,ySet+27,"> Player Y Vel: " +string(oPlayer1.yVel))
  draw_text(xSet,ySet+36,"> Difficulty: " +string(global.difficulty))
  draw_text(xSet,ySet+45,"> Current Map ID: " +string(room))
  draw_text(xSet,ySet+54,"> Map Prev/Next: " +string(room_previous(room)) +string(" / ") +string(room_next(room)))
  draw_text(xSet,ySet+63,"> Map ID Range: " +string(room_first) +string(" / ") +string(room_last))
  draw_text(xSet,ySet+72,"> Game Progress: " +string(global.gameProgress))
  draw_text(xSet,ySet+81,"> Sound Freq: " +string(findFreq()))
  draw_text(xSet,ySet+90,"> Jump Power: " +string(oPlayer1.jumpSlashPower))
  draw_text(xSet,ySet+99,"> Dash Time: " +string(oPlayer1.dashMomentumTime))
  draw_text(xSet,ySet+108,"> Air Dash: " +string(oPlayer1.airDashRecovery))
}
