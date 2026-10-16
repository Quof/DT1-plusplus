wHeadSpawner=instance_create(0,0,oWolfHeadSpawner)
wHeadSpawner.reSpawnSpeed=180

wHeadSpawner=instance_create(0,0,oWolfHeadSpawner)
wHeadSpawner.reSpawnSpeed=150
wHeadSpawner.newEnemySpawn=oZSkullHead

if global.gameProgress<=234
  global.gameProgress=235
if global.gameProgress<=235
  gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
if !SS_IsSoundLooping(global.msc_VDlock2)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
