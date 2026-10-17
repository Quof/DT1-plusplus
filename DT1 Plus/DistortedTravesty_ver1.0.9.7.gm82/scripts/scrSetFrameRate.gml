/*
60fps change (added): sets the frame rate the game runs at (30, 60 or 120): room_speed and the delta time everything
moves by (gDeltaTime = 30/fps; 1 at 30fps). F2 cycles it (oGame's Begin Step).
argument0: frames per second
*/
global.gameFrameRate=argument0
room_speed=global.gameFrameRate*global.debugSpeedMul
gDeltaTime=30/global.gameFrameRate
gDeltaTick=0.0
scrVSyncApply() //vsync change (added): VSync's Auto goes by the frame rate (Options Set 2)
