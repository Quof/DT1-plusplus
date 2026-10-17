/*
settings change (added): the Options page's settings kept in Settings.ini's [Options] (scrSettingsLoad/scrSettingsSave),
by name. The Controls page's are the keys in scrControlRows (global.kbRowVar), the gamepad's buttons (global.gpBind,
scrGamepadInit) and DPad Spells (global.dpsSpell, scrDPadSpellInit). Called once from scrControlRows.
*/
global.setOpt[0]="optLowHealthWarn"
global.setOpt[1]="optShowExpEarned"
global.setOpt[2]="optShowDamage"
global.setOpt[3]="optEnemyStatus"
global.setOpt[4]="optKeepMenuPosition"
global.setOpt[5]="optMusic"
global.setOpt[6]="optSound"
global.setOpt[7]="optIdentifier"
global.setOpt[8]="optShowGlow"
global.setOpt[9]="optKillChainScreen"
global.setOpt[10]="optKillChainSound"
global.setOpt[11]="optKillingSpreeScreen"
global.setOpt[12]="optKillingSpreeSound"
global.setOpt[13]="optCombo"
global.setOpt[14]="optShowAwesome"
global.setOpt[15]="optEnemyHP"
global.setOpt[16]="gamePriority"
global.setOpt[17]="optGameDetail"
global.setOpt[18]="optDPadDash"
global.setOpt[19]="optRightIsForward"
global.setOpt[20]="optShowHUD"
global.setOpt[21]="optDashWarn"
global.setOpt[22]="optVSync" //vsync change (added): VSync (Options Set 2; scrVSyncApply)
//global.setOptCount=22
global.setOptCount=23 //vsync change
scrElemColorInit() //element colors change (added): Element Colors (Options Set 3): each element's colour (kept in Settings.ini's [ElementColors]) and what draws in it
