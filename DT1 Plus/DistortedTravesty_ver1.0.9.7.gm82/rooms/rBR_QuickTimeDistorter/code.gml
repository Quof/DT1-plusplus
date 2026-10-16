barrier1=instance_create(144,0,oBossBarrier)
barrier2=instance_create(144,64,oBossBarrier)
barrier3=instance_create(144,128,oBossBarrier)
oPlayer1.x=240
oPlayer1.y=192
boss=instance_create(336,96,oQuickTimeDistorter)
boss.activateBoss=1

global.currentBoss="Quick Time Distorter"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=7
