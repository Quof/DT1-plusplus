barrier1=instance_create(304,192,oBossBarrier)
barrier2=instance_create(304,240,oBossBarrier)
barrier3=instance_create(704,240,oBossBarrier)
oPlayer1.x=400
oPlayer1.y=304
boss=instance_create(576,224,oDTorso)
boss.activateBoss=1

global.currentBoss="DTorso"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=3
