gameEvent=instance_create(0,0,oEvDistortionW4)
if global.gameProgress<=251
  global.gameProgress=252
if global.gameProgress<=253
  levelEvent=instance_create(0,0,oEvDistortionConvo4)
if global.gameProgress>=254
  mapShroudSpawn(1)
