oPlayer1.bUseBusterShot=1

gameEvent=instance_create(0,0,oEvMetropolisW1)
instance_deactivate_object(oObjectDispenser)

newBarrierL1=instance_create(112,208,oBossBarrier)
newBarrierR1=instance_create(544,208,oBossBarrier)
oPlayer1.x=240
oPlayer1.y=304
boss=instance_create(416,304,oKingMech)
boss.image_xscale=-1
boss.activateBoss=1
instance_activate_object(oObjectDispenser)

global.currentBoss="King Mech"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=11
