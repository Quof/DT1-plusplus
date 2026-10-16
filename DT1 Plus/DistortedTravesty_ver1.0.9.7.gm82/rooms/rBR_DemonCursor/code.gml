windowsEvent=instance_create(0,0,oEvDistortionWindows2)

barrier=instance_create(144,288,oBossBarrier)
oPlayer1.x=384
oPlayer1.y=352
boss=instance_create(512,256,oDemonCursor)
boss.activateBoss=1

global.currentBoss="Demon Cursor"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=10
