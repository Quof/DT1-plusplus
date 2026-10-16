backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backBRFort1
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=0.75
backFollowFore.depth=1499999

gameEvent=instance_create(0,0,oEvBRFW1)
view_object[0]=noone
view_xview[0]=544
oPlayer1.x=752
oPlayer1.y=304
boss=instance_create(928,176,oNecrobane)
boss.image_xscale=-1
boss.activateBoss=1

global.currentBoss="Necrobane"
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)

BREvent=instance_create(0,0,oEv_BossRush)
BREvent.type=14
