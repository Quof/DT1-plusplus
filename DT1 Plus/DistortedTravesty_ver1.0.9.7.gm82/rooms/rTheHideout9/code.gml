background_index[0]=backHideout
background_visible[0]=true

if global.gameProgress<=112
  global.gameProgress=113
if global.gameProgress<=114
  levelEvent=instance_create(0,0,oEvTheHideoutW1)

if global.currentBoss="Metallicardian"
{
  newBarrierL1=instance_create(208,272,oBossBarrier)
  newBarrierR1=instance_create(672,272,oBossBarrier)
  oPlayer1.x=384
  oPlayer1.y=336
  storeStatus(1)
  boss=instance_create(576,272,oMetallicardian)
  boss.image_xscale=-1
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
