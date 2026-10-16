backFollow1=instance_create(0,0,oBackgroundFollow)
backFollow1.type=2
backFollow1.backSet=backShadyCavesWall
backFollow1.image_xscale=2
backFollow1.image_yscale=2
backFollow1.xMoveScale=0.9
backFollow1.yMoveScale=0.9
backFollow2=instance_create(0,0,oBackgroundFollow)
backFollow2.type=2
backFollow2.backSet=backShadyCaves
backFollow2.image_xscale=2.5
backFollow2.image_yscale=2.5
backFollow2.xMoveScale=0.85
backFollow2.yMoveScale=0.85
backFollow2.depth=1400000

if global.gameProgress=272
  global.gameProgress=273
levelEvent=instance_create(0,0,oEvShadyWoodsW1)

if global.currentBoss="Ultimate Phalanx"
{
  newBarrier=instance_create(352,80,oBossBarrier)
  newBarrier.image_yscale=3.75
  oPlayer1.x=720
  oPlayer1.y=248
  newPlat=instance_create(704,248,oPhalPlatform)
  newPlat.moveSpeedX=2
  newPlat.moveSpeedY=0
  newPlat.bStart=1
  storeStatus(1)
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
