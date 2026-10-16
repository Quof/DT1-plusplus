barrier1=instance_create(48,224,oBossBarrier)
barrier2=instance_create(544,224,oBossBarrier)
oPlayer1.x=304
oPlayer1.y=288
boss=instance_create(304,160,oAbyssLordBody)
boss.activateBoss=1

global.currentBoss="Abyss Lord"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=5
roomEvent=instance_create(0,0,oEvDistortionAmbience1)
