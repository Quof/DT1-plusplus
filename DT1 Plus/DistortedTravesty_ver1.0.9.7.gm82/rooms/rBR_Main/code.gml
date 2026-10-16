oPlayer1.runAcc=9
oPlayer1.initialJumpAcc=-16
oPlayer1.jumpTimeTotal=50

global.location="Boss Room"
oPlayer1.x=1008
oPlayer1.y=449
global.gamePaused=false
global.showHUD=true
global.currentBoss=""
stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=0
