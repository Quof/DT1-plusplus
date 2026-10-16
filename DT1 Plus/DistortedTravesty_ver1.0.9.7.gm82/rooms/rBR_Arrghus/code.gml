gameEvent=instance_create(0,0,oEvVeiledDetritusW1)
mapEvent=instance_create(0,0,oVDbossBlocks)

newBarrier=instance_create(240,256,oBossBarrier)
oPlayer1.x=512
oPlayer1.y=320
boss=instance_create(512,176,oArrghus)
boss.activateBoss=1
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

global.currentBoss="Arrghus"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=18
