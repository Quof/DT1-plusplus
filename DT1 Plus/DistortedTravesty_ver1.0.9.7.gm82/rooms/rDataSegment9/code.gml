background_hspeed[0]=-2
background_vspeed[0]=0.5
background_alpha[0]=0.2
background_xscale[0]=2
background_yscale[0]=2
background_visible[1]=1
background_alpha[1]=0
background_xscale[1]=0.5
background_yscale[1]=0.5

colorControl=instance_create(0,0,oColorIndControl)
colorControl.warnDelay=330
if global.gameProgress<=298
  global.gameProgress=299
gameEvent=instance_create(0,0,oEvDataSegmentW1)

if global.currentBoss="Data Collector"
{
  barrier1=instance_create(272,64,oBossBarrier)
  barrier1.image_yscale=3
  barrier2=instance_create(672,256,oBossBarrier)
  oPlayer1.x=480
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(480,176,oDataCollector)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
