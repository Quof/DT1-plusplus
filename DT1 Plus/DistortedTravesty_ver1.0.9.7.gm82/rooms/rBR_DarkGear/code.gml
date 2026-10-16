newBarrierL1=instance_create(1024,240,oBossBarrier)
newBarrierR1=instance_create(1392,240,oBossBarrier)
oPlayer1.x=1216
oPlayer1.y=304
boss=instance_create(1216,96,oDarkGear)
boss.activateBoss=1

global.currentBoss="Dark Gear"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=17
