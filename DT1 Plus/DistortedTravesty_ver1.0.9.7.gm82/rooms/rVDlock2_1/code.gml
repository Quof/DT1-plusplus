global.location="Veiled Detritus Lock"
wHeadSpawner=instance_create(0,0,oWolfHeadSpawner)
wHeadSpawner.reSpawnSpeed=80
wHeadSpawner.newEnemySpawn=oZSkullHead
gameEvent=instance_create(0,0,oEvVDLockW1)
if !SS_IsSoundLooping(global.msc_VDlock1)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
