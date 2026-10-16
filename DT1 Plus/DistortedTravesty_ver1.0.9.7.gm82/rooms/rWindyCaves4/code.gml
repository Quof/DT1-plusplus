if global.gameProgress<=192
  global.gameProgress=193

gameEvent=instance_create(0,0,oEvWindySlopesW1)
levelEvent=instance_create(0,0,oEvWindySlopesConvo1)

if global.gameProgress>=195
{
  if global.doorKeys[5]=0
  {
    newKey=instance_create(544,280,oKey)
    newKey.objectNum=5
  }
  mapShroudSpawn(1)
}

if global.currentBoss="Enflamed Blazing Bat"
{
  newBarrier=instance_create(144,224,oBossBarrier)
  newBarrier.image_yscale=1.5
  oPlayer1.x=336
  oPlayer1.y=288
  storeStatus(1)
  boss=instance_create(448,240,oEnflamedBlazingBat)
  boss.image_xscale=-1
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
