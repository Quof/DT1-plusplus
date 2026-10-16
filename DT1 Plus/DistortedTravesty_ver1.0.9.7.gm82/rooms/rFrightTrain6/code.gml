if global.gameProgress=96
  convoEvent=instance_create(0,0,oEvFTrainConvo1)
trainNumbers=instance_create(0,0,oEvFTrainNumbers)
mapShroudSpawn(1)
if !SS_IsSoundLooping(global.msc_FrightTrain)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
