barrier1=instance_create(144,256,oBossBarrier)
barrier2=instance_create(672,256,oBossBarrier)
oPlayer1.x=336
oPlayer1.y=320
boss=instance_create(496,320,oFlameInstigator)
boss.image_xscale=-1
boss.activateBoss=1

global.currentBoss="Flame Instigator"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=6
