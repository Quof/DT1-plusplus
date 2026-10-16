if global.gameProgress>=203
  mapShroudSpawn(1)
if global.gameProgress<=201
  global.gameProgress=202
gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress<=202
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
