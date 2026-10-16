background_index[0]=backHideout
background_visible[0]=true

newBarrierL1=instance_create(208,272,oBossBarrier)
newBarrierR1=instance_create(672,272,oBossBarrier)
oPlayer1.x=384
oPlayer1.y=336
boss=instance_create(576,272,oMetallicardian)
boss.image_xscale=-1
boss.activateBoss=1

global.currentBoss="Metallicardian"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=9
