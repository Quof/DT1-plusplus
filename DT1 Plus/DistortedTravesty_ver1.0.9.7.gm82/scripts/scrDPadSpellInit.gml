/*
dpad spells change (added): "DPad Spells (DT2 Style)" (pause menu, Controls; global.optDPadSpells). While it's on, the
direction held when Cast Spell / Use Tech is pressed picks the spell / technique (scrDPadSpellUse): each element and the
techniques have a D-pad of boxes (global.dpsSpell[e,slot], set in the D-pad panel, menuDPadSpellConfig).
Called once from scrControlRows. The lists, [e,i]: e 0 techniques, 1 fire, 2 water, 3 wind, 4 earth (as
global.p1CurrentElement), i from 1 in the game's order (the Techniques page of the pause menu). dpsCode is the name the
game uses, dpsName the one shown, dpsReq the techLv/element level it's learned at (as on that page).
Slots: 0 middle (no direction held), 1 Up, 2 Left/Right (one spell for both), 3 Down.
*/
global.dpsTitle[0]="TECHNIQUES"; global.dpsLabel[0]="Techniques"; global.dpsCount[0]=4
global.dpsCode[0,1]="MENTAL INSURRECTION"; global.dpsName[0,1]="Mental Insurrection"; global.dpsReq[0,1]=1
global.dpsCode[0,2]="WAVE OF AWESOME";     global.dpsName[0,2]="Wave of Awesome";     global.dpsReq[0,2]=2
global.dpsCode[0,3]="KUDEKU";              global.dpsName[0,3]="Kudeku";              global.dpsReq[0,3]=3
global.dpsCode[0,4]="GRAND SLAM";          global.dpsName[0,4]="Grand Slam";          global.dpsReq[0,4]=4

global.dpsTitle[1]="FIRE SPELLS"; global.dpsLabel[1]="Fire"; global.dpsCount[1]=5
global.dpsCode[1,1]="FIREBALL";            global.dpsName[1,1]="Fireball";            global.dpsReq[1,1]=1
global.dpsCode[1,2]="FLAME PILLAR";        global.dpsName[1,2]="Flame Pillar";        global.dpsReq[1,2]=2
global.dpsCode[1,3]="BLAST OFF";           global.dpsName[1,3]="Blast Off";           global.dpsReq[1,3]=3
global.dpsCode[1,4]="INFERNO";             global.dpsName[1,4]="Inferno";             global.dpsReq[1,4]=4
global.dpsCode[1,5]="WILDFIRE";            global.dpsName[1,5]="Wildfire";            global.dpsReq[1,5]=5

global.dpsTitle[2]="WATER SPELLS"; global.dpsLabel[2]="Water"; global.dpsCount[2]=5
global.dpsCode[2,1]="WATER BLAST";         global.dpsName[2,1]="Water Blast";         global.dpsReq[2,1]=1
global.dpsCode[2,2]="WATER BARRIER";       global.dpsName[2,2]="Water Barrier";       global.dpsReq[2,2]=2
global.dpsCode[2,3]="FLOOD";               global.dpsName[2,3]="Flood";               global.dpsReq[2,3]=3
global.dpsCode[2,4]="SOOTHING SPRING";     global.dpsName[2,4]="Soothing Spring";     global.dpsReq[2,4]=4
global.dpsCode[2,5]="PIERCING STREAM";     global.dpsName[2,5]="Piercing Stream";     global.dpsReq[2,5]=5

global.dpsTitle[3]="WIND SPELLS"; global.dpsLabel[3]="Wind"; global.dpsCount[3]=5
global.dpsCode[3,1]="WIND BURST";          global.dpsName[3,1]="Wind Burst";          global.dpsReq[3,1]=1
global.dpsCode[3,2]="ZEPHYR";              global.dpsName[3,2]="Zephyr";              global.dpsReq[3,2]=2
global.dpsCode[3,3]="CYCLONE";             global.dpsName[3,3]="Cyclone";             global.dpsReq[3,3]=3
global.dpsCode[3,4]="BLAST SHIELD";        global.dpsName[3,4]="Blast Shield";        global.dpsReq[3,4]=4
global.dpsCode[3,5]="HURRICANE";           global.dpsName[3,5]="Hurricane";           global.dpsReq[3,5]=5

global.dpsTitle[4]="EARTH SPELLS"; global.dpsLabel[4]="Earth"; global.dpsCount[4]=5
global.dpsCode[4,1]="ROCK SMASH";          global.dpsName[4,1]="Rock Smash";          global.dpsReq[4,1]=1
global.dpsCode[4,2]="NATURE'S GIFT";       global.dpsName[4,2]="Nature's Gift";       global.dpsReq[4,2]=1
global.dpsCode[4,3]="EARTH SHIFT";         global.dpsName[4,3]="Earth Shift";         global.dpsReq[4,3]=2
global.dpsCode[4,4]="RUPTURE";             global.dpsName[4,4]="Rupture";             global.dpsReq[4,4]=3
global.dpsCode[4,5]="ROCK DRILL";          global.dpsName[4,5]="Rock Drill";          global.dpsReq[4,5]=4

//the D-pad panel's boxes: 0 middle, 1 up, 2 left, 3 right, 4 down -> slot (left and right are the same slot)
global.dpsBoxSlot[0]=0; global.dpsBoxSlot[1]=1; global.dpsBoxSlot[2]=2; global.dpsBoxSlot[3]=2; global.dpsBoxSlot[4]=3
global.dpsBoxLabel[0]="MIDDLE"; global.dpsBoxLabel[1]="UP"; global.dpsBoxLabel[2]="LEFT"; global.dpsBoxLabel[3]="RIGHT"
global.dpsBoxLabel[4]="DOWN"
