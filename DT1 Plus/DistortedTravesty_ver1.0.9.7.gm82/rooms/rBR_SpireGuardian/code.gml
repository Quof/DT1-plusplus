background_hspeed[0]=1
background_vspeed[0]=0.25
global.cTimerMinute=5
global.cTimerSecond=0
global.cTimerHundred=0
gameEvent=instance_create(0,0,oEvSoFSW1)
gameEvent.currentFloor=100

barrier=instance_create(80,256,oBossBarrier)
boss=instance_create(368,192,oSpireGuardian)
boss.activateBoss=1
oEvSoFSW1.sceneProgress=10
oPlayer1.x=192
oPlayer1.y=320

global.currentBoss="Spire Guardian"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=21
