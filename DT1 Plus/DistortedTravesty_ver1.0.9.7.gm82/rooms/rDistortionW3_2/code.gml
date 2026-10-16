gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress>=199
  mapShroudSpawn(1)
if global.gameProgress<=197
  global.gameProgress=198
if global.gameProgress<=198
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
drawTop=instance_create(0,0,oEvDistortionTopDraw3)
