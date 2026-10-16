global.dungeonMapData[0,11]=1
global.location="Veiled Detritus"
if global.VDportals[1]>=3
  gameEvent=instance_create(0,0,oEvVDLockW1)

if global.currentBoss="Dark Gear"
{
  newBarrierL1=instance_create(1024,240,oBossBarrier)
  newBarrierR1=instance_create(1392,240,oBossBarrier)
  oPlayer1.x=1216
  oPlayer1.y=304
  storeStatus(1)
  boss=instance_create(1216,96,oDarkGear)
  boss.activateBoss=1
}
else
if !SS_IsSoundLooping(global.msc_VeiledDetritus)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
