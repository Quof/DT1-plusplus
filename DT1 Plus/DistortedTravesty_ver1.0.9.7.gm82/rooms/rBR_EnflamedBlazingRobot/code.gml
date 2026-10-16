newBarrier=instance_create(144,224,oBossBarrier)
newBarrier.image_yscale=1.5
oPlayer1.x=336
oPlayer1.y=288
boss=instance_create(448,240,oEnflamedBlazingBat)
boss.image_xscale=-1
boss.activateBoss=1

global.currentBoss="Enflamed Blazing Bat"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=16
