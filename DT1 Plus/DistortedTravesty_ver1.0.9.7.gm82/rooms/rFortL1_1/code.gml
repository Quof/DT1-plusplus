global.location="Fortress Area"
oPlayer1.bUseBusterShot=1

if global.gameProgress<=134
  global.gameProgress=135
if global.gameProgress<=136
{
  gameEvent=instance_create(0,0,oEvMetropolisW1)
  levelEvent=instance_create(0,0,oEvMetropolisConvo1)
}
if !SS_IsSoundLooping(global.msc_MMfort1)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
