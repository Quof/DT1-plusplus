global.location="Fortress Area"
oPlayer1.bUseBusterShot=1

if global.gameProgress<=140
  global.gameProgress=141
if global.gameProgress<=142
  gameEvent=instance_create(0,0,oEvMetropolisW1)
instance_deactivate_object(oObjectDispenser)
if global.currentBoss="King Mech"
{
  var tempMplay;
  tempMplay=findMusic()
  newBarrierL1=instance_create(112,208,oBossBarrier)
  newBarrierR1=instance_create(544,208,oBossBarrier)
  oPlayer1.x=240
  oPlayer1.y=304
  storeStatus(1)
  boss=instance_create(416,304,oKingMech)
  boss.image_xscale=-1
  boss.activateBoss=1
  instance_activate_object(oObjectDispenser)
}
else
{
  if global.gameProgress>=143
  {
    if !SS_IsSoundLooping(global.msc_MMfort2)
      stopAllMusic()
    var tempMplay;
    tempMplay=global.msc_MMfort2
  }
  else
  {
    var tempMplay;
    tempMplay=global.msc_MMfort1
  }
}
playMusic(tempMplay,0)
