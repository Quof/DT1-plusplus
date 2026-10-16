if global.gameProgress<=43
  global.gameProgress=44
if global.gameProgress=44
  levelEvent=instance_create(0,0,oEvTransylvaniaW1)
if global.gameProgress=44 or global.gameProgress=45
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
roomEvent=instance_create(0,0,oEvTransylvaniaAmbience)
mapShroudSpawn(1)
