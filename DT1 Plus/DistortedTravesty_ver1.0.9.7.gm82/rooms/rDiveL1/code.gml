global.location="Dive Man Area"
oPlayer1.bUseBusterShot=1
oPlayer1.grav=0.6
oPlayer1.initialJumpAcc=-8
oPlayer1.jumpTimeTotal=35

levelEvent=instance_create(0,0,oEvMetropolisConvo1)
if global.MMdiveProg>=6
{
  newExit=instance_create(96,288,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}
if !SS_IsSoundLooping(global.msc_MMdive)
  stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
