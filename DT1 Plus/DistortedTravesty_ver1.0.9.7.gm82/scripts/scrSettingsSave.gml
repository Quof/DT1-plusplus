/*
settings change (added): writes Options and Controls to Settings.ini (see scrSettingsLoad). Called when the pause menu
(or the title screen's Options & Controls) closes, when the game is quit with it open (oGame), and by loadSaveData when a
save gives the settings (no Settings.ini yet). Never while a scene has changed a setting for itself: the menu can't be
open then. The file's [Display] (frame rate, window size) is scrSettingsSaveDisplay's and stays as it is.
*/
var i,e,s;
ini_open("Settings.ini")
for(i=0;i<global.setOptCount;i+=1)
{
  ini_write_real("Options",global.setOpt[i],variable_global_get(global.setOpt[i]))
}
for(i=1;i<=global.kbRowCount;i+=1)
{
  ini_write_real("Keyboard",global.kbRowVar[i],ord(variable_global_get(global.kbRowVar[i])))
}
ini_write_real("Gamepad","Input",global.optGamePad)
for(i=1;i<=18;i+=1) {ini_write_real("Gamepad","Button" +string(i),global.gpBind[i])}
ini_write_real("DPadSpells","On",global.optDPadSpells)
for(e=0;e<=4;e+=1)
{
  for(s=0;s<=3;s+=1) {ini_write_real("DPadSpells","Spell" +string(e) +"_" +string(s),global.dpsSpell[e,s])}
}
for(i=1;i<=4;i+=1) {ini_write_real("ElementColors",global.elemName[i],global.elemColor[i])} //element colors change (added): Element Colors (Options Set 3), as GM colours (red + green*256 + blue*65536)
ini_close()
global.settingsNew=0 //there's a Settings.ini now (loadSaveData no longer takes a save's settings)
