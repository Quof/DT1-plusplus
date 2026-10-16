oPlayer1.bUseBusterShot=1

if global.gameProgress<=139
  global.gameProgress=140
bossEvent=instance_create(0,0,oEvMetropolisBoss)

if !SS_IsSoundLooping(global.msc_MMfort1)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
