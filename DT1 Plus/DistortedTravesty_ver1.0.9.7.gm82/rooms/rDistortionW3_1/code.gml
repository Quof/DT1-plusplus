global.location="Distortion WTF 1"
gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress<=197
  levelEvent=instance_create(0,0,oEvDistortionConvo3)
drawTop=instance_create(0,0,oEvDistortionTopDraw3)

if global.showArea=true and global.gameProgress>=197
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Distortion WTF"
}
if global.gameProgress>=215
{
  exitPortal=instance_create(32,288,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=160
}
if global.gameProgress>=198
  mapShroudSpawn(1)
if global.gameProgress>=197
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
