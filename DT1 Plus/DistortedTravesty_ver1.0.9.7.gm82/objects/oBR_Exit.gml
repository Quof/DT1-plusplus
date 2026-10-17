#define Collision_oPlayer1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(ord(global.ctrlUp)) or keyboard_check_pressed(vk_up)) and global.gamePaused=false
{
  global.newMapX=0
  global.newMapY=0

  if type=1 //======================================== 01: Displaced Cyborg ======================================== +4
  {
    global.p1Level=5; global.p1MaxLife=2010; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=5; global.p1PhysicalDefense=15; global.p1SpiritPower=5; global.p1SpiritDefense=10
    global.p1MaxSpiritEnergy=1004
    global.p1MaxFireEnergy=1000; global.p1MaxWaterEnergy=1000
    global.p1MaxWindEnergy=1000; global.p1MaxEarthEnergy=1000
  }
  else if type=2 //======================================== 02: Dark Mind ======================================== +4
  {
    global.p1Level=9; global.p1MaxLife=2070; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=21; global.p1PhysicalDefense=31; global.p1SpiritPower=19; global.p1SpiritDefense=22
    global.p1MaxSpiritEnergy=1008
    global.p1MaxFireEnergy=1000; global.p1MaxWaterEnergy=1000
    global.p1MaxWindEnergy=1000; global.p1MaxEarthEnergy=1000
  }
  else if type=3 //======================================== 03: Distorted Torso ======================================== +2
  {
    global.p1Level=11; global.p1MaxLife=2095; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=33; global.p1PhysicalDefense=43; global.p1SpiritPower=32; global.p1SpiritDefense=31
    global.p1MaxSpiritEnergy=1035
    global.p1MaxFireEnergy=1010; global.p1MaxWaterEnergy=1010
    global.p1MaxWindEnergy=1010; global.p1MaxEarthEnergy=1010
  }
  else if type=4 //======================================== 04: Meta-Knight ======================================== +3
  {
    global.p1Level=14; global.p1MaxLife=2153; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=37; global.p1PhysicalDefense=47; global.p1SpiritPower=35; global.p1SpiritDefense=35
    global.p1MaxSpiritEnergy=1058
    global.p1MaxFireEnergy=1020; global.p1MaxWaterEnergy=1020
    global.p1MaxWindEnergy=1020; global.p1MaxEarthEnergy=1020
  }
  else if type=5 //======================================== 05: Abyss Lord ======================================== +1
  {
    global.p1Level=15; global.p1MaxLife=2155; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=49; global.p1PhysicalDefense=59; global.p1SpiritPower=47; global.p1SpiritDefense=43
    global.p1MaxSpiritEnergy=1099
    global.p1MaxFireEnergy=1040; global.p1MaxWaterEnergy=1040
    global.p1MaxWindEnergy=1040; global.p1MaxEarthEnergy=1040
  }
  else if type=6 //======================================== 06: Flame Instigator ======================================== +3
  {
    global.p1Level=18; global.p1MaxLife=2233; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=63; global.p1PhysicalDefense=73; global.p1SpiritPower=60; global.p1SpiritDefense=54
    global.p1MaxSpiritEnergy=1127
    global.p1MaxFireEnergy=1050; global.p1MaxWaterEnergy=1050
    global.p1MaxWindEnergy=1050; global.p1MaxEarthEnergy=1050
  }
  else if type=7 //======================================== 07: Quick Time Distorter ======================================== +2
  {
    global.p1Level=20; global.p1MaxLife=2308; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=75; global.p1PhysicalDefense=85; global.p1SpiritPower=73; global.p1SpiritDefense=64
    global.p1MaxSpiritEnergy=1174
    global.p1MaxFireEnergy=1070; global.p1MaxWaterEnergy=1070
    global.p1MaxWindEnergy=1070; global.p1MaxEarthEnergy=1070
  }
  else if type=8 //======================================== 08: Dragonroot ======================================== +1
  {
    global.p1Level=21; global.p1MaxLife=2311; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=77; global.p1PhysicalDefense=87; global.p1SpiritPower=74; global.p1SpiritDefense=65
    global.p1MaxSpiritEnergy=1195
    global.p1MaxFireEnergy=1080; global.p1MaxWaterEnergy=1080
    global.p1MaxWindEnergy=1080; global.p1MaxEarthEnergy=1080
  }
  else if type=9 //======================================== 09: Metallicardian ======================================== +2
  {
    global.p1Level=23; global.p1MaxLife=2361; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=79; global.p1PhysicalDefense=89; global.p1SpiritPower=76; global.p1SpiritDefense=67
    global.p1MaxSpiritEnergy=1237
    global.p1MaxFireEnergy=1100; global.p1MaxWaterEnergy=1100
    global.p1MaxWindEnergy=1100; global.p1MaxEarthEnergy=1100
  }
  else if type=10 //======================================== 10: Demon Cursor ======================================== +2
  {
    global.p1Level=25; global.p1MaxLife=2421; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=94; global.p1PhysicalDefense=94; global.p1SpiritPower=90; global.p1SpiritDefense=71
    global.p1MaxSpiritEnergy=1239
    global.p1MaxFireEnergy=1100; global.p1MaxWaterEnergy=1100
    global.p1MaxWindEnergy=1100; global.p1MaxEarthEnergy=1100
  }
  else if type=11 //======================================== 11: King Mech ======================================== +2
  {
    global.p1Level=27; global.p1MaxLife=2604; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=99; global.p1PhysicalDefense=99; global.p1SpiritPower=94; global.p1SpiritDefense=75
    global.p1MaxSpiritEnergy=1266
    global.p1MaxFireEnergy=1110; global.p1MaxWaterEnergy=1110
    global.p1MaxWindEnergy=1110; global.p1MaxEarthEnergy=1110
  }
  else if type=12 //======================================== 12: Copy X ======================================== +1
  {
    global.p1Level=28; global.p1MaxLife=2659; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=102; global.p1PhysicalDefense=102; global.p1SpiritPower=96; global.p1SpiritDefense=78
    global.p1MaxSpiritEnergy=1287
    global.p1MaxFireEnergy=1120; global.p1MaxWaterEnergy=1120
    global.p1MaxWindEnergy=1120; global.p1MaxEarthEnergy=1120
  }
  else if type=13 //======================================== 13: Neo Guardian ======================================== +3
  {
    global.p1Level=31; global.p1MaxLife=2680; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=119; global.p1PhysicalDefense=119; global.p1SpiritPower=113; global.p1SpiritDefense=98
    global.p1MaxSpiritEnergy=1290
    global.p1MaxFireEnergy=1120; global.p1MaxWaterEnergy=1120
    global.p1MaxWindEnergy=1120; global.p1MaxEarthEnergy=1120
  }
  else if type=14 //======================================== 14: Necrobane ======================================== +2
  {
    global.p1Level=33; global.p1MaxLife=2743; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=124; global.p1PhysicalDefense=124; global.p1SpiritPower=117; global.p1SpiritDefense=103
    global.p1MaxSpiritEnergy=1312
    global.p1MaxFireEnergy=1130; global.p1MaxWaterEnergy=1130
    global.p1MaxWindEnergy=1130; global.p1MaxEarthEnergy=1130
  }
  else if type=15 //======================================== 15: Wild Skull Machine ======================================== +1
  {
    global.p1Level=34; global.p1MaxLife=2748; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=126; global.p1PhysicalDefense=126; global.p1SpiritPower=119; global.p1SpiritDefense=105
    global.p1MaxSpiritEnergy=1313
    global.p1MaxFireEnergy=1130; global.p1MaxWaterEnergy=1130
    global.p1MaxWindEnergy=1130; global.p1MaxEarthEnergy=1130
  }
  else if type=16 //======================================== 16: Enflamed Blazing Robot ======================================== +2
  {
    global.p1Level=36; global.p1MaxLife=2781; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=131; global.p1PhysicalDefense=131; global.p1SpiritPower=124; global.p1SpiritDefense=110
    global.p1MaxSpiritEnergy=1320
    global.p1MaxFireEnergy=1130; global.p1MaxWaterEnergy=1130
    global.p1MaxWindEnergy=1130; global.p1MaxEarthEnergy=1130
  }
  else if type=17 //======================================== 17: Dark Gear ======================================== +3
  {
    global.p1Level=39; global.p1MaxLife=2872; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=148; global.p1PhysicalDefense=148; global.p1SpiritPower=140; global.p1SpiritDefense=126
    global.p1MaxSpiritEnergy=1348
    global.p1MaxFireEnergy=1140; global.p1MaxWaterEnergy=1140
    global.p1MaxWindEnergy=1140; global.p1MaxEarthEnergy=1140
  }
  else if type=18 //======================================== 18: Arrghus ======================================== +1
  {
    global.p1Level=40; global.p1MaxLife=2877; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=150; global.p1PhysicalDefense=150; global.p1SpiritPower=143; global.p1SpiritDefense=129
    global.p1MaxSpiritEnergy=1349
    global.p1MaxFireEnergy=1140; global.p1MaxWaterEnergy=1140
    global.p1MaxWindEnergy=1140; global.p1MaxEarthEnergy=1140
  }
  else if type=19 //======================================== 19: Fourth Wall Crusher ======================================== +2
  {
    global.p1Level=42; global.p1MaxLife=2910; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=165; global.p1PhysicalDefense=165; global.p1SpiritPower=157; global.p1SpiritDefense=140
    global.p1MaxSpiritEnergy=1396
    global.p1MaxFireEnergy=1160; global.p1MaxWaterEnergy=1160
    global.p1MaxWindEnergy=1160; global.p1MaxEarthEnergy=1160
  }
  else if type=20 //======================================== 20: Ultimate Phalanx ======================================== +2
  {
    global.p1Level=44; global.p1MaxLife=2973; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=170; global.p1PhysicalDefense=180; global.p1SpiritPower=161; global.p1SpiritDefense=145
    global.p1MaxSpiritEnergy=1398
    global.p1MaxFireEnergy=1160; global.p1MaxWaterEnergy=1160
    global.p1MaxWindEnergy=1160; global.p1MaxEarthEnergy=1160
  }
  else if type=21 //======================================== 21: Spire Guardian ======================================== +6
  {
    global.p1Level=50; global.p1MaxLife=3082; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=184; global.p1PhysicalDefense=194; global.p1SpiritPower=175; global.p1SpiritDefense=158
    global.p1MaxSpiritEnergy=1449
    global.p1MaxFireEnergy=1180; global.p1MaxWaterEnergy=1180
    global.p1MaxWindEnergy=1180; global.p1MaxEarthEnergy=1180
  }
  else if type=22 //======================================== 22: Data Collector ======================================== +3
  {
    global.p1Level=53; global.p1MaxLife=3203; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=201; global.p1PhysicalDefense=201; global.p1SpiritPower=181; global.p1SpiritDefense=172
    global.p1MaxSpiritEnergy=1492
    global.p1MaxFireEnergy=1200; global.p1MaxWaterEnergy=1200
    global.p1MaxWindEnergy=1200; global.p1MaxEarthEnergy=1200
  }
  else if type=23 //======================================== 23: Shroud Lord ======================================== +3
  {
    global.p1Level=56; global.p1MaxLife=3221; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=208; global.p1PhysicalDefense=208; global.p1SpiritPower=188; global.p1SpiritDefense=179
    global.p1MaxSpiritEnergy=1495
    global.p1MaxFireEnergy=1200; global.p1MaxWaterEnergy=1200
    global.p1MaxWindEnergy=1200; global.p1MaxEarthEnergy=1200
  }
  else if type=24 //======================================== 24: Mecha Guardian ======================================== +4
  {
    global.p1Level=60; global.p1MaxLife=3252; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=218; global.p1PhysicalDefense=218; global.p1SpiritPower=197; global.p1SpiritDefense=188
    global.p1MaxSpiritEnergy=1499
    global.p1MaxFireEnergy=1200; global.p1MaxWaterEnergy=1200
    global.p1MaxWindEnergy=1200; global.p1MaxEarthEnergy=1200
  }
  else if type=25 //======================================== 25: The Artist ======================================== +4
  {
    global.p1Level=64; global.p1MaxLife=3292; global.p1Life=global.p1MaxLife
    global.p1PhysicalPower=230; global.p1PhysicalDefense=230; global.p1SpiritPower=209; global.p1SpiritDefense=200
    global.p1MaxSpiritEnergy=1503
    global.p1MaxFireEnergy=1200; global.p1MaxWaterEnergy=1200
    global.p1MaxWindEnergy=1200; global.p1MaxEarthEnergy=1200
  }

  global.p1SpiritEnergy=global.p1MaxSpiritEnergy
  global.p1FireEnergy=global.p1MaxFireEnergy
  global.p1WaterEnergy=global.p1MaxWaterEnergy
  global.p1WindEnergy=global.p1MaxWindEnergy
  global.p1EarthEnergy=global.p1MaxEarthEnergy
  //transition_steps=15
  transition_steps=15/gDeltaTime //60fps change: transition_steps counts frames: the same time
  transition_kind=5
  room_goto(toRoom)
}
