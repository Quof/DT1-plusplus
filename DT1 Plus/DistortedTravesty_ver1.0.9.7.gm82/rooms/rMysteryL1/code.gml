global.location="Mystery Man Area"
oPlayer1.bUseBusterShot=1
if global.MMmysteryProg=0
  levelEvent=instance_create(0,0,oEvMetropolisConvo1)

if global.MMmysteryProg>=6
{
  newExit=instance_create(80,304,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}
light=instance_create(0,0,oWattLight)

if !SS_IsSoundLooping(global.msc_MMmystery)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
