global.dungeonMapData[0,1]=1
if global.gameProgress<=224
  global.gameProgress=225
if global.gameProgress=225
  gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
