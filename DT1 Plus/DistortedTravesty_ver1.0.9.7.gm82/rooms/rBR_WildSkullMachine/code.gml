oPlayer1.bUseBusterShot=1

newBarrierL1=instance_create(112,256,oBossBarrier)
newBarrierR1=instance_create(512,256,oBossBarrier)
oPlayer1.x=256
oPlayer1.y=320
boss=instance_create(416,240,oWildSkullMachine)
boss.image_xscale=-1
boss.activateBoss=1

global.currentBoss="Wild Skull Machine"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=15
