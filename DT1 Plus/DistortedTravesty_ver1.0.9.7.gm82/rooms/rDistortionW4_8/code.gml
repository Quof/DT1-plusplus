gameEvent=instance_create(0,0,oEvDistortionW4)
if global.gameProgress<=264
  global.gameProgress=265

if global.gameProgress>=267
{
  exitPortal=instance_create(288,288,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=192
}
