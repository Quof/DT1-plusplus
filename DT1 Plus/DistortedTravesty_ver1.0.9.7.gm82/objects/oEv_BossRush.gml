#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
01: Displaced Cyborg
02: Dark Mind
03: Distorted Torso
04: Meta-Knight
05: Abyss Lord
06: Flame Instigator
07: Quick Time Distorter
08: Dragonroot
09: Metallicardian
10: Demon Cursor
11: King Mech
12: Copy X
13: Neo Guardian
14: Necrobane
15: Wild Skull Machine
16: Enflamed Blazing Robot
17: Dark Gear
18: Arrghus
19: Fourth Wall Crusher
20: Ultimate Phalanx
21: Spire Guardian
22: Data Collector
23: Shroud Lord
24: Mecha Guardian
*/

bRoomTele=0
global.p1CurrentElement=0
global.p1TechniqueEquip="MENTAL INSURRECTION"
global.p1SpellEquip=""

if room=rBR_Main
{
  global.currentBoss=""
  global.hasSuaveToken=1
  global.techLv=5
  global.fireLv=5
  global.waterLv=5
  global.windLv=5
  global.earthLv=4
  global.p1FireEquip="FIREBALL"
  global.p1WaterEquip="WATER BLAST"
  global.p1WindEquip="WIND BURST"
  global.p1EarthEquip="ROCK SMASH"
}
else if room=rBR_DisplacedCyborg
{
  global.hasSuaveToken=0; global.techLv=0
  global.fireLv=1; global.waterLv=1
  global.windLv=1; global.earthLv=1
  global.p1TechniqueEquip=""
}
else if room=rBR_DarkMind
{
  global.hasSuaveToken=0; global.techLv=1
  global.fireLv=1; global.waterLv=1
  global.windLv=1; global.earthLv=1
}
else if room=rBR_DistortedTorso
{
  global.hasSuaveToken=0; global.techLv=1
  global.fireLv=2; global.waterLv=2
  global.windLv=1; global.earthLv=1
}
else if room=rBR_MetaKnight
{
  global.hasSuaveToken=0; global.techLv=1
  global.fireLv=2; global.waterLv=2
  global.windLv=2; global.earthLv=2
}
else if room=rBR_AbyssLord
{
  global.hasSuaveToken=0; global.techLv=2
  global.fireLv=2; global.waterLv=2
  global.windLv=2; global.earthLv=2
}
else if room=rBR_FlameInstigator
{
  global.hasSuaveToken=0; global.techLv=2
  global.fireLv=2; global.waterLv=2
  global.windLv=2; global.earthLv=2
}
else if room=rBR_QuickTimeDistorter
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=2; global.waterLv=2
  global.windLv=2; global.earthLv=2
}
else if room=rBR_Dragonroot
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=3; global.waterLv=3
  global.windLv=3; global.earthLv=3
}
else if room=rBR_Metallicardian
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=3; global.waterLv=3
  global.windLv=3; global.earthLv=3
}
else if room=rBR_DemonCursor
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=3; global.waterLv=3
  global.windLv=3; global.earthLv=3
}
else if room=rBR_KingMech
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_CopyX
{
  global.hasSuaveToken=1; global.techLv=3
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_NeoGuardian
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_Necrobane
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_WildSkullMachine
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_EnflamedBlazingRobot
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=4; global.waterLv=4
  global.windLv=4; global.earthLv=4
}
else if room=rBR_DarkGear
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_Arrghus
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_FourthWallCrusher
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_UltimatePhalanx
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
  lavaTop=32
  lavaAlpha=0.415
  lavaTopTimer=0
  lavaAlphaTimer=0
}
else if room=rBR_SpireGuardian
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_DataCollector
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_ShroudLord
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_MechaGuardian
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
else if room=rBR_TheArtist
{
  global.hasSuaveToken=1; global.techLv=4
  global.fireLv=5; global.waterLv=5
  global.windLv=5; global.earthLv=5
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rBR_Main
{
  oPlayer1.spiritEnergy=oPlayer1.maxSpiritEnergy
  oPlayer1.fireEnergy=oPlayer1.maxFireEnergy
  oPlayer1.waterEnergy=oPlayer1.maxWaterEnergy
  oPlayer1.windEnergy=oPlayer1.maxWindEnergy
  oPlayer1.earthEnergy=oPlayer1.maxEarthEnergy
  oPlayer1.dashPoints=5
}
else if room=rBR_DisplacedCyborg
{
  if oDCyborg.life<=0 {bRoomTele=1}
}
else if room=rBR_DarkMind
{
  if oDarkMind.life<=0 {bRoomTele=1}
}
else if room=rBR_DistortedTorso
{
  if oDTorso.life<=0 {bRoomTele=1}
}
else if room=rBR_MetaKnight
{
  if oMetaKnight.life<=0 {bRoomTele=1}
}
else if room=rBR_AbyssLord
{
  if oAbyssLord.life<=0 {bRoomTele=1}
}
else if room=rBR_FlameInstigator
{
  if oFlameInstigator.life<=0 {bRoomTele=1}
}
else if room=rBR_QuickTimeDistorter
{
  if oQuickTimeDistorter.life<=0 {bRoomTele=1}
}
else if room=rBR_Dragonroot
{
  if oDragonroot.life<=0 {bRoomTele=1}
}
else if room=rBR_Metallicardian
{
  if oMetallicardian.life<=0 {bRoomTele=1}
}
else if room=rBR_DemonCursor
{
  if oDemonCursor.life<=0 {bRoomTele=1}
}
else if room=rBR_KingMech
{
  if oKingMech.life<=0 {bRoomTele=1}
}
else if room=rBR_CopyX
{
  if oCopyX.life<=0 {bRoomTele=1}
}
else if room=rBR_NeoGuardian
{
  if oNeoGuardian.life<=0 {bRoomTele=1}
}
else if room=rBR_Necrobane
{
  if oNecrobane.life<=0 {bRoomTele=1}
}
else if room=rBR_WildSkullMachine
{
  if oWildSkullMachine.life<=0 {bRoomTele=1}
}
else if room=rBR_EnflamedBlazingRobot
{
  if oEnflamedBlazingBat.life<=0 {bRoomTele=1}
}
else if room=rBR_DarkGear
{
  if oDarkGear.life<=0 {bRoomTele=1}
}
else if room=rBR_Arrghus
{
  if oArrghus.life<=0 {bRoomTele=1}
}
else if room=rBR_FourthWallCrusher
{
  if oFourthWallCrusher.life<=0 {bRoomTele=1}
}
else if room=rBR_UltimatePhalanx
{
  if oPhalanx.life<=0 {bRoomTele=1}
}
else if room=rBR_SpireGuardian
{
  if oSpireGuardian.life<=0 {bRoomTele=1}
}
else if room=rBR_DataCollector
{
  if oDataCollector.life<=0 {bRoomTele=1}
}
else if room=rBR_ShroudLord
{
  if oShroudLordLv2.life<=0 {bRoomTele=1}
}
else if room=rBR_MechaGuardian
{
  if oMechaGuardian.life<=0 {bRoomTele=1}
}
else if room=rBR_TheArtist
{
  if oMitra.life<=0 {bRoomTele=1}
}

if bRoomTele=1
{
  transition_kind=20
  transition_steps=30
  room_goto(rBR_Main)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rBR_Metallicardian and instance_exists(oMarioLava)
{
  draw_set_alpha(0.2)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(224,32,672,336,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}

if room=rBR_UltimatePhalanx
{
  lavaTopTimer+=1
  if lavaTopTimer>=1 and lavaTopTimer<=200
    lavaTop+=0.05
  else if lavaTopTimer>=201 and lavaTopTimer<=400
  {
    lavaTop-=0.05
    if lavaTopTimer=400
      lavaTopTimer=0
  }
  lavaAlphaTimer+=1
  if lavaAlphaTimer>=1 and lavaAlphaTimer<=300
    lavaAlpha-=0.0005
  else if lavaAlphaTimer>=301 and lavaAlphaTimer<=600
  {
    lavaAlpha+=0.0005
    if lavaAlphaTimer=600
      lavaAlphaTimer=0
  }

  draw_set_color(make_color_rgb(216,0,0))
  draw_set_alpha(lavaAlpha)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(0,lavaTop,1024,384,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
