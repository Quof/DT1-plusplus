/*
gamepad change (added): the default gamepad controls (codes and actions: see scrGamepadInit). Used at startup, for a
new game (oInitializeGame), as the defaults when a save is loaded (loadSaveData) and by "Set to Default Controls" in
the Gamepad Controls list.
*/
global.gpBind[1]=15   //Left: d-pad left
global.gpBind[2]=16   //Right: d-pad right
global.gpBind[3]=13   //Up: d-pad up
global.gpBind[4]=14   //Down: d-pad down
global.gpBind[5]=1    //Jump: A (Cross)
global.gpBind[6]=3    //Attack: X (Square)
global.gpBind[7]=4    //Use Tech: Y (Triangle)
global.gpBind[8]=2    //Cast Spell: B (Circle)
global.gpBind[9]=7    //Cycle Element Back: L2
global.gpBind[10]=8   //Cycle Element Forward: R2
global.gpBind[11]=23  //Cycle Ability Back: right stick left
global.gpBind[12]=24  //Cycle Ability Forward: right stick right
global.gpBind[13]=5   //Dash Left (Dash Back): L1
global.gpBind[14]=6   //Dash Right (Dash Forward): R1
global.gpBind[15]=9   //Engage Rave Mode: BACK
global.gpBind[16]=10  //Pause Menu: START
global.gpBind[17]=1   //Menu Confirm: A (Cross)
global.gpBind[18]=2   //Menu Cancel: B (Circle)
global.gpBind[23]=0   //element wheel change (added): Element Wheel: none (every button is taken; it's set in the list)
