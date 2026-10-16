if global.gameProgress<=5
  global.gameProgress=6
if global.gameProgress=6
  gameEvent=instance_create(0,0,oStartTutorial)
if global.gameProgress>=6
  levelEvent=instance_create(0,0,oEvIEF)
mapShroudSpawn(1)
