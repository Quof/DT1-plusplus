global.location="Distortion WTF 2"
mHeadSpawner=instance_create(0,0,oMedusaHeadSpawner)
mHeadSpawner.reSpawnSpeed=115
gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress>=202
  mapShroudSpawn(1)
if global.gameProgress<=200
  global.gameProgress=201
if global.gameProgress<=201
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
if !SS_IsSoundLooping(global.msc_Distortion3_2)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
