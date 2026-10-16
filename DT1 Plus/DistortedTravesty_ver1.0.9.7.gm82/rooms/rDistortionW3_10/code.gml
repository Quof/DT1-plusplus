gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress<=212
  global.gameProgress=213
if global.gameProgress<=213
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
if global.gameProgress>=215
{
  exitPortal=instance_create(256,192,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=160
}
stopAllMusic()
