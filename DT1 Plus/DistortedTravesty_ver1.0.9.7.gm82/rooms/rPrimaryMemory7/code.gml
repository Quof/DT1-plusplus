background_visible[1]=1
background_alpha[1]=0.4
tile_layer_delete(1000001)

if global.gameProgress<=338
  global.gameProgress=339
gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)
levelEvent=instance_create(0,0,oEvPrimaryMemoryConvo1)

if global.currentBoss="Mitra"
{
  oPlayer1.x=448
  oPlayer1.y=304
  storeStatus(1)
  boss=instance_create(544,240,oMitra)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
