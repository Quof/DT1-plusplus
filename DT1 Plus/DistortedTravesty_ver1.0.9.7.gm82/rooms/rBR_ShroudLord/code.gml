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

barrier=instance_create(48,256,oBossBarrier)
oPlayer1.x=208
oPlayer1.y=320
boss=instance_create(256,208,oShroudLordLv2)
boss.activateBoss=1

global.currentBoss="Shroud Lord"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=23
