global.location="Metropolis Rooftops"
oPlayer1.bUseBusterShot=1

if global.gameProgress<=130
  global.gameProgress=131

if !SS_IsSoundLooping(global.msc_MMrooftop)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
