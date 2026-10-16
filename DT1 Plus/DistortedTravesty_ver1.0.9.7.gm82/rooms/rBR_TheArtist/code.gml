background_visible[1]=1
background_alpha[1]=0.4
tile_layer_delete(1000001)

gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)

oPlayer1.x=448
oPlayer1.y=304
boss=instance_create(544,240,oMitra)
boss.activateBoss=1

global.currentBoss="Mitra"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=25
