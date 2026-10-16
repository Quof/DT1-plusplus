global.location="Napalm Man Area"
oPlayer1.bUseBusterShot=1

if global.MMnapalmProg>=6
{
  newExit=instance_create(64,256,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}
if !SS_IsSoundLooping(global.msc_MMnapalm)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
