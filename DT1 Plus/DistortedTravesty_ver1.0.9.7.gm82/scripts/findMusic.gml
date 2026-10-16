/*
This script finds which music track to play depending on where the player is.
Returns the ID of the music file to play.
argument0: 0: stop previous music when starting boss music, 1: don't stop
*/
var tempFindMusic,stopPrev;
stopPrev=argument0

if global.currentBoss=""
{
  if global.location="Integrated Electrical Factory"
    tempFindMusic=global.msc_ElectricFactory
  else if global.location="Donut Plains"
  {
    if room=rDonutPlains1Secret
      tempFindMusic=global.msc_HopHopDonutLifts
    else
      tempFindMusic=global.msc_MarioOverworld
  }
  else if global.location="Toad Town"
    tempFindMusic=global.msc_ToadTown
  else if global.location="Rumpy Mountains"
    tempFindMusic=global.msc_HopHopDonutLifts
  else if global.location="Old Castle"
    tempFindMusic=global.msc_MarioFortress
  else if global.location="Bullet Bill Fort"
    tempFindMusic=global.msc_MarioOverworld
  else if global.location="Dark Depths"
    tempFindMusic=global.msc_DarkDepths
  else if global.location="Diluted Mansion"
    tempFindMusic=global.msc_DilutedMansion
  else if global.location="Vegetable Garden"
    tempFindMusic=global.msc_VegetableGarden
  else if global.location="Cheese Garden"
    tempFindMusic=global.msc_VegetableGarden
  else if global.location="Distortion"
    tempFindMusic=global.msc_Distortion1
  else if global.location="Distortion Windows"
    tempFindMusic=global.msc_Distortion1
  else if global.location="Distortion WTF 1"
    tempFindMusic=global.msc_Distortion3_1
  else if global.location="Distortion WTF 2"
    tempFindMusic=global.msc_Distortion3_2
  else if global.location="Distortion Reckoning"
    tempFindMusic=global.msc_Distortion4
  else if global.location="Dusty Ruins"
    tempFindMusic=global.msc_DustyRuins
  else if global.location="Dirty Ruins"
    tempFindMusic=global.msc_DustyRuins
  else if global.location="Abstracity"
  {
    if global.gameProgress>=275
      tempFindMusic=global.msc_WorldMapDistorted
    else
      tempFindMusic=global.msc_Abstracity
  }
  else if global.location="Fright Train"
  {
    if room=rFrightTrain5
      tempFindMusic=global.msc_ElevatorMusic
    else 
      tempFindMusic=global.msc_FrightTrain
  }
  else if global.location="West Side Jungle"
    tempFindMusic=global.msc_WestSideJungle
  else if global.location="The Hideout"
    tempFindMusic=global.msc_Hideout
  else if global.location="Metropolis"
  {
    if room=rMetropolisStageSelect
      tempFindMusic=global.msc_MMstageSelect
    else
      tempFindMusic=global.msc_MMintro
  }
  else if global.location="Metropolis Rooftops"
    tempFindMusic=global.msc_MMrooftop
  else if global.location="Napalm Man Area"
    tempFindMusic=global.msc_MMnapalm
  else if global.location="Gyro Man Area"
    tempFindMusic=global.msc_MMgyro
  else if global.location="Dive Man Area"
    tempFindMusic=global.msc_MMdive
  else if global.location="Mystery Man Area"
    tempFindMusic=global.msc_MMmystery
  else if global.location="Fortress Area"
    tempFindMusic=global.msc_MMfort1
  else if global.location="Fortress Inner Area"
    tempFindMusic=global.msc_MMfort2
  else if global.location="Maverick Factory"
    tempFindMusic=global.msc_MMfort1
  else if global.location="Black Rock Fortress"
    tempFindMusic=global.msc_BlackRockFortress
  else if global.location="Black Rock Fortress Spire"
    tempFindMusic=global.msc_BlackRockFortress
  else if global.location="Windy Slopes"
    tempFindMusic=global.msc_WindySlopes
  else if global.location="Sky Base"
    tempFindMusic=global.msc_WindySlopes
  else if global.location="Spire of Forgotten Souls"
    tempFindMusic=global.msc_SoFS
  else if global.location="Veiled Detritus"
    tempFindMusic=global.msc_VeiledDetritus
  else if global.location="Stalagmite Ruins"
    tempFindMusic=global.msc_VeiledDetritus
  else if global.location="Veiled Detritus Lock"
    tempFindMusic=global.msc_VDlock1
  else if global.location="Veiled Detritus Inner"
    tempFindMusic=global.msc_VDlock2
  else if global.location="Shady Woods"
    tempFindMusic=global.msc_ShadyWoods
  else if global.location="Shady Caves"
     tempFindMusic=global.msc_ShadyCaves
  else if global.location="Secured Data Segment"
    tempFindMusic=global.msc_DataSegment1
  else if global.location="Primary Memory"
    tempFindMusic=global.msc_PrimaryMemory
  else if global.location="Primary Memory Escape"
    tempFindMusic=global.msc_Escape
  else if global.location="Boss Room"
    tempFindMusic=global.msc_MarioFortress
}
else
{
  if stopPrev=0
    stopAllMusic()
  if global.currentBoss="DCyborg"
    tempFindMusic=global.msc_BossBattle1
  if global.currentBoss="DarkMind"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="DTorso"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="MetaKnight"
    tempFindMusic=global.msc_BossBattle1
  if global.currentBoss="Abyss Lord"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Demon Cursor"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Breakout Mystery"
    tempFindMusic=global.msc_TetrisB
  if global.currentBoss="Fourth Wall Crusher"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Flame Instigator"
    tempFindMusic=global.msc_BossBattle2
  if global.currentBoss="Quick Time Distorter"
    tempFindMusic=global.msc_BossBattle1
  if global.currentBoss="Dragonroot"
    tempFindMusic=global.msc_BossBattle2
  if global.currentBoss="Metallicardian"
    tempFindMusic=global.msc_BossBattle2
  if global.currentBoss="King Mech"
    tempFindMusic=global.msc_MMfortBoss
  if global.currentBoss="Copy X"
    tempFindMusic=global.msc_MMxBoss
  if global.currentBoss="Neo Guardian"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Necrobane"
    tempFindMusic=global.msc_SpireBoss
  if global.currentBoss="Wild Skull Machine"
    tempFindMusic=global.msc_MMfortBoss
  if global.currentBoss="Enflamed Blazing Bat"
    tempFindMusic=global.msc_BossBattle1
  if global.currentBoss="Spire Guardian"
    tempFindMusic=global.msc_SpireBoss
  if global.currentBoss="Dark Gear"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Arrghus"
    tempFindMusic=global.msc_BossBattle1
  if global.currentBoss="Ultimate Phalanx"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Data Collector"
    tempFindMusic=global.msc_DarknessBattle
  if global.currentBoss="Shroud Lord"
    tempFindMusic=global.msc_SpireBoss
  if global.currentBoss="Mecha Guardian"
    tempFindMusic=global.msc_SpireBoss
  if global.currentBoss="Mitra"
    tempFindMusic=global.msc_MitraBattle
}
if instance_exists(oPlayer1)
{
  if oPlayer1.bRaveActive=true
    tempFindMusic=global.msc_YouSpinMeRound
}

return tempFindMusic
