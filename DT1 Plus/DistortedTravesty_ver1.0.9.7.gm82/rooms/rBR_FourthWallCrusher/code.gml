barrier1=instance_create(304,256,oBossBarrier)
barrier2=instance_create(704,256,oBossBarrier)
oPlayer1.x=512
oPlayer1.y=320
boss=instance_create(512,160,oFourthWallCrusher)
boss.activateBoss=1

global.currentBoss="Fourth Wall Crusher"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=19
