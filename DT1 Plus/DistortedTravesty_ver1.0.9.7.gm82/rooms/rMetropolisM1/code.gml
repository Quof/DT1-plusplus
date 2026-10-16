global.location="Metropolis"
oPlayer1.bUseBusterShot=1

backFollow=instance_create(0,0,oBackgroundFollow)
backFollow.type=2
backFollow.backSet=backMMintro
backFollow.xMoveScale=0.3
backFollow.yMoveScale=0.3
backFollow.depth=1499999

if global.gameProgress<=128
  global.gameProgress=129
if global.gameProgress=129
  levelEvent=instance_create(0,0,oEvMetropolisW1)

if !SS_IsSoundLooping(global.msc_MMintro)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
