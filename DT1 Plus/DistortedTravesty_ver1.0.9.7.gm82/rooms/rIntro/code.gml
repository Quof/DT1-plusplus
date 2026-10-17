set_application_title("Distorted Travesty")
//60fps change (added): the frame rate variables (from DT3 60FPS). gDeltaTime is how much of a 30fps tick each frame is
//(30/fps: 1 at 30fps, 0.5 at 60fps, 0.25 at 120fps), gDeltaDoTicks is 1 on frames that finish a 30fps tick and
//gDeltaTick is how far into the current tick the game is. oGame's Begin Step works them out every frame
globalvar gDeltaTime, gDeltaDoTicks, gDeltaTick;
if !variable_global_exists("gameFrameRate") {global.gameFrameRate=60} //30, 60 or 120 (F2 cycles it, see oGame)
if !variable_global_exists("debugSpeedMul") {global.debugSpeedMul=1} //the debug menu's Room Speed, as a multiplier
if !instance_exists(oGame)
{
  //until oGame is made (the first player makes it), rooms run at their own speed (30), so time counts as 30fps
  gDeltaTime=1
  gDeltaDoTicks=1
  gDeltaTick=0.999999
}
//GM8.2 change (added): old GM8.1 instance ids, see GID
if !variable_global_exists("objectIDMap") {global.objectIDMap=ds_map_create()}
//2x window change (added): the game starts with the window at 2x (1024x768, the size F3 switches to). Only when the
//game starts: coming back to the title keeps whatever size F3 left it at (oInitializeGame keeps the flag too)
if !variable_global_exists("screenWindowDouble")
{
  global.screenWindowDouble=true
  window_set_size(1024,768)
  window_center()
}
//gamepad change (added): the gamepad reader, for the whole game (persistent), before anything reads the controls
if !instance_exists(oGamepad) {instance_create(0,0,oGamepad)}
gameIntro=instance_create(0,0,oIntro)
