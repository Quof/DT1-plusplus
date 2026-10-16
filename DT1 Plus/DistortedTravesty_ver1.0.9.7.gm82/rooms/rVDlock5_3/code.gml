if global.gameProgress<=236
  global.gameProgress=237
gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
mapEvent=instance_create(0,0,oVDbossBlocks)

if global.gameProgress>=242
{
  exitPortal=instance_create(640,288,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=176
  exitPortal.newMapY=304
}

if global.currentBoss="Arrghus"
{
  newBarrier=instance_create(240,256,oBossBarrier)
  oPlayer1.x=512
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(512,176,oArrghus)
  boss.activateBoss=1
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
else
  stopAllMusic()

if global.gameProgress>=239 and global.gameProgress<=241
{
  newExit=instance_create(384,288,oExit)
  newExit.sprite_index=sEnergyRip1
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.toRoom=rVDtheArtist
  newExit.newStep=60
  newExit.newTrans=20
}
