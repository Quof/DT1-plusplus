global.location="Veiled Detritus Inner"
if global.gameProgress<=231
  global.gameProgress=232
if global.gameProgress<=233
  gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
if !SS_IsSoundLooping(global.msc_VDlock2)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
