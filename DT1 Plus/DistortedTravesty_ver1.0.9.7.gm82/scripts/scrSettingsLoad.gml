/*
settings change (added): Options and Controls are global, kept in Settings.ini (next to GameDetails.ini, the saves), not
in the save files. Reads it over the settings as they are (anything not in it stays as it is) and applies the game
priority. Returns 1 if Settings.ini has them: it may only have [Display] so far (the frame rate and window size, F2/F3,
scrSettingsLoadDisplay), which doesn't count. Called by oInitializeGame on every visit to the title screen, which also
undoes what a scene changed for itself (the ending hides the identifier, global.optIdentifier).
Keys are kept as their character codes (a space would be lost as text).
*/
var i,e,s;
if !file_exists("Settings.ini") {return 0}
ini_open("Settings.ini")
if !ini_section_exists("Options") {ini_close(); return 0}
for(i=0;i<global.setOptCount;i+=1)
{
  variable_global_set(global.setOpt[i],ini_read_real("Options",global.setOpt[i],variable_global_get(global.setOpt[i])))
}
for(i=1;i<=global.kbRowCount;i+=1)
{
  variable_global_set(global.kbRowVar[i],chr(ini_read_real("Keyboard",global.kbRowVar[i],ord(variable_global_get(global.kbRowVar[i])))))
}
global.optGamePad=ini_read_real("Gamepad","Input",global.optGamePad)
for(i=1;i<=18;i+=1) {global.gpBind[i]=ini_read_real("Gamepad","Button" +string(i),global.gpBind[i])}
global.optDPadSpells=ini_read_real("DPadSpells","On",global.optDPadSpells)
for(e=0;e<=4;e+=1)
{
  for(s=0;s<=3;s+=1) {global.dpsSpell[e,s]=ini_read_real("DPadSpells","Spell" +string(e) +"_" +string(s),global.dpsSpell[e,s])}
}
for(i=1;i<=4;i+=1) {global.elemColor[i]=median(0,round(ini_read_real("ElementColors",global.elemName[i],global.elemColor[i])),16777215)} //element colors change (added): Element Colors (Options Set 3)
ini_close()
set_program_priority(global.gamePriority)
return 1
