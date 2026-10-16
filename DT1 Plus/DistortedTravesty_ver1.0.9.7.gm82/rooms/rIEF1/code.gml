global.location="Integrated Electrical Factory"
if global.gameProgress<=0
  global.gameProgress=1
if global.gameProgress=1
  gameEvent=instance_create(0,0,oStartTutorial)

if global.gameProgress>=128
{
  if global.showArea=true
  {
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Integrated Electrical Factory"
  }
  exitPortal=instance_create(176,672,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=352
  exitPortal.newMapY=48
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
mapShroudSpawn(1)
