if global.gameProgress<=61
  global.gameProgress=62
if global.gameProgress<=63
{
  gameEvent=instance_create(0,0,oEvDistortionW1)
  levelEvent=instance_create(0,0,oEvDistortionConvo1)
}
mapShroudSpawn(1)
if global.currentBoss="Abyss Lord"
{
  barrier1=instance_create(48,224,oBossBarrier)
  barrier2=instance_create(544,224,oBossBarrier)
  oPlayer1.x=304
  oPlayer1.y=288
  storeStatus(1)
  boss=instance_create(304,160,oAbyssLordBody)
  boss.activateBoss=1
}

roomEvent=instance_create(0,0,oEvDistortionAmbience1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
