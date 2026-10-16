gameEvent=instance_create(0,0,oEvDistortionW4)
levelEvent=instance_create(0,0,oEvDistortionConvo4)
if global.gameProgress<=258
  global.gameProgress=259

if global.currentBoss="Fourth Wall Crusher"
{
  barrier1=instance_create(304,256,oBossBarrier)
  barrier2=instance_create(704,256,oBossBarrier)
  oPlayer1.x=512
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(512,160,oFourthWallCrusher)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
