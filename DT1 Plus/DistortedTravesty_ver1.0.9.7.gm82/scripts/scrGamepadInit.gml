/*
gamepad change (added): gamepad support, ported from DT3 (Game Maker 8.2's joystick extension, gm82joy: SDL2
joysticks, ids and buttons count from 0). Called once from oGamepad's Create (made in rIntro's creation code).
scrGamepadPoll reads the pad every frame (oGamepad's Begin Step); scrPadHeld/scrPadPressed give the game what it read,
while Gamepad Input is on (pause menu: Controls).

The gamepad controls (global.gpBind[action]) are saved as these codes, so they mean the same button on any pad SDL
knows the layout of:
  0 nothing
  1 A (bottom face button: Cross)     2 B (right: Circle)     3 X (left: Square)     4 Y (top: Triangle)
  5 L1   6 R1   7 L2   8 R2   9 BACK (Select/Share/View)   10 START (Options/Menu)   11 L3   12 R3 (stick clicks)
  13-16 d-pad up/down/left/right    17-20 left stick up/down/left/right    21-24 right stick up/down/left/right
  100+n raw button n                200+2*a axis a pushed + (201+2*a: pushed -), for pads SDL has no layout for

Actions (global.gpBind/gpHeld/gpPressed index):
  1 Left   2 Right   3 Up   4 Down   5 Jump   6 Attack   7 Use Tech   8 Cast Spell
  9 Cycle Element Back   10 Cycle Element Forward   11 Cycle Ability Back   12 Cycle Ability Forward
  13 Dash Left (shown as Dash Back)   14 Dash Right (shown as Dash Forward, see scrControlRows)   15 Engage Rave Mode
  16 Pause Menu   17 Menu Confirm   18 Menu Cancel
  and four fixed menu buttons, not in the list: 19 L1 / 20 R1 change the pause menu's tab (the keyboard's [U]/[I]),
  21 Y swaps a menu's lists ([L]), 22 BACK teleports from the pause menu ([M])

SDL's raw joystick layout depends on the pad:
  layout 1 - Xbox pads and anything XInput (also DS4Windows, Steam's virtual pads): A B X Y L1 R1 BACK START L3 R3
             are buttons 0-9, the d-pad is the hat, L2/R2 are axes. Unknown pads are read this way too.
  layout 2 - PlayStation and Switch pads (SDL's HIDAPI drivers, no hat): A B X Y BACK GUIDE START L3 R3 L1 R1
             are buttons 0-10, the d-pad is buttons 11-14, sticks are axes 0-3, L2/R2 are axes 4/5.
*/
var i;

global.gpDevice=-1    //joystick being read (-1: none)
global.gpName=""      //its name, as SDL reports it
global.gpLayout=0     //1 or 2, see above
global.gpAxes=0       //number of axes on the pad
global.gpHasHat=0
global.gpPlayStation=0 //1: show PlayStation button names (scrGamepadName)
global.gpPS5=0
//Axis numbers of L2, R2 and the right stick. Layout 1 has two orders, depending on the driver SDL picked:
//XInput (L2 = axis 2, right stick = 3/4) or RawInput/Windows.Gaming.Input (right stick = 2/3, L2 = 4).
//scrGamepadPoll works out which one by looking at which axis rests at -1 (an unpressed trigger).
global.gpAxL2=4
global.gpAxR2=5
global.gpAxRX=2
global.gpAxRY=3
global.gpOrderXInput=0   //frames in a row each order has looked right
global.gpOrderRawInput=0
global.gpOrderSure=0     //1 once the order is known; until then L2 isn't read (axis 4 could be the right stick)
//SDL reports every axis as 0 for a frame when a pad is plugged in, which would look like a half-pressed trigger.
//A trigger only counts once it has been seen resting.
global.gpL2Ready=0
global.gpR2Ready=0
global.gpDeadZone=0.4  //how far a stick has to be pushed to count
global.gpLastUsed=0   //pad hints change (added): 1 once a gamepad action is held, 0 again on a key press (scrGamepadPoll); the menus' hints show the pad's buttons while it's 1 (scrDrawHint)

global.gpActions=22   //actions, the four fixed menu buttons included (see above)
for(i=0;i<=global.gpActions;i+=1)
{
  global.gpHeld[i]=0     //held this frame (scrGamepadPoll)
  global.gpPressed[i]=0  //pressed this frame: held now, not on the last frame
  global.gpPrev[i]=0     //held on the last frame
}
global.gpFrames=0     //frames since startup: window_has_focus() is only read once gm82core has updated it (scrGamepadPoll)
for(i=0;i<16;i+=1)
{
  global.gpAxis[i]=0     //this frame's axis values
  global.gpCapBase[i]=0  //axis values when the Gamepad Controls list started waiting for a button (scrGamepadCapture)
}
global.gpHatX=0
global.gpHatY=0

//Raw button for codes 1-12 (-1: it's an axis), per layout
global.gpRaw1[1]=0; global.gpRaw1[2]=1; global.gpRaw1[3]=2; global.gpRaw1[4]=3; global.gpRaw1[5]=4; global.gpRaw1[6]=5
global.gpRaw1[7]=-1; global.gpRaw1[8]=-1; global.gpRaw1[9]=6; global.gpRaw1[10]=7; global.gpRaw1[11]=8; global.gpRaw1[12]=9
global.gpRaw2[1]=0; global.gpRaw2[2]=1; global.gpRaw2[3]=2; global.gpRaw2[4]=3; global.gpRaw2[5]=9; global.gpRaw2[6]=10
global.gpRaw2[7]=-1; global.gpRaw2[8]=-1; global.gpRaw2[9]=4; global.gpRaw2[10]=6; global.gpRaw2[11]=7; global.gpRaw2[12]=8

//Rows of the Keyboard Controls and Gamepad Controls panels (pause menu, Controls): row -> action
scrControlRows() //controls change: one list per panel now (it was two lists for each, swapped with [L])

if !variable_global_exists("optGamePad") {global.optGamePad=1} //Gamepad Input on (pause menu: Controls)
scrGamepadDefaults()
