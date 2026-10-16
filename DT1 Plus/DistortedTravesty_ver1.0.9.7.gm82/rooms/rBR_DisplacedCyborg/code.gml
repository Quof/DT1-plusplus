barrier1=instance_create(112,240,oBossBarrier)
barrier2=instance_create(576,240,oBossBarrier)
oPlayer1.x=320
boss=instance_create(496,240,oDCyborg)
boss.sprite_index=sNeteryuIdle
boss.activateBoss=1

global.currentBoss="DCyborg"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=1
