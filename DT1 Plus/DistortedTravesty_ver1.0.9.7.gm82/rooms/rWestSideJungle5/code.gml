backFollow=instance_create(0,0,oBackgroundFollow)
backFollow.type=0
backFollow.backSet=backWestSideJungle
backFollow.wSize=512
backFollow.hSize=384
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backFG1WestSideJungle
backFollowFore.xMoveScale=0.55
backFollowFore.yMoveScale=0.55
backFollowFore.depth=1499999
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backFG2WestSideJungle
backFollowFore.xMoveScale=0.85
backFollowFore.yMoveScale=0.85
backFollowFore.bgAlpha=0.4
backFollowFore.depth=5

if global.gameProgress<=104
  global.gameProgress=105

if global.gameProgress<=106
  levelEvent=instance_create(0,0,oEvWSJungleW1)
mapShroudSpawn(1)
if global.currentBoss="Dragonroot"
{
  newBarrierL1=instance_create(112,0,oBossBarrier)
  newBarrierL2=instance_create(112,64,oBossBarrier)
  newBarrierL3=instance_create(112,128,oBossBarrier)
  newBarrierL4=instance_create(112,192,oBossBarrier)
  newBarrierL5=instance_create(112,256,oBossBarrier)
  newBarrierL6=instance_create(112,320,oBossBarrier)
  newBarrierR1=instance_create(640,0,oBossBarrier)
  newBarrierR2=instance_create(640,64,oBossBarrier)
  newBarrierR3=instance_create(640,128,oBossBarrier)
  newBarrierR4=instance_create(640,192,oBossBarrier)
  newBarrierR5=instance_create(640,256,oBossBarrier)
  newBarrierR6=instance_create(640,320,oBossBarrier)
  for(i=0;i<272;i+=16)
  {
    newSpike=instance_create(128,i,oDirtSpikeL)
    newSpike.sprite_index=sDR_Spikes
  }
  oPlayer1.x=416
  oPlayer1.y=272
  storeStatus(1)
  boss=instance_create(576,272,oDragonroot)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
