global.dungeonMapData[0,18]=1
global.location="Veiled Detritus"
if !SS_IsSoundLooping(global.msc_VeiledDetritus)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
