/*
vsync change (added): puts VSync (Options Set 2; global.optVSync: 0 Auto, 1 On, 2 Off) into effect. With vsync on, each
frame waits for the screen's next refresh: no tearing and evenly spaced frames, but the game can't run faster than the
screen refreshes (120fps on a 60Hz monitor would run at half speed). Auto turns it on when every frame lines up with the
screen's refreshes (the refresh rate a whole multiple of the frame rate: 30 or 60fps on 60Hz, 60 or 120fps on 120Hz) and
off otherwise (120fps on 60Hz, anything on 144Hz), where it would slow the game or show frames unevenly.
settings.txt starts the game with it off (global.vsyncOn, rIntro's creation code). Changing it resets the graphics
device, which loses surfaces, so while something is drawing with one (oScreenEffect, oScreenAttack, the Sky Base HUD) it
waits (global.vsyncPending: oGame's Begin Step tries again each frame).
Called once the settings are loaded (oInitializeGame), when the option is changed (oHUD) and when the frame rate is
(scrSetFrameRate).
*/
var tOn,tR;
if global.optVSync=1 {tOn=1}
else if global.optVSync=2 {tOn=0}
else
{
  tR=display_get_frequency()/global.gameFrameRate
  tOn=(tR>=0.95 and abs(tR-round(tR))<0.05)
}
global.vsyncPending=0
if tOn=global.vsyncOn {exit}
if instance_exists(oScreenEffect) or instance_exists(oScreenAttack) or instance_exists(oEvSkyBaseHUD) {global.vsyncPending=1; exit}
set_synchronization(tOn)
global.vsyncOn=tOn
