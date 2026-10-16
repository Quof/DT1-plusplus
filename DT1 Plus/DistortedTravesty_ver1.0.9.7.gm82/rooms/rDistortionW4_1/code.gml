global.location="Distortion Reckoning"

if global.showArea=true and global.gameProgress>=251
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Distortion Reckoning"
}
if global.gameProgress>=267
{
  exitPortal=instance_create(48,144,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=192
}

gameEvent=instance_create(0,0,oEvDistortionW4)
eventBackDummy=instance_create(0,0,oEvDistortion4_BackDummy)
eventLight=instance_create(0,0,oEvDistortion4_PlayerLamp)
eventBlackLayer=instance_create(0,0,oEvDistortion4_BlackLayer)
if global.gameProgress<=251
  levelEvent=instance_create(0,0,oEvDistortionConvo4)

if global.gameProgress>=253
  mapShroudSpawn(1)
if global.gameProgress>=251
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
