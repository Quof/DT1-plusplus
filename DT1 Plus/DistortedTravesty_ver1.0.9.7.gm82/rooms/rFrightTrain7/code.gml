if global.gameProgress<=96
  global.gameProgress=97
if global.gameProgress<=98
  levelEvent=instance_create(0,0,oEvFTrainW1)
trainNumbers=instance_create(0,0,oEvFTrainNumbers)

if global.gameProgress>=99
{
  exitPortal=instance_create(512,192,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=416
  exitPortal.newMapY=240
}

if global.currentBoss="Quick Time Distorter"
{
  barrier1=instance_create(144,0,oBossBarrier)
  barrier2=instance_create(144,64,oBossBarrier)
  barrier3=instance_create(144,128,oBossBarrier)
  oPlayer1.x=240
  oPlayer1.y=192
  storeStatus(1)
  boss=instance_create(336,96,oQuickTimeDistorter)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
