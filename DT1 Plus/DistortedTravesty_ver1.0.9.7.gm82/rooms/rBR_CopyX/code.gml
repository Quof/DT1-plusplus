oPlayer1.bUseBusterShot=1

newBarrier=instance_create(240,256,oBossBarrier)
oPlayer1.x=384
oPlayer1.y=320
view_object[0]=noone
view_xview[0]=208
boss=instance_create(592,320,oCopyX)
boss.image_xscale=-1
boss.activateBoss=1
npcX=instance_create(416,320,oMisc)
npcX.sprite_index=sMegamanXKneel
npcX.image_speed=0
npcX.type=1

global.currentBoss="Copy X"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=12
