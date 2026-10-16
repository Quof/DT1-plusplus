global.location="Distortion WTF 1"
gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress>=213
  mapShroudSpawn(1)
if global.gameProgress<=209
  global.gameProgress=210
if global.gameProgress<=210
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
drawTop=instance_create(0,0,oEvDistortionTopDraw3)
if !SS_IsSoundLooping(global.msc_Distortion3_1)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
