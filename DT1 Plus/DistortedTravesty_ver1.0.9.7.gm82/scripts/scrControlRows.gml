/*
controls change (added): the rows of the Keyboard Controls and Gamepad Controls panels (pause menu, Controls page):
the name shown, the global the key is kept in (keyboard) and the action (gamepad, see scrGamepadInit). Each panel ends
with Set to Default Controls. menuControlWidget draws them, menuControlConfig moves through and changes them. Called once
from scrGamepadInit. Rows 1-16 are the same actions in both panels.
Dash Forward / Dash Back are the Dash Right / Dash Left keys: they work that way while "Right is Forward" is on (Options
Set 3, the default); with it off they're shown as Dash Right / Dash Left.
element wheel change: row 17, Element Wheel (scrElemWheel), is in both panels too, but only while Element Wheel Button is
on (Controls page): the panels' lines are rows through scrCtrlRow. Menu Confirm/Cancel are a row down.
*/
global.ctrlRowName[1]="Up";                       global.kbRowVar[1]="ctrlUp";              global.gpRowAct[1]=3
global.ctrlRowName[2]="Down";                     global.kbRowVar[2]="ctrlDown";            global.gpRowAct[2]=4
global.ctrlRowName[3]="Left";                     global.kbRowVar[3]="ctrlLeft";            global.gpRowAct[3]=1
global.ctrlRowName[4]="Right";                    global.kbRowVar[4]="ctrlRight";           global.gpRowAct[4]=2
global.ctrlRowName[5]="Attack";                   global.kbRowVar[5]="ctrlAttack";          global.gpRowAct[5]=6
global.ctrlRowName[6]="Jump";                     global.kbRowVar[6]="ctrlJump";            global.gpRowAct[6]=5
global.ctrlRowName[7]="Use Tech";                 global.kbRowVar[7]="ctrlTech";            global.gpRowAct[7]=7
global.ctrlRowName[8]="Cast Spell";               global.kbRowVar[8]="ctrlSpell";           global.gpRowAct[8]=8
global.ctrlRowName[9]="Cycle Element - Back";     global.kbRowVar[9]="ctrlCycleBack";       global.gpRowAct[9]=9
global.ctrlRowName[10]="Cycle Element - Forward"; global.kbRowVar[10]="ctrlCycleForward";   global.gpRowAct[10]=10
global.ctrlRowName[11]="Engage Rave Mode";        global.kbRowVar[11]="ctrlRave";           global.gpRowAct[11]=15
global.ctrlRowName[12]="Cycle Ability - Back";    global.kbRowVar[12]="ctrlAbilityBack";    global.gpRowAct[12]=11
global.ctrlRowName[13]="Cycle Ability - Forward"; global.kbRowVar[13]="ctrlAbilityForward"; global.gpRowAct[13]=12
global.ctrlRowName[14]="Dash Forward";            global.kbRowVar[14]="ctrlDashRight";      global.gpRowAct[14]=14
global.ctrlRowName[15]="Dash Back";               global.kbRowVar[15]="ctrlDashLeft";       global.gpRowAct[15]=13
global.ctrlRowName[16]="Pause Menu";              global.kbRowVar[16]="ctrlPause";          global.gpRowAct[16]=16
global.ctrlRowName[17]="Element Wheel";           global.kbRowVar[17]="ctrlElemWheel";      global.gpRowAct[17]=23 //element wheel change (added)
//global.ctrlRowName[17]="Menu Confirm";                                                      global.gpRowAct[17]=17
//global.ctrlRowName[18]="Menu Cancel";                                                       global.gpRowAct[18]=18
global.ctrlRowName[18]="Menu Confirm";                                                      global.gpRowAct[18]=17 //element wheel change: a row down
global.ctrlRowName[19]="Menu Cancel";                                                       global.gpRowAct[19]=18 //element wheel change: a row down
//global.kbRowCount=16  //rows with a key (the keyboard's menu keys are fixed: [WASD], [J], [K], [U]/[I])
//global.gpRowCount=18  //rows with a button
global.kbRowCount=17  //rows with a key (the keyboard's menu keys are fixed: [WASD], [J], [K], [U]/[I]) //element wheel change: and Element Wheel
global.gpRowCount=19  //rows with a button //element wheel change: and Element Wheel
scrDPadSpellInit() //dpad spells change (added): the DPad Spells lists (the Controls page's D-pad panels)
scrSettingsNames() //settings change (added): the Options page's settings kept in Settings.ini
