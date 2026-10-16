/*
This script finds the default frequency for a sound file.
Returns the default frequency of the music file currently playing.
*/
var tempFindFreq;
tempFindFreq=0

if SS_IsSoundLooping(global.msc_ElectricFactory)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_MarioOverworld)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_ToadTown)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_HopHopDonutLifts)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MarioFortress)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_DarkDepths)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_DilutedMansion)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_VegetableGarden)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_Distortion1)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_Distortion3_1)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_Distortion3_2)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_Distortion4)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_DustyRuins)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_Abstracity)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_WorldMapDistorted)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_FrightTrain)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_ElevatorMusic)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_WestSideJungle)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_Hideout)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_MMstageSelect)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMintro)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMrooftop)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMnapalm)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMgyro)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMdive)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMmystery)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMfort1)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMfort2)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_BlackRockFortress)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_WindySlopes)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_SoFS)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_VeiledDetritus)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_VDlock1)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_VDlock2)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_ShadyWoods)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_ShadyCaves)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_DataSegment1)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_PrimaryMemory)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_Escape)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_BossBattle1)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_BossBattle2)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_DarknessBattle)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_TetrisB)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMfortBoss)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_MMxBoss)
  tempFindFreq=44100
else if SS_IsSoundLooping(global.msc_SpireBoss)
  tempFindFreq=22050
else if SS_IsSoundLooping(global.msc_MitraBattle)
  tempFindFreq=22050

return tempFindFreq
