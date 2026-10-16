if global.gameProgress<=39
  global.gameProgress=40

if global.gameProgress=40 or global.gameProgress=41
{
  levelEvent=instance_create(0,0,oEvTransylvaniaW1)
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
}
if global.currentBoss="DTorso"
{
  barrier1=instance_create(304,192,oBossBarrier)
  barrier2=instance_create(304,240,oBossBarrier)
  barrier3=instance_create(704,240,oBossBarrier)
  oPlayer1.x=400
  oPlayer1.y=304
  storeStatus(1)
  boss=instance_create(576,224,oDTorso)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
