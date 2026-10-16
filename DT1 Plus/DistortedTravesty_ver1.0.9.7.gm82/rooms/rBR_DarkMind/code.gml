barrier1=instance_create(176,240,oBossBarrier)
oPlayer1.x=368
boss=instance_create(544,240,oDarkMind)
boss.activateBoss=1

global.currentBoss="DarkMind"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=2
