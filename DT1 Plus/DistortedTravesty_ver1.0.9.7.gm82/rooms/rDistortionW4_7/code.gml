gameEvent=instance_create(0,0,oEvDistortionW4)
if global.gameProgress<=261
  global.gameProgress=262
if global.gameProgress<=263
  levelEvent=instance_create(0,0,oEvDistortionConvo4)

if global.gameProgress>=264
  mapShroudSpawn(1)
