/*
settings change (added): the frame rate (F2) and the window size (F3), kept in Settings.ini's [Display] (written by
scrSettingsSaveDisplay when they're changed), read over what they are. Called once, when the game starts (rIntro's
creation code, which then sizes the window); oGame puts the frame rate into effect when it's made, as it does the default.
*/
if !file_exists("Settings.ini") {exit}
ini_open("Settings.ini")
global.gameFrameRate=ini_read_real("Display","FrameRate",global.gameFrameRate)
global.screenWindowDouble=ini_read_real("Display","WindowDouble",global.screenWindowDouble)
ini_close()
if global.gameFrameRate!=30 and global.gameFrameRate!=120 {global.gameFrameRate=60} //only the rates F2 gives
global.screenWindowDouble=(global.screenWindowDouble!=0)
