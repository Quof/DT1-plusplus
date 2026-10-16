if global.gameProgress<=125
  global.gameProgress=126

gameEvent=instance_create(0,0,oEvDistortionW2)
windowsEvent=instance_create(0,0,oEvDistortionWindows2)

if global.currentBoss="Demon Cursor"
{
  barrier=instance_create(144,288,oBossBarrier)
  oPlayer1.x=384
  oPlayer1.y=352
  storeStatus(1)
  boss=instance_create(512,256,oDemonCursor)
  boss.activateBoss=1
}

if global.gameProgress>=128
{
  exitPortal=instance_create(608,320,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=128
}
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
