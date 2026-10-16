global.location="Distortion"
if global.gameProgress=58
  gameEvent=instance_create(0,0,oEvDistortionW1)

if global.showArea=true and global.gameProgress>=70
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Distortion"
}

if global.gameProgress>=70
{
  exitPortal=instance_create(176,960,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=96
}
mapShroudSpawn(1)
roomEvent=instance_create(0,0,oEvDistortionAmbience1)
if global.gameProgress>=59
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
