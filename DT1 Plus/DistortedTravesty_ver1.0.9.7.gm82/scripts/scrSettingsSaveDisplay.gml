/*
settings change (added): writes the frame rate (F2) and the window size (F3) to Settings.ini's [Display] (see
scrSettingsLoadDisplay). Called by oGame each time F2 or F3 changes them. Only these two: the rest of the file is the
menu's to write (scrSettingsSave), and F2/F3 work during scenes that change an option for themselves.
The frame rate written is the one F2 chose (global.gameFrameRateNext), which oGame switches to on the next 30fps tick.
*/
var tRate;
if variable_global_exists("gameFrameRateNext") {tRate=global.gameFrameRateNext} else {tRate=global.gameFrameRate}
ini_open("Settings.ini")
ini_write_real("Display","FrameRate",tRate)
ini_write_real("Display","WindowDouble",global.screenWindowDouble)
ini_close()
