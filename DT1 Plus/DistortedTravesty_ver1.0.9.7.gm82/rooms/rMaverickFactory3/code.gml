oPlayer1.bUseBusterShot=1
if global.MMnapalmProg<=6
  global.MMnapalmProg=7
if global.MMnapalmProg<=8
  gameEvent=instance_create(0,0,oEvMetropolisW1)

if global.currentBoss="Wild Skull Machine"
{
  newBarrierL1=instance_create(112,256,oBossBarrier)
  newBarrierR1=instance_create(512,256,oBossBarrier)
  oPlayer1.x=256
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(416,240,oWildSkullMachine)
  boss.image_xscale=-1
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
