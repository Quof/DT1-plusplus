global.location="Metropolis"
if global.showArea=true and global.gameProgress>=132
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Metropolis"
}

oPlayer1.bUseBusterShot=1

if global.gameProgress<=131
  global.gameProgress=132

if global.gameProgress>=134
{
  newExit=instance_create(248,272,oExit)
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rFortL1_1
}

screenEvent=instance_create(0,0,oEvMetropolisBoss)
levelEvent=instance_create(0,0,oEvMetropolisW1)

if !SS_IsSoundLooping(global.msc_MMstageSelect)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
