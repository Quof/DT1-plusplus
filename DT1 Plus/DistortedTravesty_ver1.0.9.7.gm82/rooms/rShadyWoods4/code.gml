backFollow=instance_create(0,0,oBackgroundFollow)
backFollow.type=2
backFollow.backSet=backShadyWoods
backFollow.image_xscale=1.6
backFollow.image_yscale=1.6
backFollow.xMoveScale=0.75
backFollow.yMoveScale=0.75
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backShadyWoodsTrees
backFollowFore.image_xscale=1.13
backFollowFore.image_yscale=1.13
backFollowFore.xMoveScale=-0.2
backFollowFore.yMoveScale=-0.2
backFollowFore.depth=-5

if global.gameProgress<=246
  global.gameProgress=247
levelEvent=instance_create(0,0,oEvShadyWoodsW1)

if global.currentBoss="Ultimate Phalanx"
{
  newBarrier=instance_create(352,-128,oBossBarrier)
  newBarrier.image_yscale=7
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
