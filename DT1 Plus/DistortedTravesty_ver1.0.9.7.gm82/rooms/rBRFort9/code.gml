backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backBRFort1
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=0.75
backFollowFore.depth=1499999

if global.gameProgress<=167
  global.gameProgress=168
levelEvent=instance_create(0,0,oEvBRFW1)

if global.currentBoss="Neo Guardian"
{
  newBarrierL1=instance_create(272,256,oBossBarrier)
  newBarrierR1=instance_create(640,256,oBossBarrier)
  oPlayer1.x=448
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(576,320,oNeoGuardian)
  boss.image_xscale=-1
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
