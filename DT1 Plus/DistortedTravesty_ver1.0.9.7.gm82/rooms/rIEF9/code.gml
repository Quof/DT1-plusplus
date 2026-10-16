if global.gameProgress<=12
  global.gameProgress=13
if global.gameProgress=13
  gameEvent=instance_create(0,0,oEvIEF)

if global.gameProgress>=128
{
  exitPortal=instance_create(320,272,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=192
  exitPortal.newMapY=160
}
mapShroudSpawn(1)
