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
colorControl.warnDelay=300

barrier1=instance_create(272,64,oBossBarrier)
barrier1.image_yscale=3
barrier2=instance_create(672,256,oBossBarrier)
oPlayer1.x=480
oPlayer1.y=320
boss=instance_create(480,176,oDataCollector)
boss.activateBoss=1

global.currentBoss="Data Collector"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=22
