background_hspeed[0]=1
background_vspeed[0]=0.25
oPlayer1.x=64
oPlayer1.y=320
global.cTimerMinute=5
global.cTimerSecond=0
global.cTimerHundred=0
global.sofsCurrent=11
if global.sofsMax=9
  global.sofsMax=10
gameEvent=instance_create(0,0,oEvSoFSW1)
gameEvent.currentFloor=100
stopAllMusic()

if global.currentBoss="Spire Guardian"
{
  barrier=instance_create(80,256,oBossBarrier)
  storeStatus(1)
  boss=instance_create(368,192,oSpireGuardian)
  boss.activateBoss=1
  oEvSoFSW1.sceneProgress=10
  oPlayer1.x=192
  oPlayer1.y=320
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
