/*
dpad spells change (added): the default DPad Spells boxes, global.dpsSpell[e,slot] = spell number (lists: scrDPadSpellInit;
slot 0 middle, 1 Up, 2 Left/Right, 3 Down). Wildfire, Piercing Stream, Hurricane and Rock Drill aren't on one: they have
to be put on a box in the D-pad panel. Used for a new game (oInitializeGame) and as the defaults when a save is loaded.
*/
global.dpsSpell[1,0]=1; global.dpsSpell[1,1]=3; global.dpsSpell[1,2]=2; global.dpsSpell[1,3]=4 //Fire: Fireball, Blast Off, Flame Pillar, Inferno
global.dpsSpell[2,0]=1; global.dpsSpell[2,1]=2; global.dpsSpell[2,2]=3; global.dpsSpell[2,3]=4 //Water: Water Blast, Water Barrier, Flood, Soothing Spring
global.dpsSpell[3,0]=1; global.dpsSpell[3,1]=2; global.dpsSpell[3,2]=3; global.dpsSpell[3,3]=4 //Wind: Wind Burst, Zephyr, Cyclone, Blast Shield
global.dpsSpell[4,0]=1; global.dpsSpell[4,1]=2; global.dpsSpell[4,2]=3; global.dpsSpell[4,3]=4 //Earth: Rock Smash, Nature's Gift, Earth Shift, Rupture
global.dpsSpell[0,0]=3; global.dpsSpell[0,1]=2; global.dpsSpell[0,2]=1; global.dpsSpell[0,3]=4 //Techniques: Kudeku, Wave of Awesome, Mental Insurrection, Grand Slam
