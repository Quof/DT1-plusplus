background_hspeed[0]=-2
background_vspeed[0]=0.5
background_alpha[0]=0.2
background_xscale[0]=2
background_yscale[0]=2
background_hspeed[1]=-1
background_visible[2]=1
background_alpha[2]=0
background_xscale[2]=0.5
background_yscale[2]=0.5

if global.gameProgress<=319
  global.gameProgress=320
gameEvent=instance_create(0,0,oEvDataSegmentW1)

if global.currentBoss="Shroud Lord"
{
  barrier=instance_create(48,256,oBossBarrier)
  oPlayer1.x=208
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(256,208,oShroudLordLv2)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

if global.gameProgress=322
{
  oPlayer1.x=208
  oPlayer1.y=321
}
else if global.gameProgress=323
{
  barrier=instance_create(48,256,oBossBarrier)
  oPlayer1.x=208
  oPlayer1.y=321
}
