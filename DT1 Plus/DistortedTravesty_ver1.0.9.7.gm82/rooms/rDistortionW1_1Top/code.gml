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
  exitPortal=instance_create(176,1888,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=96
  global.musicPlaying[0]=global.msc_Distortion1
}
mapShroudSpawn(1)
roomEvent=instance_create(0,0,oEvDistortionAmbience1)
