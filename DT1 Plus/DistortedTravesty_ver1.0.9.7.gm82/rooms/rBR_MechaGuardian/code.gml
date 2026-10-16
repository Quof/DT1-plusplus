background_alpha[0]=0.9
background_visible[1]=1
background_alpha[1]=0
background_xscale[1]=0.5
background_yscale[1]=0.5

gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)

barrier=instance_create(512,0,oBossBarrier)
barrier.image_yscale=5
barrierTop=instance_create(1648,-320,oBossBarrier)
barrierTop.image_yscale=5
oPlayer1.x=1744
oPlayer1.y=320
oPlayer1.bUseBusterShot=1
bulletBarrier=instance_create(1344,320,oMisc)
bulletBarrier.sprite_index=sDTorsoLightning
bulletBarrier.image_xscale=0.75
bulletBarrier.image_yscale=5
bulletBarrier.image_speed=0.33
bulletBarrier.image_blend=c_green
bulletBarrier.image_alpha=0.4
bulletBarrier.type=1
boss=instance_create(1950,246,oMechaGuardian)
boss.activateBoss=1

global.currentBoss="Mecha Guardian"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=24
